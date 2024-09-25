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
        let vc = HomeViewController(homeViewModel: HomeViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: FeatureCoordinatorProtocol {
    func navigateToDateSelection() {
        let vc = UIHostingController(rootView: DateSelectionView(viewModel: DateSelectionViewModel()))
        navigationController.pushViewController(vc, animated: true)
    }
}
