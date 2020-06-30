//
//  CoreDataStack.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 27/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let instance = CoreDataStack()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Quiz")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("CORE DATA - Saving Context")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var quizzes: [Quizz]? {
        let request: NSFetchRequest<Quizz> = Quizz.fetchRequest()
        guard let quizzes = try? context.fetch(request) else { return nil }
        return quizzes
    }
}
