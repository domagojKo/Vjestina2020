//
//  Question+CoreDataProperties.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData


extension Questionn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questionn> {
        return NSFetchRequest<Questionn>(entityName: "Question")
    }

    @NSManaged public var correctAns: Int16
    @NSManaged public var id: Int16
    @NSManaged public var question: String?
    @NSManaged public var answers: NSSet?
    @NSManaged public var quiz: Quizz?

}

// MARK: Generated accessors for answers
extension Questionn {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: Answer)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: Answer)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}
