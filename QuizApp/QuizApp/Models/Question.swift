//
//  Question.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Question {
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

extension Question: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.question = try values.decode(String.self, forKey: .question)
        self.correctAns = try values.decode(Int.self, forKey: .correctAns)
        self.answers = try values.decode([String].self, forKey: .answers)
    }
}
