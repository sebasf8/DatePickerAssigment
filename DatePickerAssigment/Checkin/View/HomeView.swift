//
//  HomeView.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation
import UIKit

/// Class not used. was created as base to migrate it to objc.
class HomeView: UIView {
    lazy var startButton: UIButton = makeStartButton()
    lazy var companyLabel: UILabel = makeCompanyLabel()

    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        // We don't support storyboards nor xib implementations
        preconditionFailure("init(coder:) has not been implemented")
    }
}

private extension HomeView {
    func configureView() {
        addSubview(startButton)
        addSubview(companyLabel)
        configureConstraints()
    }

    func configureConstraints() {
        addConstraints([
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            companyLabel.widthAnchor.constraint(equalToConstant: 200),
            companyLabel.heightAnchor.constraint(equalToConstant: 50),
            companyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            companyLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
        ])

        startButton.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func makeStartButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Start", for: .normal)

        return button
    }

    func makeCompanyLabel() -> UILabel {
        let label = UILabel()

        label.text = "Company"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()

        return label
    }
}
