//
//  CheckinTestCase.swift
//  DatePickerAssigmentTests
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation
import XCTest
@testable import DatePickerAssigment

class CheckinTestCase: XCTestCase {
    override func setUpWithError() throws {
        DependencyContainer.registerDependencies(container: MockContainer())
    }
}
