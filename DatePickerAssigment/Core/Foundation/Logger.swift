//
//  Logger.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

protocol Logger {

    /// Logs a message
    /// - Parameter message: message to register.
    func log(_ message: String)


    /// Logs an error
    /// - Parameter error: Error to register.
    func log(_ error: Error)

}
