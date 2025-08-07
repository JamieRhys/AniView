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
    private let persistenceStore: PersistenceStoreProtocol
    private let breedMapper: BreedMapper
    
    init(navController: UINavigationController) throws {
        self.navController = navController
    
        self.persistenceStore = try PersistenceStore()
        self.networkClient = AlamofireNetworkClient()
        self.apiService = TheDogApiService(networkClient: networkClient)
        self.breedMapper = BreedMapper()
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
            persistenceStore: persistenceStore,
            breedMapper: breedMapper,
        )
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
        Logger.viewcycle.debug("Showing Splash Screen")
    }
    
    func showSearchScreen() {
        let child = SearchCoordinator(
            navController: navController,
            persistenceStore: persistenceStore,
        )
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
        Logger.viewcycle.debug("Showing Search Screen")
    }
    
    func showDetailsScreen(forBreed id: Int) {
        do {
            let result = try persistenceStore.fetch(RealmBreed.self, filter: NSPredicate(format: "id == %@", NSNumber(value: id)))
            let breed = breedMapper.toDomain(from: result.first!)
            
            Logger.statistics.debug("Showing Details for breed \(breed.name)")
        } catch {
            Logger.statistics.error(error.localizedDescription)
            showSearchScreen()
        }
    }
}
