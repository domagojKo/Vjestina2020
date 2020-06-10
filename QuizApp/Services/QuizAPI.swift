//
//  QuizAPI.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import UIKit

class QuizAPI {
    typealias FetchQuizzesCompletion = (Quizzes?, Error?) -> Void
    typealias SendResultCompletion = (ServerResponse?, Error?) -> Void
    
    static let instance = QuizAPI()
    
    func fetchQuizzes(completion: @escaping FetchQuizzesCompletion){
        guard let url = URL(string: fetchQuizzesAPI) else {
            completion(nil,nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    completion(nil, error)
                    return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(Quizzes.self, from:
                    dataResponse)
                completion(dataModel, nil)
            } catch let parsingError {
                print("Errorrrrr!")
                completion(nil, parsingError)
            }
        }
        task.resume()
    }
    
    func sendQuizResult(result: Result, completion: @escaping SendResultCompletion) {
        guard let url = URL(string: sendResultsAPI) else {
            completion(nil,nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else {
            completion(nil, nil)
            return
        }
        
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        guard let jsonResult = try? encoder.encode(result) else {
            fatalError("JSON result needs to exist at this point")
        }
        
        request.httpBody = jsonResult

        let task = URLSession.shared.dataTask(with: request) { (_, response, error) in
            guard let response = response as? HTTPURLResponse,
                error == nil else {
                    completion(nil, error)
                    return
            }
            
            if let responseStatusCode = ServerResponse(rawValue: response.statusCode) {
                completion(responseStatusCode,nil)
            }
        }
        task.resume()
    }
}

