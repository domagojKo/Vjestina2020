//
//  Quizzes.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Quizzes: Codable {
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
