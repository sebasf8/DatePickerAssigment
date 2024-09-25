//
//  ContainerView.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    private let state: ViewState
    private var content: () -> Content

    init(state: ViewState, @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }

    var body: some View {
        let _ = Self._printChanges()

        switch state {
        case .loading:
            ProgressView()
        case .error:
            Text("Error")
        case .ready:
            content()
        }
    }
}

#Preview {
    ContainerView(state: .ready) {
        Text("Hello, World!")
    }
}
