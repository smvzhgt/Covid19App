//
//  CoreDataStack.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Initializers
    static let shared = CoreDataStack()
    
    
    // MARK: - Initializers
    private init() {}
    
    
    // MARK: - Public Properties
    lazy var managedContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
    // MARK: - Private Properties
    private let modelName: String = "Covid19App"
    
    
    // MARK: - Public Functions
    func saveContext () {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
}
