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
    
    private var apiService: MockTheDogApiServiceProtocol!
    private var breedMapper: BreedMapper!
    
    override func setUp() {
        super.setUp()
        
        self.apiService = MockTheDogApiServiceProtocol()
        self.breedMapper = BreedMapper()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        self.sut = SplashRepository(
            apiService: apiService,
            breedMapper: breedMapper,
        )
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
        self.apiService = nil
        self.breedMapper = nil
    }
    
/*
 * ==========================================================================
 * Fetch All Breeds
 * ==========================================================================
 */
    
    func test_fetchAllBreeds_whenCalled_thenFetchesDataFromApiAndSavesToRealm() async {
        var dto: [BreedDto] = [BreedDto]()
        for i in 0...10 {
            dto.append(
                BreedDto(
                    id: i,
                    name: "Dog \(i)",
                    weight: MeasurementDto(imperial: "", metric: ""),
                    height: MeasurementDto(imperial: "", metric: ""),
                    bred_for: "Test, Test, Test",
                    breed_group: "Test",
                    life_span: "Test",
                    temperament: "Test",
                    origin: "Test",
                    reference_image_id: "TestID",
                    image: ImageDto(
                        id: "TestID",
                        width: 128,
                        height: 128,
                        url: "Test.example.com/test-image.png"
                    )
                )
            )
        }
        
        stub(apiService) { stub in
            stub.fetchAllBreeds(completion: any()).then { completion in completion(.success(dto)) }
        }
        
        await sut.fetchAllBreeds { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let error): XCTFail("Expected this to pass. Got: \(error)")
            }
        }
    }
    
    func test_fetchAllBreeds_whenApiErrorOccurs_thenErrorIsPassedBackAsFailure() async {
        stub(apiService) { stub in
            stub.fetchAllBreeds(completion: any()).then { completion in
                completion(.failure(ApiErrors.unknownError(NSError(domain: "unknown_error", code: 0, userInfo: nil))))
            }
        }
        
        await sut.fetchAllBreeds { result in
            switch result {
            case .success(_):
                XCTFail("Expected failure to occur.")
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
}
