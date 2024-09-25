//
//  DefaultLogger.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

struct PrintLogger: Logger {
    func log(_ message: String) {
        print(message)
    }

    func log(_ error: Error) {
        print(error.localizedDescription)
    }
}
