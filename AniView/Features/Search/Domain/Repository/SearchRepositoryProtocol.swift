//
//  SearchRepositoryProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 03/08/2025.
//

import Foundation

protocol SearchRepositoryProtocol {
    func getAllBreedsAsSearchResults() async throws -> [SearchResult]
    
    func getRandomBreed() async throws -> Int?
    
    func search(for text: String) async throws -> [SearchResult]
}
