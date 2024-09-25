//
//  HomeViewModelTests.swift
//  DatePickerAssigmentTests
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

import Foundation
import XCTest
@testable import DatePickerAssigment

class HomeViewModelTests: XCTestCase {
    /// Tests that the coordinator method was actually called.
    func testStartButtonTapped() {
        let expectation = expectation(description: #function)
        let mockCoordinator = MockCoordinator()
        mockCoordinator.spy.didNavigateToDateSelectionWasCalled = expectation.fulfill

        let viewModel = HomeViewModel(coordinator: mockCoordinator)
        viewModel.startButtonTapped()

        waitForExpectations(timeout: 0.01)
    }
}
