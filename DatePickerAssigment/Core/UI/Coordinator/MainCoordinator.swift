//
//  MainCoordinator.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import UIKit
import SwiftUI

final class MainCoordinator: Coordinator {
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard let vc = HomeViewController(coordinator: self, companyService: DependencyContainer.shared.companyService) else {
            preconditionFailure("No view was initialized")
        }

        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: CheckinCoordinatorProtocol {
    func navigateToDateSelection() {
        let vc = UIHostingController(rootView: DateSelectionView(viewModel: DateSelectionViewModel()))
        navigationController.pushViewController(vc, animated: true)
    }
}
