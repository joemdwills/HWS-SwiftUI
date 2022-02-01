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
                        }
                        .frame(maxWidth: 250, maxHeight: 150)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
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
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        attempts = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
