//
//  MockContainer.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import CoreData

class MockContainer: Container {
    var checkinService: CheckinProvider = MockCheckinService()
    var companyService: CompanyProvider = MockCompanyService()
    var logger: any Logger = PrintLogger()
    var coreDataStack = CoreDataStack.shared
    
    init() {
        let container = NSPersistentContainer(name: "DatePickerAssigment")
        
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load stores: \(error), \(error.userInfo)")
            }
        })
        
        coreDataStack.persistentContainer = container
    }
}
