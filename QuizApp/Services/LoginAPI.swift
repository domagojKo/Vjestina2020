//
//  LoginAPI.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 06/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation

class LoginAPI {
    typealias FetchTokenCompletion = ((Token?, Error?) -> Void)
    
    static let instance = LoginAPI()
    
    func fetchToken(username: String, password: String, completion: @escaping FetchTokenCompletion) {
        guard let url = URL(string: "https://iosquiz.herokuapp.com/api/session") else {
            completion(nil, nil)
            return
        }
        
        let parameter = ["username" : username, "password" : password]
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {
            return
        }
        
        request.httpBody = httpBody
       
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data,
                let _ = response as? HTTPURLResponse,
                error == nil else {
                    completion(nil, error)
                    return
            }
           
           do {
               let decoder = JSONDecoder()
               let model = try decoder.decode(Token.self, from:
                   data)
               completion(model, nil)
           } catch let parsingError {
               print("Errorrrrrrr!")
               completion(nil, parsingError)
           }
       }
       task.resume()
    }
}
