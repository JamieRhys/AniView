//
//  TheDogApiServiceTests.swift
//  AniViewTests
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import XCTest
import Alamofire
import Cuckoo
@testable import AniView

final class TheDogApiServiceTests: XCTestCase {
/*
 * ==========================================================================
 * Setup and Teardown
 * ==========================================================================
 */
    
    var sut: TheDogApiServiceProtocol!
    var mockNetworkClient: MockNetworkClientProtocol!
    
    override func setUp() {
        super.setUp()
        
        mockNetworkClient = MockNetworkClientProtocol()
        sut = TheDogApiService(networkClient: mockNetworkClient)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        mockNetworkClient = nil
    }
    
/*
 * ==========================================================================
 * Fetch All Breeds
 * ==========================================================================
 */
    
    func test_fetchAllBreeds_whenSuccessResponse_thenBreedsReturned() async {
        let expected = [
            BreedDto(
                weight: MeasurementDto(
                    imperial: "6 - 13",
                    metric: "3 - 6"
                ),
                height: MeasurementDto(
                    imperial: "9 - 11.5",
                    metric: "23 - 29"
                ),
                id: 1,
                name: "Affenpinscher",
                bred_for: "Small rodent hunting, lapdog",
                breed_group: "Toy",
                life_span: "10 - 12 years",
                temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
                origin: "Germany, France",
                reference_image_id: "BJa4kxc4X",
                image: ImageDto(
                    id: "BJa4kxc4X",
                    width: 1600,
                    height: 1199,
                    url: "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg"
                )
            ),
            BreedDto(
                weight: MeasurementDto(
                    imperial: "50 - 60",
                    metric: "23 - 27"
                ),
                height: MeasurementDto(
                    imperial: "25 - 27",
                    metric: "64 - 69"
                ),
                id: 2,
                name: "Afghan Hound",
                bred_for: "Coursing and hunting",
                breed_group: "Hound",
                life_span: "10 - 13 years",
                temperament: "Aloof, Clownish, Dignified, Independent, Happy",
                origin: "Afghanistan, Iran, Pakistan",
                reference_image_id: "hMyT4CDXR",
                image: ImageDto(
                    id: "hMyT4CDXR",
                    width: 606,
                    height: 380,
                    url: "https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg"
                )
            )
        ]
        
        stub(mockNetworkClient) { stub in
            when(stub.request(
                url: any(),
                headers: any(),
                method: equal(to: .get),
                type: any(),
                completion: any()
            )).then { _, _, _, _, completion in
                completion(.success(expected))
            }
        }
        
        await sut.fetchAllBreeds(completion: { result in
            switch result {
            case .success(let actual):
                XCTAssertEqual(expected.count, actual.count)
            case .failure(let error):
                XCTFail("Expected this to succeed. Got error: \(error)")
            }
        })
    }
    
    
}
