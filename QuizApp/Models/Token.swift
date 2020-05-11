//
//  Token.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 05/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Token {
    let token: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case token
        case id = "user_id"
    }
}

extension Token: Decodable {
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try values.decode(String.self, forKey: .token)
        self.id = try values.decode(Int.self, forKey: .id)
    }
}
