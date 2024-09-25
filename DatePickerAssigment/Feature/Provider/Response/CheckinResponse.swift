//
//  CheckInResponse.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

struct CheckinResponse: Decodable {
    let dateTime: String

    func convert() -> CheckinModel {
        guard let date = DateFormatter.customDateFormatter.date(from: dateTime) else {
            return CheckinModel(dateTime: .now)
        }

        return CheckinModel(dateTime: date)
    }
}
