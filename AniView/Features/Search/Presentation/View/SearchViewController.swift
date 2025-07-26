//
//  SearchViewController.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit

final class SearchViewController: UIViewController {
    private let viewModel: SearchViewModel
    var coordinator: SearchCoordinator?
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init?(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        setupUi()
    }
    
    private func configureBindings() {
        view.backgroundColor = .blue
    }
    
    private func setupUi() {
        
    }
}
