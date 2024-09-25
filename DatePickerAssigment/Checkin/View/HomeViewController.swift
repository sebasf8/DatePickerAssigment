//
//  ViewController.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeViewModel: HomeViewModel
    private let homeView: HomeView

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        self.homeView = HomeView(viewModel: homeViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        // We don't support storyboards.
        preconditionFailure("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = homeView
    }
}
