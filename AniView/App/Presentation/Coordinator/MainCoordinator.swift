//
//  MainCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import UIKit
import OSLog
import UIKit

final class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        showSplashScreen()
    }
    
    func childDidFinish(_ child: CoordinatorProtocol?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func showSplashScreen() {
        let child = SplashCoordinator(
            navController: navController,
        )
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
        Logger.viewcycle.debug("Showing Splash Screen")
    }
    
    func showSearchScreen() {
        let child = SearchCoordinator(
            navController: navController
        )
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
        Logger.viewcycle.debug("Showing Search Screen")
    }
}
