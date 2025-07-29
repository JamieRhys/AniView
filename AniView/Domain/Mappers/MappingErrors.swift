//
//  MappingErrors.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 28/07/2025.
//

import Foundation

enum MappingErrors: Error {
    case missingValue(String)
    case invalidValue(String)
    case unknownError(Error)
}
