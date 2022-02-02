//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Joe Williams on 02/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var attempts = 0
    @State private var appMove = Int.random(in: 0...2)
    @State private var showAlert = false
    @State private var showFinalAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var moves = ["🪨", "🗞️", "✂️"]
    @State private var shouldWin = Bool.random()
    var red = UIColor(red: 200/255, green: 0, blue: 0, alpha: 0.5)
    var green = UIColor(red: 0, green: 200/255, blue: 25/255, alpha: 0.5)
    
    var body: some View {
        ZStack {
            Color(shouldWin ? green : red)
                .ignoresSafeArea()
                
            VStack {
                Spacer()
                Text("Score: \(score)")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(shouldWin ? "Win" : "Lose")
                    .font(.system(size: 75))
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("Against:")
                
                Text(moves[appMove])
                    .font(.system(size: 200))
                    .frame(width: 250, height: 250)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
                
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button {
                            moveTapped(move)
                        } label: {
                            Text(move)
                        }
                        .font(.system(size: 75))
                        .frame(width: 100, height: 100)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .alert(alertTitle, isPresented: $showAlert) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(alertMessage)
            }
            .alert(alertTitle, isPresented: $showFinalAlert) {
                Button("Reset Game", action: resetGame)
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func askQuestion() {
        moves.shuffle()
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func resetGame() {
        score = 0
        attempts = 0
        askQuestion()
    }
    
    func moveTapped(_ answer: String) {
        attempts += 1
        if attempts == 10 {
            checkMove(answer)
            alertMessage = "Final Score: \(score)/\(attempts)"
            showFinalAlert = true
        } else {
            checkMove(answer)
            showAlert = true
        }
    }
    
    
    func checkMove(_ move: String) {
        if moves[appMove] == move {
            alertTitle = "Incorrect"
            alertMessage = "It's a draw!\nScore: \(score)/\(attempts)"
        } else {
            if shouldWin {
                if move == "🪨" && moves[appMove] == "✂️" {
                    correctMove()
                } else if move == "🗞️" && moves[appMove] == "🪨" {
                    correctMove()
                } else if move == "✂️" && moves[appMove] == "🗞️" {
                    correctMove()
                } else {
                    incorrectMove()
                }
            } else if !shouldWin {
                if move == "✂️" && moves[appMove] == "🪨" {
                    correctMove()
                } else if move == "🪨" && moves[appMove] == "🗞️" {
                    correctMove()
                } else if move == "🗞️" && moves[appMove] == "✂️" {
                    correctMove()
                } else {
                    incorrectMove()
                }
            }
        }
    }
    
    func correctMove() {
        score += 1
        alertTitle = "Correct"
        alertMessage = "Score: \(score)/\(attempts)"
    }
    
    func incorrectMove() {
        score -= 1
        alertTitle = "Incorrect"
        alertMessage = "Score: \(score)/\(attempts)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
