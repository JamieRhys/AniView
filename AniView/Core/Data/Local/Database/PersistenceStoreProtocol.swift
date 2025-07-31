//
//  PersistanceStoreProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 30/07/2025.
//

import Foundation
import RealmSwift

protocol PersistenceStoreProtocol {
    func save<T: Object>(_ object: T) throws
    func save<T: Object>(_ objects: [T]) throws
    func fetch<T: Object>(_ type: T.Type, filter: NSPredicate?) throws -> [T]
}
