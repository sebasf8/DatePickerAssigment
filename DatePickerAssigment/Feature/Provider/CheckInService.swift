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
        let checkins = try? fetchPersistedCheckins()

        guard let mostRecentCheckin = checkins?.last else {
            return try await CheckinEndpoint.getCheckinDateTime().convert()
        }

        return mostRecentCheckin
    }

    func save(checkin: CheckinModel) throws {
        let employee = Employee(context: coreDataStack.persistentContainer.viewContext)

        employee.check_in_date_time = DateFormatter.customDateFormatter.string(from: checkin.dateTime)
        try coreDataStack.save()
    }
}

private extension CheckinService {
    func fetchPersistedCheckins() throws -> [CheckinModel] {
        try coreDataStack.persistentContainer.viewContext.fetch(Employee.fetchRequest())
            .compactMap { employee -> CheckinModel? in
                guard
                    let dateTime = employee.check_in_date_time,
                    let date = DateFormatter.customDateFormatter.date(from: dateTime)
                else {
                    return nil
                }

                return CheckinModel(dateTime: date)
            }
            .sorted { $0.dateTime < $1.dateTime }
    }
}
