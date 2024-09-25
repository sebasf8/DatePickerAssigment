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
        VStack {
            DatePicker("Select a date", selection: $viewModel.selectedDate)

            Button {
                Task {
                    viewModel.updateSelectedDate()
                }
            } label: {
                Text("Submit")
            }
            .padding()
        }
        .padding()

    }
}

#Preview {
    DateSelectionView(viewModel: DateSelectionViewModel())
}
