//
//  SearchViewModel.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    private let repository: SearchRepositoryProtocol!
    private let disposeBag: DisposeBag!
    
    private struct State {
        let searchResults = BehaviorRelay<[SearchResult]>(value: [SearchResult]())
    }
    
    private let state = State()
    
    init(
        repository: SearchRepositoryProtocol,
    ) {
        self.repository = repository
        self.disposeBag = DisposeBag()
        
        getAllBreeds()
    }
    
    private func getAllBreeds() {
        Task {
            let results: [SearchResult] = try await self.repository.getAllBreedsAsSearchResults()
            
            state.searchResults.accept(results)
        }
    }
    
    func search(for text: String) {
        Task {
            if text.isEmpty {
                getAllBreeds()
            } else {
                let results = try await self.repository.search(for: text)
                
                state.searchResults.accept(results)
            }
        }
    }
    
    func randomBreed() async -> Int {
        let task = Task {
            guard let randomBreed = try await self.repository.getRandomBreed() else {
                return -1
            }
            
            return randomBreed
        }
        
        let result = await task.result
        
        do {
            return try result.get()
        } catch {
            return -1
        }
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    var searchResults: Driver<[SearchResult]> {
        state.searchResults.asDriver()
    }
}
