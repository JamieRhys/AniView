//
//  SceneDelegate.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 18/07/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let navController = UINavigationController()
        guard let coordinator = try? MainCoordinator(navController: navController) else {
            fatalError("Could not create the MainCoordinator.")
        }
        coordinator.start()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        self.appCoordinator = coordinator
        window.makeKeyAndVisible()
    }
}

