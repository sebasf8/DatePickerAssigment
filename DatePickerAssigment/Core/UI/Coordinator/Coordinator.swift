//
//  Coordinator.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import UIKit

/// Control the navigation flow of the app or module
@objc protocol Coordinator {
    var children: [Coordinator] { get }

    var navigationController: UINavigationController { get }

    /// Initialise the flow for this coordinator
    func start()
}
