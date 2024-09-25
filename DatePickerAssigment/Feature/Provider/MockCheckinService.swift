//
//  MockCheckinService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

struct MockCheckinService: CheckinProvider {
    func getCheckin() async throws -> CheckinModel {
        CheckinModel(dateTime: .now)
    }
}
