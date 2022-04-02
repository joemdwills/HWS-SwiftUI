//
//  Quiz.swift
//  Edutainment
//
//  Created by Joe Williams on 19/03/2022.
//

import Foundation

class Quiz: ObservableObject {
    var questions: [Question]
    var result: Int
    var count: Int
    
    init(questions: [Question], result: Int, count: Int) {
        self.questions = questions
        self.result = result
        self.count = count
    }
}
