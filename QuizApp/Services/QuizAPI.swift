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
    
    static let instance = QuizAPI()
    
    func fetchQuizzes(completion: @escaping FetchQuizzesCompletion){
        guard let url = URL(string: "https://iosquiz.herokuapp.com/api/quizzes") else {
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
}

