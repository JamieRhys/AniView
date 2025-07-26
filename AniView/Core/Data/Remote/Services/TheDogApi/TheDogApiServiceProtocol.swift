//
//  TheDogApiServiceProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation

protocol TheDogApiServiceProtocol {
    func fetchAllBreeds(completion: @escaping (Result<[BreedDto], Error>) -> Void) async
}
