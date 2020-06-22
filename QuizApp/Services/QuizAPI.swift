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
    typealias RankingCompletion = ([Rank]?, Error?) -> Void
    
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
        
        //data task baca na background dretvu
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
    
    func fetchRank(quizId: Int, completion: @escaping RankingCompletion) {
        guard let url = URL(string: rankAPI + "\(quizId)") else {
            print("Error!!")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else {
            completion(nil, nil)
            return
        }
        
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    completion(nil, error)
                    return
            }
            do {
                let decoder = JSONDecoder()
                let rankModel = try decoder.decode([Rank].self, from:
                    dataResponse)
                completion(rankModel, nil)
            } catch let parsingError {
                print("Error", parsingError)
                completion(nil, parsingError)
            }
        }
        task.resume()
    }
}

