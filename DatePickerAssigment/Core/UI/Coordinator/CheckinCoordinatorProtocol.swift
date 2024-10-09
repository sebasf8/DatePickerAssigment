//
//  FeatureCoordinator.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import UIKit
import SwiftUI

@objc protocol CheckinCoordinatorProtocol: Coordinator {
    func navigateToDateSelection()
}
