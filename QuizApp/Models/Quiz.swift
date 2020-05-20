//
//  Quiz.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

struct Quiz: Codable {
    let id: Int
    let title: String
    let description: String?
    let category: String
    let level: Int
    let image: String?
    let questions: [Question]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case level
        case description
        case category
        case questions
    }
    
    func categoryColor() -> UIColor {
        switch self.category {
        case "SPORTS":
            return UIColor(red:0.1, green:0.54, blue:0.1, alpha:1.0)
        case "SCIENCE":
            return UIColor(red:0.1, green:0.1, blue:0.54, alpha:1.0)
        default:
            return UIColor.black
        }
    }
}
