//
//  Answer+CoreDataProperties.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData


extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var answer: String?
    @NSManaged public var index: Int16
    @NSManaged public var question: Questionn?

}
