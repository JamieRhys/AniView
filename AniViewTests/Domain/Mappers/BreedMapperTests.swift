//
//  BreedMapperTests.swift
//  AniViewTests
//
//  Created by Jamie-Rhys Edwards on 28/07/2025.
//

import XCTest
@testable import AniView

final class BreedMapperTest : XCTestCase {
/*
 * ==========================================================================
 * Setup and Teardown
 * ==========================================================================
 */
    
    private var sut: BreedMapper!
    
    override func setUp() {
        sut = BreedMapper()
    }
    
    override func tearDown() {
        sut = nil
    }
    
/*
 * ==========================================================================
 * To Domain
 * ==========================================================================
 */
    
    func test_toDomain_Success() {
        let expected = Breed(
            id: 1,
            name: "Test dog",
            weight: Measurement(imperial: "Test", metric: "Test"),
            height: Measurement(imperial: "Test", metric: "Test"),
            bredFor: ["One", "Two", "Three"],
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: Image(
                id: "TestID",
                width: 128,
                height: 128,
                url: "TestURL"
            )
        )
        let realm = RealmBreed(
            id: 1,
            name: "Test dog",
            weight: RealmMeasurement(imperial: "Test", metric: "Test"),
            height: RealmMeasurement(imperial: "Test", metric: "Test"),
            bredFor: "One, Two, Three",
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: RealmImage(
                id: "TestID",
                width: 128,
                height: 128,
                url: "TestURL"
            )
        )
        
        let actual = sut.toDomain(from: realm)
        
        XCTAssertEqual(expected.id, actual.id)
        XCTAssertEqual(expected.name, actual.name)
        XCTAssertEqual(expected.bredFor, actual.bredFor)
    }
    
    func test_toDomain_whereOptionalsAreNil_Success() {
        let expected = Breed(
            id: 1,
            name: "Test dog",
            weight: nil,
            height: nil,
            bredFor: [String](),
            breedGroup: nil,
            lifeSpan: nil,
            temperament: nil,
            origin: nil,
            image: nil
        )
        let realm = RealmBreed(
            id: 1,
            name: "Test dog",
            weight: nil,
            height: nil,
            bredFor: nil,
            breedGroup: nil,
            lifeSpan: nil,
            temperament: nil,
            origin: nil,
            image: nil
        )
        
        let actual = sut.toDomain(from: realm)
        
        XCTAssertEqual(expected.id, actual.id)
        XCTAssertEqual(expected.name, actual.name)
        XCTAssertEqual(expected.bredFor, actual.bredFor)
    }
    
/*
 * ==========================================================================
 * To Realm
 * ==========================================================================
 */
    
    func test_toRealm_Success() {
        var expected = [RealmBreed]()
        expected.append(RealmBreed(
            id: 1,
            name: "Test dog",
            weight: RealmMeasurement(imperial: "Test", metric: "Test"),
            height: RealmMeasurement(imperial: "Test", metric: "Test"),
            bredFor: "One, Two, Three",
            breedGroup: "Test",
            lifeSpan: "Test",
            temperament: "Test",
            origin: "Test",
            image: RealmImage(
                id: "TestID",
                width: 128,
                height: 128,
                url: "TestURL"
            )
        ))
        
        var dto: [BreedDto] = [BreedDto]()
        dto.append(BreedDto(
                id: 1,
                name: "Test dog",
                weight: MeasurementDto(imperial: "Test", metric: "Test"),
                height: MeasurementDto(imperial: "Test", metric: "Test"),
                bred_for: "One, Two, Three",
                breed_group: "Test",
                life_span: "Test",
                temperament: "Test",
                origin: "Test",
                reference_image_id: "TestID",
                image: ImageDto(
                    id: "TestID",
                    width: 128,
                    height: 128,
                    url: "TestURL"
                )
        ))
        
        guard let actual = try? sut.toRealm(from: dto) else {
            XCTFail("Expected to pass.")
            return // to satisfy xcode
        }
        
        XCTAssertEqual(expected[0].id, actual[0].id)
        XCTAssertEqual(expected[0].name, actual[0].name)
        XCTAssertEqual(expected[0].bredFor, actual[0].bredFor)
    }
    
    func test_toRealm_whereOptionalsAreNil_Success() {
        var expected = [RealmBreed]()
        expected.append(RealmBreed(
            id: 1,
            name: "Test dog",
            weight: nil,
            height: nil,
            bredFor: nil,
            breedGroup: nil,
            lifeSpan: nil,
            temperament: nil,
            origin: nil,
            image: nil
        ))
        var dto = [BreedDto]()
        dto.append(BreedDto(
            id: 1,
            name: "Test dog",
            weight: nil,
            height: nil,
            bred_for: nil,
            breed_group: nil,
            life_span: nil,
            temperament: nil,
            origin: nil,
            reference_image_id: nil,
            image: nil
        ))
        
        guard let actual = try? sut.toRealm(from: dto) else {
            XCTFail("Expected to pass.")
            return // to satisfy xcode
        }
        
        XCTAssertEqual(expected[0].id, actual[0].id)
        XCTAssertEqual(expected[0].name, actual[0].name)
        XCTAssertEqual(expected[0].bredFor, actual[0].bredFor)
    }
    
    func test_toRealm_whenIdIsNull_thenMissingValueErrorThrown() {
        var dto = [BreedDto]()
        dto.append(BreedDto(
            id: nil,
            name: "Test dog",
            weight: nil,
            height: nil,
            bred_for: nil,
            breed_group: nil,
            life_span: nil,
            temperament: nil,
            origin: nil,
            reference_image_id: nil,
            image: nil
        ))
        
        do {
            _ = try sut.toRealm(from: dto)
        } catch let error as MappingErrors {
            switch error {
            case MappingErrors.missingValue(let text):
                XCTAssertEqual(text, "breed.id")
            default: XCTFail("Expected missing value error. Got: \(error)")
            }
        } catch {
            XCTFail("Expected missing value error. Got: \(error)")
        }
    }
    
    func test_toRealm_whenNameIsNull_thenMissingValueErrorThrown() {
        var dto = [BreedDto]()
        dto.append(BreedDto(
            id: 1,
            name: nil,
            weight: nil,
            height: nil,
            bred_for: nil,
            breed_group: nil,
            life_span: nil,
            temperament: nil,
            origin: nil,
            reference_image_id: nil,
            image: nil
        ))
        
        do {
            _ = try sut.toRealm(from: dto)
        } catch let error as MappingErrors {
            switch error {
            case MappingErrors.missingValue(let text):
                XCTAssertEqual(text, "breed.name")
            default: XCTFail("Expected missing value error. Got: \(error)")
            }
        } catch {
            XCTFail("Expected missing value error. Got: \(error)")
        }
    }
}
