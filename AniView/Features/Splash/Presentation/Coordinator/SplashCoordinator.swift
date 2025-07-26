//
//  SplashCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import UIKit
import OSLog

class SplashCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    private var vc: SplashViewController
    
    init(navController: UINavigationController) {
        self.navController = navController
        
        self.vc = SplashViewController(
            viewModel: SplashViewModel()
        )
    }
    
    func start() {
        vc.coordinator = self
        navController.setViewControllers([vc], animated: true)
    }
    
    func end() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
            Logger.viewcycle.debug("Auto-switching to Search Screen")
            self?.parentCoordinator?.showSearchScreen()
        }
    }
}
