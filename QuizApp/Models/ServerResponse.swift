//
//  ServerResponse.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

enum ServerResponse: Int {
    case unautharized = 401
    case forbidden = 403
    case notFound = 404
    case badRequest = 400
    case ok = 200
    
    var stringServerResponse: String {
        switch self {
        case .unautharized:
            return "401 no token found"
        case .forbidden:
            return "403 token doesn't match the user id"
        case .notFound:
            return "404 quiz id not found"
        case .badRequest:
            return "400 time isn't a Double, score isn't an Int"
        case .ok:
            return "200 success"
        }
    }
}
