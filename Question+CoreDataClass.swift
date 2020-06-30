//
//  Question+CoreDataClass.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Question)
public class Questionn: NSManagedObject {
    
    convenience init?(dict: [String : Any], context: NSManagedObjectContext) {
        guard let id = dict["id"] as? Int16,
        let question = dict["question"] as? String,
        let answers = dict["answers"] as? [String],
        let correctAnswer = dict["correct_answer"] as? Int16 else { return nil }
        
        self.init(context: context)
        
        self.id = id
        self.question = question
        self.correctAns = correctAnswer
        
        self.addAnswers(answers: answers, context: context)
    }

    func addAnswers(answers: [String], context: NSManagedObjectContext) {
        for (index, answerStr) in answers.enumerated() {
            let answer = Answer.init(answer: answerStr, index: index, context: context)
            self.addToAnswers(answer)
        }
    }
}
