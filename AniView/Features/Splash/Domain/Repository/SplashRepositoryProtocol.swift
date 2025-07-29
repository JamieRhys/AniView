//
//  SplashRepositoryProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 29/07/2025.
//

import Foundation

protocol SplashRepositoryProtocol {
    func fetchAllBreeds(completion: @escaping (Result<Void?, any Error>) -> Void) async
}
