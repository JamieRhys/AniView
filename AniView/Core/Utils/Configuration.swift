//
//  Configuration.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else { throw Error.missingKey }
        
        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    static var baseURL: URL {
        return try! URL(string: Configuration.value(for: "API_ENDPOINT"))!
    }
    
    static var api_key: String {
        return try! Configuration.value(for: "API_KEY")
    }
}
