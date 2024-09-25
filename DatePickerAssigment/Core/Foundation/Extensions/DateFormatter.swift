//
//  CustomDateFormatter.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

extension DateFormatter {
    /// Date Formatter is expensive to initialise, for performance is better to do it only once if the app makes a lot of formatting.
    static var customDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return dateFormatter
    }()
}
