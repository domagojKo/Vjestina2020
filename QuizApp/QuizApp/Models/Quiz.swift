//
//  Quiz.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

struct Quiz{
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

extension Quiz: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decodeIfPresent(String.self, forKey: .description)
        self.category = try values.decode(String.self, forKey: .category)
        self.level = try values.decode(Int.self, forKey: .level)
        self.image = try values.decodeIfPresent(String.self, forKey: .image)
        self.questions = try values.decode([Question].self, forKey: .questions)
    }
}
