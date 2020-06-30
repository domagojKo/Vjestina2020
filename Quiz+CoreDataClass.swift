//
//  Quiz+CoreDataClass.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Quiz)
public class Quizz: NSManagedObject {
    
    convenience init?(dict: [String : Any], context: NSManagedObjectContext) {
        guard let title = dict["title"] as? String,
            let description = dict["description"] as? String,
            let category = dict["category"] as? String,
            let image = dict["image"] as? String,
            let id = dict["id"] as? Int16,
            let level = dict["level"] as? Int16,
            let questionsData = dict["questions"] as? [[String: Any]] else { return nil }
        
        self.init(context: context)
        
        self.title = title
        self.descriptionn = description
        self.category = category
        self.image = image
        self.id = id
        self.level = level
        
        self.addQuestionsData(questions: questionsData)
    }
    
    func addQuestionsData(questions: [[String: Any]]) {
        let questionsData = questions.compactMap { Questionn(dict: $0, context: CoreDataStack.instance.context )}
        questionsData.forEach { question in
            self.addToQuestions(question)
        }
    }

}
