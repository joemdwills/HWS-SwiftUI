//
//  Question.swift
//  Edutainment
//
//  Created by Joe Williams on 16/02/2022.
//

import Foundation
import SwiftUI

class Question: Identifiable, ObservableObject {
    let id: Int
    let practiceNumber: Int
    let correctAnswer: Int
    let multiplier: Int
    let text: String
    let result: Bool
    
    init(id: Int, practice: Int) {
        self.id = id
        self.practiceNumber = practice
        multiplier = Int.random(in: 2...12)
        correctAnswer = self.practiceNumber * multiplier
        text = "What is \(self.practiceNumber) X \(multiplier)?"
        result = false
    }
}
