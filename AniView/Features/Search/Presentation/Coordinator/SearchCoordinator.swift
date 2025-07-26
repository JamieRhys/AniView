//
//  SearchCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit

class SearchCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    private var vc: SearchViewController
    
    init(navController: UINavigationController) {
        self.navController = navController
        
        self.vc = SearchViewController(viewModel: SearchViewModel())
    }
    
    func start() {
        vc.coordinator = self
        navController.setViewControllers([vc], animated: true)
    }
}
