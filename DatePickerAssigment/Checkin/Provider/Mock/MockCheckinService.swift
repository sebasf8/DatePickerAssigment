//
//  MockCheckinService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class MockCheckinService: CheckinProvider {
    var spy = Spy()
    var error: Error?

    func getCheckin() async throws -> CheckinModel {
        if let error { throw error }

        return CheckinModel(dateTime: Date(timeIntervalSince1970: 0))
    }

    func save(checkin: CheckinModel) throws {
        if let error { throw error }

        spy.didCallSave?()
    }
}

extension MockCheckinService {
    class Spy {
        var didCallSave: (() -> Void)?
    }
}

enum MockError: Error {
    case unexpectedError
}
