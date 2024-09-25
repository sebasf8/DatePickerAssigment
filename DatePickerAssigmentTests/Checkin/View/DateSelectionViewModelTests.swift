//
//  DateSelectionViewModelTests.swift
//  DatePickerAssigmentTests
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

import Foundation
import XCTest
@testable import DatePickerAssigment

class DateSelectionViewModelTests: CheckinTestCase {
    func testLoadSuccessfully() async throws {
        let viewModel = DateSelectionViewModel()
        await viewModel.load()

        XCTAssertEqual(viewModel.state, .ready)
        XCTAssertEqual(viewModel.validationErrorMessage, "")
        XCTAssertEqual(viewModel.selectedDate, Date(timeIntervalSince1970: 0))
    }

    func testLoadWithError() async throws {
        let service = DependencyContainer.shared.checkinService as? MockCheckinService
        service?.error = MockError.unexpectedError

        let viewModel = DateSelectionViewModel()
        await viewModel.load()

        XCTAssertEqual(viewModel.state, .error)
    }

    func testUpdateSelectedDateInTheFuture() async {
        let viewModel = DateSelectionViewModel()
        viewModel.selectedDate = .distantFuture

        XCTAssertTrue(viewModel.validationErrorMessage.isEmpty)

        await viewModel.updateSelectedDate()

        XCTAssertFalse(viewModel.validationErrorMessage.isEmpty)
    }

    func testUpdateSelectedDateInThePast() async {
        let expectation = expectation(description: #function)
        let service = DependencyContainer.shared.checkinService as? MockCheckinService
        service?.spy.didCallSave = { expectation.fulfill() }

        let viewModel = DateSelectionViewModel()
        viewModel.selectedDate = .distantPast

        await viewModel.updateSelectedDate()

        await fulfillment(of: [expectation], timeout: 0.01)
        XCTAssertTrue(viewModel.validationErrorMessage.isEmpty)
    }
}
