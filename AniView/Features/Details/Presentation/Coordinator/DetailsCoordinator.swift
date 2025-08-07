//
//  DetailsCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 07/08/2025.
//

import UIKit

final class DetailsCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        
    }
    
    
}
