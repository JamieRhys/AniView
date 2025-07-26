//
//  AlamofireNetworkClient.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import Foundation
import Alamofire

class AlamofireNetworkClient: NetworkClientProtocol {
    func request<T: Codable>(
        url: URL,
        headers: HTTPHeaders?,
        method: HTTPMethod,
        type: T.Type,
        completion: @escaping (Result<T, any Error>) -> Void
    ) {
        AF
            .request(
                url,
                method: method,
                headers: headers,
            ).responseDecodable(of: type) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
