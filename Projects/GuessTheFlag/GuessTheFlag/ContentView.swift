//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Joe Williams on 30/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingFinalAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var attempts = 0
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 0/255, green: 102/255, blue: 255/255),
                Color(red: 255/255, green: 122/255, blue: 0/255)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
//                        Text("Tap the flag of")
//                            .font(.subheadline.weight(.light))
//                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 75)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 20)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .shadow(radius: 5)
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                        .padding()
//                        .frame(maxWidth: 250, maxHeight: 150)
//                        .background(.regularMaterial)
//                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(alertMessage)
            }
            .alert(alertTitle, isPresented: $showingFinalAlert) {
                Button("Reset Game", action: resetGame)
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        attempts += 1
        
        if attempts == 10 {
            checkFlag(number)
            alertMessage = "Final score: \(score)/10"
            showingFinalAlert = true
        } else {
            checkFlag(number)
            showingAlert = true
        }
    }
    
    func checkFlag(_ number: Int) {
        if number == correctAnswer {
            score += 1
            alertTitle = "Correct"
            alertMessage = "Current score: \(score)/\(attempts)"
        } else {
            alertTitle = "Wrong"
            alertMessage = "That's the flag of \(countries[number])"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        score = 0
        attempts = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
