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
    let practice: Int
    let correctAnswer: Int
    let multiplier: Int
    let text: String
    
    init(id: Int, practice: Int) {
        self.id = id
        self.practice = practice
        multiplier = Int.random(in: 2...12)
        correctAnswer = self.practice * multiplier
        text = "What is \(self.practice) X \(multiplier)?"
    }
}
