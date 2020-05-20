//
//  Token.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 05/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Token: Codable {
    let token: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case token
        case id = "user_id"
    }
}
