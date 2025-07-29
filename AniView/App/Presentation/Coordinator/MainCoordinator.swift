//
//  MainCoordinator.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import UIKit
import OSLog
import UIKit
import RealmSwift

final class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navController: UINavigationController
    
    private let networkClient: NetworkClientProtocol
    private let apiService: TheDogApiServiceProtocol
    private let realm: Realm
    private let breedMapper: BreedMapper
    
    init(navController: UINavigationController) {
        self.navController = navController
        
        self.networkClient = AlamofireNetworkClient()
        self.apiService = TheDogApiService(networkClient: networkClient)
        self.breedMapper = BreedMapper()
        
        do {
            self.realm = try Realm()
        } catch let error {
            fatalError("Unable to initialize Realm: \(error)")
        }
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
            apiService: apiService,
            realm: realm,
            breedMapper: breedMapper,
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
