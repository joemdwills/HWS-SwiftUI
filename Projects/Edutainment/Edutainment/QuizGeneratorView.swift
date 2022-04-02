//
//  ContentView.swift
//  Edutainment
//
//  Created by Joe Williams on 14/02/2022.
//

import SwiftUI

//@State private var askSettings = false

//struct SettingsView: View {
//    var body: some View {
//
//    }
//}


struct QuizGeneratorView: View {
    // State of app
    @State private var showQuestions = false
    
    // Settings
    @State private var timestable = 2
    @State private var questionAmount = 5
    @State private var answer = ""
    
    @State private var questions = [Question]()
    @State var questionInt = 0
    

    var body: some View {
        NavigationView {
//            Form {
//                if questions.isEmpty {
//                    VStack {
//                        Section {
//                            Stepper("\(timestable)", value: $timestable, in: 2...13, step: 1)
//                        } header: {
//                            Text("Number to practice")
//                        }
//                        
//                        Section("Pick the number of questions") {
//                            Stepper("\(questionAmount)", value: $questionAmount, in: 5...20, step: 5)
//                        }
//                        Spacer()
//                        Button("Create Questions") {
//                            createQuestions()
//                        }
//                        Spacer()
//                    }
//                } else {
//                    List(questions) { question in
//                        NavigationLink {
//                            QuestionView(question: question)
//                        } label: {
//                        Text("Question \(question.id + 1)")
//                        }
//                        
//                    }
//                    .background(.white)
//                }
//                
//            }
            VStack {
                Section {
                    Stepper("\(timestable)", value: $timestable, in: 2...13, step: 1)
                } header: {
                    Text("Number to practice")
                }
                
                Section("Pick the number of questions") {
                    Stepper("\(questionAmount)", value: $questionAmount, in: 5...20, step: 5)
                }
                Spacer()
                Button("Create Questions") {
                    createQuestions()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Edutainment")
            .toolbar {
                ToolbarItem {
                    Button("Reset") {
                        reset()
                    }
                }
            }
        }
    }

    func createQuestions() {
        for id in 0..<questionAmount {
            let question = Question(id: id, practice: timestable)
            questions.insert(question, at: questions.endIndex)
            print(question.text)
            print("Correct Answer is: \(question.correctAnswer)")
        }
//        print(questionInt)
//        print(questions.startIndex)
//        print(questions[0].text)
//        print(questions[1].text)
//        print(questions[2].text)
//        print(questions[3].text)
//        print(questions[4].text)
//        print(questions[1])

        showQuestions = true
    }
    
    func reset() {
        questions.removeAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizGeneratorView()
    }
}
