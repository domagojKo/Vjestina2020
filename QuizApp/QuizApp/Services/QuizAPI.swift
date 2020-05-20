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
    typealias FetchImage = (UIImage?) -> Void
    
    static let instance = QuizAPI()
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
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
    
    func fetchQuizImage(imageUrl: String?, completion: @escaping FetchImage){
        if let imageFromCache = imageCache.object(forKey: imageUrl as AnyObject) as? UIImage {
            completion(imageFromCache)
            return
        }
        
        guard let imageUrlString = imageUrl else {
            completion(nil)
            return
        }
        if let url = URL(string: imageUrlString) {
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
    }
}

