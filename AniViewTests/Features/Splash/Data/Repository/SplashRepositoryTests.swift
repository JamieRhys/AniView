//
//  SplashRepositoryTests.swift
//  AniViewTests
//
//  Created by Jamie-Rhys Edwards on 29/07/2025.
//

import XCTest
import Cuckoo
import RealmSwift
@testable import AniView

final class SplashRepositoryTests: XCTestCase {
/*
 * ==========================================================================
 * Setup and Teardown
 * ==========================================================================
 */
    
    var sut: SplashRepositoryProtocol!
    
    private var mockApiService: MockTheDogApiServiceProtocol!
    private var mockPersistenceStore: MockPersistenceStoreProtocol!
    private var breedMapper: BreedMapper!
    
    override func setUp() {
        super.setUp()
        
        self.mockApiService = MockTheDogApiServiceProtocol()
        self.breedMapper = BreedMapper()
        mockPersistenceStore = MockPersistenceStoreProtocol()
        self.sut = SplashRepository(
            apiService: mockApiService,
            persistenceStore: mockPersistenceStore,
            breedMapper: breedMapper,
        )
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
        self.mockApiService = nil
        self.mockPersistenceStore = nil
        self.breedMapper = nil
    }
    
/*
 * ==========================================================================
 * Fetch All Breeds
 * ==========================================================================
 */
    func test_fetchAllBreeds_shouldCallApiServiceAndSaveToDatabase() async {
        var dto = [BreedDto]()
        for i in 1...10 {
            dto.append(BreedDto(
                id: i,
                name: "Test Dog \(i)",
                weight: MeasurementDto(imperial: "10lb", metric: "4.5kg"),
                height: MeasurementDto(imperial: "11\"", metric: "28cm"),
                bred_for: "Test, Bred, For",
                breed_group: "Test",
                life_span: "10 - 12 years",
                temperament: "Test",
                origin: "UK, France",
                reference_image_id: "TestID",
                image: ImageDto(id: "TestID", width: 128, height: 128, url: "test-url.com")
            ))
        }
        let realmObject = try! breedMapper.toRealm(from: dto)
        
        stub(mockApiService) { stub in
            when(stub.fetchAllBreeds(completion: any())).then { completion in
                    completion(.success(dto))
            }
        }
        
        stub(mockPersistenceStore) { stub in
            when(stub.save(any([RealmBreed].self))).thenDoNothing()
            when(stub.fetch(any(), filter: any())).thenReturn(realmObject)
        }
        
        await sut.fetchAllBreeds { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let error):
                XCTFail("Unexpected error: \(error)")
            }
        }
    }
    
    func test_fetchAllBreeds_whenDatabaseReturnsError_thenErrorShouldBeReturnedAsFailure() async {
        stub(mockApiService) { stub in
            when(stub.fetchAllBreeds(completion: any())).then { completion in
                completion(.success([BreedDto]()))
            }
        }
        
        stub(mockPersistenceStore) { stub in
            when(stub.save(any([RealmBreed].self))).thenThrow(NSError(domain: "test_error", code: 0, userInfo: nil))
        }
        
        await sut.fetchAllBreeds() { result in
            switch result {
            case .success(_):
                XCTFail("Expected to fail")
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
    
    func test_fetchAllBreeds_whenApiServiceReturnsError_thenErrorShouldBeReturnedAsFailure() async {
        stub(mockApiService) { stub in
            when(stub.fetchAllBreeds(completion: any())).then { completion in
                completion(.failure(ApiErrors.unknownError(NSError(domain: "test_error", code: 0, userInfo: nil))))
            }
        }
        
        await sut.fetchAllBreeds() { result in
            switch result {
            case .success(_):
                XCTFail("Unexpected failure")
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
}
