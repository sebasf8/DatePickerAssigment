//
//  HomeViewModel.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//
import Foundation

class HomeViewModel: ObservableObject {
    @Published private(set) var companyName: String = ""

    private let coordinator: FeatureCoordinatorProtocol

    init(coordinator: FeatureCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    @MainActor
    func load() {
        companyName = (try? DependencyContainer.shared.companyService.fetchCompany().name) ?? ""
    }

    func startButtonTapped() {
        coordinator.navigateToDateSelection()
    }
}
