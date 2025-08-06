//
//  SearchCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit
import OSLog

class SearchCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    private var vc: SearchViewController
    private var repository: SearchRepositoryProtocol
    
    init(
        navController: UINavigationController,
        persistenceStore: PersistenceStoreProtocol,
    ) {
        self.navController = navController
        
        self.repository = SearchRepository(persistenceStore: persistenceStore)
        self.vc = SearchViewController(viewModel: SearchViewModel(repository: repository))
    }
    
    func start() {
        vc.coordinator = self
        navController.setViewControllers([vc], animated: true)
    }
    
    func showDetailedView(breedId: Int) {
        parentCoordinator?.showDetailsScreen(forBreed: breedId)
    }
}
