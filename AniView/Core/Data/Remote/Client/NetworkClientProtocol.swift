//
//  NetworkClientProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import Foundation
import Alamofire

protocol NetworkClientProtocol {
    func request<T: Codable>(
        url: URL,
        headers: HTTPHeaders?,
        method: HTTPMethod,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
