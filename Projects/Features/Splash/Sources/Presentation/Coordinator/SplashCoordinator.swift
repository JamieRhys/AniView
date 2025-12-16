//
//  SplashCoordinator.swift
//  Splash
//
//  Created by Jamie-Rhys Edwards on 15/12/2025.
//

import UIKit

import Core

public class SplashCoordinator: CoordinatorProtocol {
    public var childCoordinators = [CoordinatorProtocol]()
    public var navController: UINavigationController
    private weak var parentCoordinator: CoordinatorProtocol?
    private var vc: SplashViewController
    
    public init(
        navController: UINavigationController,
        parentCoordinator: CoordinatorProtocol?
    ) {
        self.navController = navController
        self.parentCoordinator = parentCoordinator
        self.vc = SplashViewController(viewModel: SplashViewModel())
    }
    
    public func start() {
        self.vc.parentCoordinator = self
        self.navController.setViewControllers([vc], animated: true)
    }
    
    public func childDidFinish(_ child: (CoordinatorProtocol)?) {}
    
    public func end() {}
}
