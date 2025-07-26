//
//  Logger+Extensions.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 26/07/2025.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    // Logs the view cycles like a view that appeared.
    static let viewcycle = Logger(subsystem: subsystem, category: "viewcycle")
    
    // All logs related to tracking and analytics.
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
    
    func debug(_ message: String, function: String = #function, file: String = #fileID, line: Int = #line) {
        self.log(level: .debug, "[\(Date().formatted(date: .abbreviated, time: .standard)) | \(file) - \(function):\(line)] DEBUG: \(message, privacy: .public)")
    }
    
    func info(_ message: String, function: String = #function, file: String = #fileID, line: Int = #line) {
        self.log(level: .info, "[\(Date().formatted(date: .abbreviated, time: .standard)) | \(file) - \(function):\(line)] INFO: \(message, privacy: .public)")
    }
    
    func error(_ message: String, function: String = #function, file: String = #fileID, line: Int = #line) {
        self.log(level: .error, "[\(Date().formatted(date: .abbreviated, time: .standard)) | \(file) - \(function):\(line)] ERROR: \(message, privacy: .public)")
    }
    
    
}
