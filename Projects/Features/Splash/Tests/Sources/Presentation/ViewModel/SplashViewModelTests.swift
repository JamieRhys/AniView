//
//  SplashViewModelTests.swift
//  Splash
//
//  Created by Jamie-Rhys Edwards on 15/12/2025.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest
@testable import Splash

import Core

final class SplashViewModelTests: XCTestCase {
// MARK: Setup and Teardown
    
    private var sut: SplashViewModel!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        
        sut = SplashViewModel()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
// MARK: Test Cases - Loading State
    
    func test_initialLoadingState_is_loading() throws {
        // Setup
        let expected: LoadingState = LoadingState.loading
        // Given: The ViewModel has been initialised in setUp()
        
        // When: We request the initial value of loadingState Driver
        let actual: LoadingState? = try sut.loadingState
            .asObservable()
            .toBlocking(timeout: 1.0)
            .first()
        
        XCTAssertNotNil(actual, "loadingState Driver should emit at least one element.")
        XCTAssertEqual(expected, actual!, "Initial loadingState should be LoadingState.loading")
    }
    
// MARK: Test Cases - Title Label
    
    func test_initialTitleLabel_is_appName() throws {
        // Setup
        let expected: String = String(localized: "appName", bundle: .module)
        
        // Given: The ViewModel has been initalised in setUp()
        
        // When: We request the initial value of titleLabel Driver
        let actual: String? = try sut
            .titleLabel
            .asObservable()
            .toBlocking(timeout: 1.0)
            .first()
        
        // Then: Title should be the localised appName (AniView)
        XCTAssertEqual(expected, actual, "titleLabel should be the localised app name.")
    }
    
    func test_titleLabel_emitsOnlyOneValue() throws {
        let expected = 1
        
        // Given: The ViewModel has been initialsed in setUp()
        
        // When: Collect all emitted values (with a take(2) to ensure titleLabel does not emit
        //       more than one value.
        let actual = try sut.titleLabel
            .asObservable()
            .take(for: .milliseconds(100), scheduler: MainScheduler.instance)
            .toBlocking()
            .toArray()
        
        // Then: labelTitle should only emit one value
        XCTAssertEqual(actual.count, expected, "titleLabel should only emit one value on initialisation.")
    }
    
// MARK: Test Cases - Tick Icon
    
    func test_tickIcon_is_checkmarckCircle() throws {
        // Setup
        let expected = "checkmark.circle"
        
        // Given: The ViewModel has been initialised in setUp()
        
        // When: Request the initial value of tickIcon Driver
        let actual = try sut
            .tickIcon
            .asObservable()
            .toBlocking(timeout: 1.0)
            .first()
        
        // Then: Tick Icon should be checkmark.circle
        XCTAssertEqual(expected, actual, "tickIcon shuld be checkmark.circle.")
    }
}
