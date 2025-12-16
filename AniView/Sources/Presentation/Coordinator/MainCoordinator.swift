//
//  MainCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 15/12/2025.
//

import OSLog
import UIKit

import Core
import Splash

final class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    
    init(navController: UINavigationController) throws {
        self.navController = navController
    }
    
    func start() {
        showSplashScreen()
    }
    
    func childDidFinish(_ child: (CoordinatorProtocol)?) {}
    
    func end() {}
    
    private func showSplashScreen() {
        let child = SplashCoordinator(navController: self.navController, parentCoordinator: self)
        childCoordinators.append(child)
        
        Logger.viewcycle.debug("Showing Splash Screen")
        child.start()
    }
}
