//
//  DateSelectionViewModel.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class DateSelectionViewModel: ObservableObject {
    @Published var selectedDate: Date = .now
    @Published private(set) var validationErrorMessage: String = ""
    @Published private(set) var state: ViewState = .loading

    private let service: CheckinProvider = DependencyContainer.shared.checkinService

    @MainActor
    func load() async {
        do {
            state = .loading
            let checkinInfo = try await service.getCheckin()
            selectedDate = checkinInfo.dateTime

            state = .ready
        } catch {
            state = .error
        }
    }

    @MainActor
    func updateSelectedDate() {
        guard selectedDate <= .now else {
            validationErrorMessage = "Date must be in the past"
            return
        }
        
        do {
            try service.save(checkin: CheckinModel(dateTime: selectedDate))
            validationErrorMessage = ""
        } catch {
            validationErrorMessage = "There was an error saving the data"
        }
    }
}

enum ViewState {
    case error
    case loading
    case ready
}
