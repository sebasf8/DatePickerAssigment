//
//  Container.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

protocol Container {
    var logger: Logger { get }
    var checkinService: CheckinProvider { get }
    var coreDataStack: CoreDataStack { get }
}
