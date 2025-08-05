//
//  SearchRepositoryTests.swift
//  AniViewTests
//
//  Created by Jamie-Rhys Edwards on 04/08/2025.
//

import XCTest
import Cuckoo
@testable import AniView

final class SearchRepositoryTests: XCTestCase {
/*
 * ==========================================================================
 * Setup and Teardown
 * ==========================================================================
 */
    var sut: SearchRepositoryProtocol!
    
    private var mockPersistenceStore: MockPersistenceStoreProtocol!
    
    override func setUp() {
        super.setUp()
        
        self.mockPersistenceStore = MockPersistenceStoreProtocol()
        
        self.sut = SearchRepository(persistenceStore: self.mockPersistenceStore)
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
/*
 * ==========================================================================
 * Get All Breeds As Search Results
 * ==========================================================================
 */
    
    func test_getAllBreedsAsSearchResults_whenCalled_thenSuccess() async {
        var realmBreeds = [RealmBreed]()
        for i in 1...10 {
            realmBreeds.append(
                RealmBreed(
                    id: i,
                    name: "Breed \(i)",
                    weight: RealmMeasurement(imperial: "", metric: ""),
                    height: RealmMeasurement(imperial: "", metric: ""),
                    bredFor: "",
                    breedGroup: "",
                    lifeSpan: "",
                    temperament: "",
                    origin: "",
                    image: RealmImage(id: "", width: 0, height: 0, url: "")
                )
            )
        }
        let expected = realmBreeds.map { breed in
            SearchResult(id: breed.id, name: breed.name)
        }
        
        stub(mockPersistenceStore) { stub in
            when(stub.fetch(any(), filter: any())).thenReturn(realmBreeds)
        }
        
        guard let actual = try? await sut.getAllBreedsAsSearchResults() else {
            XCTFail("Expected to pass")
            return // to satisfy xcode.
        }
        
        XCTAssertEqual(expected.count, actual.count)
        XCTAssertEqual(expected[0].id, actual[0].id)
        XCTAssertEqual(expected[0].name, actual[0].name)
    }
    
    func test_getAllBreedsAsSearchResults_whenNoBreedsProvided_thenEmptyArrayReturned() async {
        stub(mockPersistenceStore) { stub in
            when(stub.fetch(any(), filter: any())).thenReturn([RealmBreed]())
        }
        
        let expected: [SearchResult] = []
        
        guard let actual = try? await sut.getAllBreedsAsSearchResults() else {
            XCTFail("Expected to pass")
            return  // to satisfy xcode.
        }
        
        XCTAssertEqual(expected.count, actual.count)
    }
    
/*
 * ==========================================================================
 * Get Random Breed
 * ==========================================================================
 */
    
    func test_getRandomBreed_whenCalled_thenSuccess() async {
        var realmBreeds = [RealmBreed]()
        for i in 1...10 {
            realmBreeds.append(
                RealmBreed(
                    id: i,
                    name: "Breed \(i)",
                    weight: RealmMeasurement(imperial: "", metric: ""),
                    height: RealmMeasurement(imperial: "", metric: ""),
                    bredFor: "",
                    breedGroup: "",
                    lifeSpan: "",
                    temperament: "",
                    origin: "",
                    image: RealmImage(id: "", width: 0, height: 0, url: "")
                )
            )
        }
        
        stub(mockPersistenceStore) { stub in
            when(stub.fetch(any(), filter: any())).thenReturn(realmBreeds)
        }
        
        guard let actual = try? await sut.getRandomBreed() else {
            XCTFail("Expected to pass")
            return // to satisfy xcode.
        }
        
        XCTAssertNotNil(actual)
    }
    
    func test_getRandomBreed_whenNoBreedsProvided_thenNilIsReturned() async {
        stub(mockPersistenceStore) { stub in
            when(stub.fetch(any(), filter: any())).thenReturn([RealmBreed]())
        }
        
        let actual = try? await sut.getRandomBreed()
        
        XCTAssertNil(actual)
    }
    
/*
 * ==========================================================================
 * Search
 * ==========================================================================
 */
    
    func test_search_whenCalledWithValidString_thenSuccess() async {
        var realmBreeds = [RealmBreed]()
        for i in 1...10 {
            realmBreeds.append(
                RealmBreed(
                    id: i,
                    name: "Breed \(i)",
                    weight: RealmMeasurement(imperial: "", metric: ""),
                    height: RealmMeasurement(imperial: "", metric: ""),
                    bredFor: "",
                    breedGroup: "",
                    lifeSpan: "",
                    temperament: "",
                    origin: "",
                    image: RealmImage(id: "", width: 0, height: 0, url: "")
                )
            )
        }
        let expectedId = realmBreeds.count + 1
        realmBreeds.append(
            RealmBreed(
                id: expectedId,
                name: "Test Dog",
                weight: RealmMeasurement(imperial: "", metric: ""),
                height: RealmMeasurement(imperial: "", metric: ""),
                bredFor: "",
                breedGroup: "",
                lifeSpan: "",
                temperament: "",
                origin: "",
                image: RealmImage(id: "", width: 0, height: 0, url: "")
            )
        )
        
        let expected = [SearchResult(id: expectedId, name: "Test Dog")]
        
        stub(mockPersistenceStore) { stub in
            when(stub.fetch(any(), filter: any())).thenReturn(realmBreeds)
        }
        
        guard let actual = try? await sut.search(for: "Test") else {
            XCTFail("Expected to pass")
            return // to satisfy xcode
        }
        
        XCTAssertEqual(expected.count, actual.count)
        XCTAssertEqual(expected[0].id, actual[0].id)
        XCTAssertEqual(expected[0].name, actual[0].name)
    }
}

