//
//  Answer+CoreDataClass.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Answer)
public class Answer: NSManagedObject {
    
    convenience init(answer: String, index: Int, context: NSManagedObjectContext) {
        self.init(context: context)
        self.answer = answer
        self.index = Int16(index)
    }
}
