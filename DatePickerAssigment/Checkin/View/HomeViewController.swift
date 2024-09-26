//
//  ViewController.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Combine
import UIKit

class HomeViewController: UIViewController {
    private let homeViewModel: HomeViewModel
    private let homeView: HomeViewObjcView
    private var subscriptions = Set<AnyCancellable>()

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        self.homeView = HomeViewObjcView()
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        // We don't support storyboards.
        preconditionFailure("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupActions()
        homeViewModel.load()
    }

    override func loadView() {
        view = homeView
    }
}

private extension HomeViewController {
     func setupBindings() {
        homeViewModel.$greetings
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .assign(to: \.text, on: homeView.companyLabel)
            .store(in: &subscriptions)
    }

    func setupActions() {
        homeView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    @objc func startButtonTapped() {
        homeViewModel.startButtonTapped()
    }
}
