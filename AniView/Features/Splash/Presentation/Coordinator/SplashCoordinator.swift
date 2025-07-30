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
        breedMapper: BreedMapper,
    ) {
        self.navController = navController
        
        self.repository = SplashRepository(
            apiService: apiService,
            breedMapper: breedMapper
        )
        
        self.vc = SplashViewController(
            viewModel: SplashViewModel()
        )
    }
    
    func start() {
        vc.coordinator = self
        navController.setViewControllers([vc], animated: true)
        
        // TEST CODE:
        Task {
            try? await repository.fetchAllBreeds(completion: { _ in })
        }
    }
    
    func end() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            Logger.viewcycle.debug("Auto-switching to Search Screen")
            self?.parentCoordinator?.showSearchScreen()
        }
    }
}
