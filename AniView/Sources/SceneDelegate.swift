//
//  SceneDelegate.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 12/12/2025.
//

import UIKit

import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: MainCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let navController = UINavigationController()
        guard let windowScene = scene as? UIWindowScene else { return }
        guard let coordinator = try? MainCoordinator(navController: navController) else {
            fatalError("Could not create MainCoordinator.")
        }
        coordinator.start()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        self.appCoordinator = coordinator
        window.makeKeyAndVisible()
    }
}
