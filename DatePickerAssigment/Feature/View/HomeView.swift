//
//  HomeView.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import UIKit

class HomeView: UIView {
    private var viewModel: HomeViewModel
    private lazy var startButton: UIButton = makeStartButton()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureView()
    }

    required init?(coder: NSCoder) {
        // We don't support storyboards nor xib implementations
        preconditionFailure("init(coder:) has not been implemented")
    }
}

private extension HomeView {
    func configureView() {
        addSubview(startButton)
        configureConstraints()
    }

    func configureConstraints() {
        addConstraints([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func makeStartButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }

    @objc func startButtonTapped() {
        viewModel.startButtonTapped()
    }
}
