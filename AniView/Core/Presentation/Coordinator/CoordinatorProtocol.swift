//
//  Coordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 18/07/2025.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navController: UINavigationController { get set }
    
    func start()
}
