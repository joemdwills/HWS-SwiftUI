//
//  QuestionView.swift
//  Edutainment
//
//  Created by Joe Williams on 20/02/2022.
//

import SwiftUI

struct QuestionView: View {
    // Environment
    @Environment(\.dismiss) var dismiss
    @StateObject var question: Question
    
    // Screen Values
    @State private var submittedAnswer = ""
    @State private var checkedAnswer = false
    @State private var result = ""
    
    var body: some View {
        VStack {
            Text("Question \(question.id + 1):")
                .font(.largeTitle)
                .fontWeight(.light)
            Spacer()
            Text(question.text)
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter Answer", text: $submittedAnswer)
                .keyboardType(.decimalPad)
                .padding()
            
            if !checkedAnswer {
                Button("Submit") {
                    checkAnswer()
                }
            } else {
                Text(result)
                    .foregroundColor(result == "Correct" ? .green : .red)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
    }
    
    func checkAnswer() {
        checkedAnswer = true
        if Int(submittedAnswer) == question.correctAnswer {
            result = "Correct"
        } else {
            result = "Incorrect"
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question(id: 0, practice: 3))
    }
}
