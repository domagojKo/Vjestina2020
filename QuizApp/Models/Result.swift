//
//  Result.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

struct Result: Codable {
    var quiz_id: Int?
    var user_id: Int?
    var time: Double?
    var no_of_correct: Int?
}
