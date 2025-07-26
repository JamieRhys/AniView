//
//  TheDogApiService.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation
import Alamofire

final class TheDogApiService: TheDogApiServiceProtocol {
    private let baseURL = API.baseURL
    private let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchAllBreeds(completion: @escaping (Result<[BreedDto], Error>) -> Void) async {
        networkClient.request(
            url: baseURL.appendingPathComponent("breeds"),
            headers: ["x-api-key" : API.api_key],
            method: .get,
            type: [BreedDto].self,
            completion: { result in
                switch result {
                case .success(let breedsDto):
                    completion(.success(breedsDto))
                case .failure(let error):
                    completion(.failure(ApiErrors.unknownError(error)))
                }
            }
        )
    }
}
