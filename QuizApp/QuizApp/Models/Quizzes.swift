//
//  Quizzes.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Quizzes {
    let quizzes: [Quiz]
    
    enum CodingKeys: String, CodingKey{
        case quizzes
    }

    func categories() -> [String] {
        let categories = quizzes.map{ quiz  in
            return quiz.category
        }
        let uniqueCategories = Array(Set(categories))
        return uniqueCategories
    }
}

extension Quizzes: Decodable {
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.quizzes = try values.decode([Quiz].self, forKey: .quizzes)
    }
}
