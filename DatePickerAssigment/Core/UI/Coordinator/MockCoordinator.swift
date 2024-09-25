//
//  MockCoordinator.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation
import UIKit

class MockCoordinator: CheckinCoordinatorProtocol {
    var spy = Spy()
    var children: [Coordinator] = []

    var navigationController = UINavigationController()

    func start() {
        spy.didStartWasCalled?()
    }

    func navigateToDateSelection() {
        spy.didNavigateToDateSelectionWasCalled?()
    }
}

extension MockCoordinator {
    struct Spy {
        var didStartWasCalled: (() -> Void)?
        var didNavigateToDateSelectionWasCalled: (() -> Void)?
    }

}
