//
//  Question'.swift
//  Quiz-App
//
//  Created by MAC on 04/11/2025.
//

import Foundation
struct Question {
    let question : String
    let options : [String]
    let answer : String
    init(question: String, options: [String], answer: String) {
        self.question = question
        self.options = options
        self.answer = answer
    }
}


