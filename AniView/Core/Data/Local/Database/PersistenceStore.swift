//
//  PersistenceStore.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 30/07/2025.
//

import Foundation
import RealmSwift

final class PersistenceStore: PersistenceStoreProtocol {
    private let realm: Realm
    
    init(configuration: Realm.Configuration = .defaultConfiguration) throws {
        self.realm = try Realm(configuration: configuration)
    }
    
    func save<T: Object>(_ object: T) throws {
        try realm.write {
            realm.add(object, update: .all)
        }
    }
    
    func save<T: Object>(_ objects: [T]) throws {
        try realm.write {
            realm.add(objects, update: .all)
        }
    }
    
    func fetch<T: Object>(_ type: T.Type, filter: NSPredicate? = nil) throws -> [T] {
        var results = realm.objects(type)
        
        if let filter = filter {
            results = results.filter(filter)
        }
        
        return Array(results)
    }
    
    
}
