//
//  SplashRepository.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 29/07/2025.
//

import Foundation
import RealmSwift

final class SplashRepository: SplashRepositoryProtocol {
    private let apiService: TheDogApiServiceProtocol
    private let persistenceStore: PersistenceStoreProtocol
    private let breedMapper: BreedMapper
    
    init(
        apiService: TheDogApiServiceProtocol,
        persistenceStore: PersistenceStoreProtocol,
        breedMapper: BreedMapper
    ) {
        self.apiService = apiService
        self.persistenceStore = persistenceStore
        self.breedMapper = breedMapper
    }
    
    func fetchAllBreeds(completion: @escaping (Result<Void?, Error>) -> Void) async {
        await apiService.fetchAllBreeds { result in
            switch result {
            case .success(let dto):
                do {
                    try self.persistenceStore.save(try self.breedMapper.toRealm(from: dto))
                    completion(.success(nil))
                } catch let error as NSError {
                    completion(.failure(error))
                }
            case .failure(let result):
                completion(.failure(result))
            }
        }
    }
}
