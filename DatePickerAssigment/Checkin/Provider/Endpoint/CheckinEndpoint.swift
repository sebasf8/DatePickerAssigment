//
//  checkinDateTimeEndpoint.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

struct CheckinEndpoint {
    static func getCheckinDateTime() async throws -> CheckinResponse {
        await Task {
            sleep(1)
            let today = DateFormatter.customDateFormatter.string(from: .now).prefix("yyyy-MM-dd".count)

            // I would call an generic URLRequest abstraction. Example I use in other personal projects https://github.com/sebasf8/Networking
            return CheckinResponse(dateTime: "\(today) 06:30")
        }.value
    }
}
