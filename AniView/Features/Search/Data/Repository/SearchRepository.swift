//
//  SearchRepository.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 04/08/2025.
//

import Foundation

final class SearchRepository: SearchRepositoryProtocol {
    private let persistenceStore: PersistenceStoreProtocol
    
    init(
        persistenceStore: PersistenceStoreProtocol,
    ) {
        self.persistenceStore = persistenceStore
    }
    
    func getAllBreedsAsSearchResults() async -> [SearchResult] {
        guard let realmBreeds = try? persistenceStore.fetch(RealmBreed.self, filter: nil) else {
            return []
        }
        
        let breeds = realmBreeds.map { breed in
            SearchResult(id: breed.id, name: breed.name)
        }
        
        return breeds
    }
    
    func getRandomBreed() async -> Int? {
        guard let realmBreed = try? persistenceStore.fetch(RealmBreed.self, filter: nil) else {
            return nil
        }
        
        return !realmBreed.isEmpty ? Int.random(in: 0..<realmBreed.count) : nil
    }
    
    func search(for text: String) async throws -> [SearchResult] {
        guard let realmBreed = try? persistenceStore.fetch(RealmBreed.self, filter: nil) else {
            return [SearchResult]()
        }
        
        let searchResults = realmBreed.filter { $0.name.lowercased().contains(text.lowercased()) }
    
        return !searchResults.isEmpty ? searchResults.map { SearchResult(id: $0.id, name: $0.name) } : [SearchResult]()
    }
    
    
}
