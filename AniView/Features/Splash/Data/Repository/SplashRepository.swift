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
    private let breedMapper: BreedMapper
    private let realm: Realm
    
    init(
        apiService: TheDogApiServiceProtocol,
        realm: Realm,
        breedMapper: BreedMapper
    ) {
        self.apiService = apiService
        self.realm = realm
        self.breedMapper = breedMapper
    }
    
    func fetchAllBreeds(completion: @escaping (Result<Void?, Error>) -> Void) async {
        await apiService.fetchAllBreeds { result in
            switch result {
            case .success(let dto):
                do {
                    let realms = try self.breedMapper.toRealm(from: dto)
                    try self.realm.write {
                        self.realm.add(realms, update: .all)
                    }
                    completion(.success(nil))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let result):
                completion(.failure(result))
            }
        }
    }
}
