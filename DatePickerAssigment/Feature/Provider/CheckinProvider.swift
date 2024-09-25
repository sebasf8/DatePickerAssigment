//
//  CheckInProvider.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

/// Repository of Checkin model
protocol CheckinProvider {

    /// In charge to get the last checkin time for the employee, if there is no records locally will get the default time from our servers.
    ///
    /// - Returns: The default checkin time for the employee
    func getCheckin() async throws -> CheckinModel
}
