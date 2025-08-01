//
//  SplashCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import UIKit
import OSLog
import RealmSwift

class SplashCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    private var vc: SplashViewController
    private let repository: SplashRepositoryProtocol
    
    init(
        navController: UINavigationController,
        apiService: TheDogApiServiceProtocol,
        persistenceStore: PersistenceStoreProtocol,
        breedMapper: BreedMapper,
    ) {
        self.navController = navController
        
        self.repository = SplashRepository(
            apiService: apiService,
            persistenceStore: persistenceStore,
            breedMapper: breedMapper
        )
        
        self.vc = SplashViewController(
            viewModel: SplashViewModel(
                repository: repository,
            )
        )
    }
    
    func start() {
        vc.coordinator = self
        navController.setViewControllers([vc], animated: true)
    }
    
    func end() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func startSwitchTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            Logger.viewcycle.debug("Auto-switching to Search Screen")
            self?.parentCoordinator?.showSearchScreen()
        }
    }
}
