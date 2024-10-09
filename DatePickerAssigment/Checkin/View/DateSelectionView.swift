//
//  DateSelectionView.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import SwiftUI

struct DateSelectionView: View {
    @ObservedObject var viewModel: DateSelectionViewModel

    init(viewModel: DateSelectionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ContainerView(state: viewModel.state) {
            content
        }
        .task {
            await viewModel.load()
        }
    }
}

private extension DateSelectionView {
    @ViewBuilder var content: some View {
        Form {
            Section {
                DatePicker("Checkin", selection: $viewModel.selectedDate, in: .distantPast ... .now)

                Button {
                    Task {
                        viewModel.updateSelectedDate()
                    }
                } label: {
                    Text("Submit")
                }
            }

            if !viewModel.validationErrorMessage.isEmpty {
                Section {
                    Text(viewModel.validationErrorMessage)
                        .foregroundColor(.red)

                }
            }
        }
    }
}

#Preview {
    DateSelectionView(viewModel: DateSelectionViewModel())
}
