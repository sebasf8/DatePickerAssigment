//
//  HomeViewModel.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//
import Foundation

class HomeViewModel: ObservableObject {
    @Published private(set) var greetings: String = ""

    private let coordinator: CheckinCoordinatorProtocol

    init(coordinator: CheckinCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    @MainActor
    func load() {
        guard let companyName = try? DependencyContainer.shared.companyService.fetchCompany().name else { return }

        greetings = "Welcome to Checkin app, an \(companyName) product"
    }

    func startButtonTapped() {
        coordinator.navigateToDateSelection()
    }
}
