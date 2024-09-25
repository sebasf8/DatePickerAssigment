//
//  HomeViewModel.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//
import Foundation

class HomeViewModel: ObservableObject {
    private let coordinator: FeatureCoordinatorProtocol

    init(coordinator: FeatureCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func startButtonTapped() {
        coordinator.navigateToDateSelection()
    }
}
