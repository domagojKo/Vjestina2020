//
//  Quiz+CoreDataProperties.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 29/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//
//

import Foundation
import CoreData


extension Quizz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quizz> {
        return NSFetchRequest<Quizz>(entityName: "Quiz")
    }

    @NSManaged public var category: String?
    @NSManaged public var descriptionn: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var level: Int16
    @NSManaged public var title: String?
    @NSManaged public var questions: NSSet?

}

// MARK: Generated accessors for questions
extension Quizz {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Questionn)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Questionn)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}
