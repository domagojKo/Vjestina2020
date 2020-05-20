//
//  Question.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Question: Codable {
    let id: Int
    let question: String
    let answers: [String]
    let correctAns : Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case answers
        case correctAns = "correct_answer"
    }
}
