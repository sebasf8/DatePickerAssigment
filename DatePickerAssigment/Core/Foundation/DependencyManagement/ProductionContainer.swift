//
//  ProductionContainer.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class ProductionContainer: Container {
    var logger: Logger = PrintLogger()
    var checkinService: CheckinProvider = CheckinService()
    var companyService: CompanyProvider = CompanyService()
    var coreDataStack = CoreDataStack.shared
}
