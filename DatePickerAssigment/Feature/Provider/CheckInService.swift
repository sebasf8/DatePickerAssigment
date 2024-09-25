//
//  CheckInService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

struct CheckinService: CheckinProvider {
    func getCheckin() async throws -> CheckinModel {
        // try to get db data else get internet default checkin
        try await CheckinEndpoint.getCheckinDateTime().convert()
    }
}
