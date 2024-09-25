//
//  DateFormatterTests.swift
//  DatePickerAssigmentTests
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation
import XCTest
@testable import DatePickerAssigment

final class DateFormatterTests: XCTestCase {
    func testFormatDateToString() throws {
        XCTAssertEqual(DateFormatter.customDateFormatter.string(from: Date(timeIntervalSince1970: 60)), "1970-01-01 01:01")
    }

    func testFormatStringToDate() throws {
        XCTAssertEqual(DateFormatter.customDateFormatter.date(from: "1970-01-01 01:01"), Date(timeIntervalSince1970: 60))
    }
}
