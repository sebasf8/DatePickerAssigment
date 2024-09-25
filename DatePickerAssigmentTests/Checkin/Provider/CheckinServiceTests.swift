//
//  CheckinServiceTests.swift
//  DatePickerAssigmentTests
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation
import XCTest
@testable import DatePickerAssigment

class CheckinServiceTests: CheckinTestCase {
    func testGetCheckinFirstRun() async throws {
        let today = DateFormatter.customDateFormatter.string(from: .now).prefix("yyyy-MM-dd".count)
        let checkinDateTime = DateFormatter.customDateFormatter.date(from: "\(today) 06:30")

        let checkin = try await CheckinService().getCheckin()

        XCTAssertEqual(checkin.dateTime, checkinDateTime)
    }

    func testGetCheckinFromDatabase() async throws {
        let checkinDateTime = Date(timeIntervalSince1970: 60)

        let persistentContainer = DependencyContainer.shared.coreDataStack.persistentContainer
        let employee = Employee(context: persistentContainer.viewContext)

        employee.check_in_date_time = DateFormatter.customDateFormatter.string(from: checkinDateTime)

        try DependencyContainer.shared.coreDataStack.save()

        let checkin = try await CheckinService().getCheckin()

        XCTAssertEqual(checkin.dateTime, checkinDateTime)
    }
}
