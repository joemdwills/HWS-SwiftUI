//
//  ContentView.swift
//  WordScramble
//
//  Created by Joe Williams on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    // Word properties
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // Score
    @State private var score = 0
    @State private var submittedWords = 0
    
    
    // Error properties
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    struct Answer {
        var text: String
        var color: UIColor
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    Text("Score: \(score)")
                        .font(.headline)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(word)")
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .toolbar {
                ToolbarItem {
                    Button("Reset Game") {
                        startGame()
                    }
                }
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 2 else {
            wordError(title: "Word too small", message: "Each word guessed must be 3 letters or greater")
            return
        }
        guard answer != rootWord else {
            wordError(title: "Copycat!", message: "That word is just the word to guess from.")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible!", message: "You can't spell that word from '\(rootWord)!'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make them up, you know!")
            return
        }
        
        submittedWords += 1
        score += (answer.count * submittedWords)
//        var color = .red
//
//        switch answer.count {
//        case 3:
//            color = .red
//        case 4:
//            color = .green
//
//        }
        
        withAnimation {
//            let submit = Answer(text: answer, color: color)
            usedWords.insert(answer, at: 0)
            newWord = ""
        }
        
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func startGame() {
        usedWords.removeAll()
        score = 0
        submittedWords = 0
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
