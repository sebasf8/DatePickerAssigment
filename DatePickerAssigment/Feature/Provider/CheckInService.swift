//
//  CheckInService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class CheckinService: CheckinProvider {
    private lazy var coreDataStack = DependencyContainer.shared.coreDataStack

    func getCheckin() async throws -> CheckinModel {
        // try to get db data else get internet default checkin


        try await CheckinEndpoint.getCheckinDateTime().convert()
    }

    func save(checkin: CheckinModel) throws {
        let employee = Employee(context: coreDataStack.persistentContainer.viewContext)

        employee.check_in_date_time = DateFormatter.customDateFormatter.string(from: checkin.dateTime)
        try coreDataStack.save()
    }
}
