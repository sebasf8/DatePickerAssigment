//
//  MockContainer.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class MockContainer: Container {
    var checkinService: CheckinProvider = MockCheckinService()
    var logger: any Logger = PrintLogger()
    var coreDataStack = CoreDataStack.shared
}
