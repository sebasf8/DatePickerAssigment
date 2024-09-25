//
//  CoreDataManager.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DatePickerAssigment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                preconditionFailure("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private init() {}

    func save() throws {
        let context = persistentContainer.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                DependencyContainer.shared.logger.log(error)
                throw error
            }
        }
    }
}
