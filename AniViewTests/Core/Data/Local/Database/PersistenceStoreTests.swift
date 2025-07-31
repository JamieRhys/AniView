//
//  PersistenceStoreTests.swift
//  AniViewTests
//
//  Created by Jamie-Rhys Edwards on 31/07/2025.
//

import XCTest
import RealmSwift
@testable import AniView

final class PersistenceStoreTests: XCTestCase {
/*
 * ==========================================================================
 * Setup and Teardown
 * ==========================================================================
 */
    
    var sut: PersistenceStoreProtocol!
    
    override func setUpWithError() throws {
        let config = Realm.Configuration(inMemoryIdentifier: "TestRealm")
        sut = try PersistenceStore(configuration: config)
    }
    
    override func tearDown() {
        sut = nil
    }
    
/*
 * ==========================================================================
 * Save and fetch
 * ==========================================================================
 */
    
    func test_saveASingleObjectAndFetch() throws {
        let expected = RealmBreed(
            id: 1,
            name: "Test Dog",
            weight: RealmMeasurement(imperial: "Test", metric: "Test"),
            height: RealmMeasurement(imperial: "Test", metric: "Test"),
            bredFor: "Test, Test, Test",
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: RealmImage(id: "test-id", width: 128, height: 128, url: "test-url")
        )
        
        XCTAssertNoThrow(try sut.save(expected))
        
        let fetched = try sut.fetch(RealmBreed.self, filter: nil).first
        
        XCTAssertEqual(expected, fetched)
    }
    
    func test_saveObjectsAndFetch() throws {
        var expected = [RealmBreed]()
        expected.append(RealmBreed(
            id: 1,
            name: "Test Dog",
            weight: RealmMeasurement(imperial: "Test", metric: "Test"),
            height: RealmMeasurement(imperial: "Test", metric: "Test"),
            bredFor: "Test, Test, Test",
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: RealmImage(id: "test-id", width: 128, height: 128, url: "test-url")
        ))
        expected.append(RealmBreed(
            id: 2,
            name: "Test Dog 2",
            weight: RealmMeasurement(imperial: "Test", metric: "Test"),
            height: RealmMeasurement(imperial: "Test", metric: "Test"),
            bredFor: "Test, Test, Test",
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: RealmImage(id: "test-id", width: 128, height: 128, url: "test-url")
        ))
        
        XCTAssertNoThrow(try sut.save(expected))
        
        let fetched = try sut.fetch(RealmBreed.self, filter: nil)
        
        XCTAssertEqual(expected.count, fetched.count)
    }
}
