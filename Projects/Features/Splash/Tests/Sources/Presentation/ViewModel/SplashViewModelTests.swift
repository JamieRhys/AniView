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
    
    override func setUp() {
        super.setUp()
        
        sut = SplashViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
// MARK: Test Cases
    
    func test_initialLoadingState_is_loading() throws {
        // Setup
        let expected: LoadingState = LoadingState.loading
        
        // Given: The ViewModel has been initialised in setUp()
        
        // When: We request the initial value of loadingState Driver
        let actual: LoadingState? = try sut.loadingState.toBlocking().first()
        
        XCTAssertNotNil(actual, "loadingState Driver should emit at least one element.")
        XCTAssertEqual(expected, actual!, "Initial loadingState should be LoadingState.loading")
        XCTAssertTrue(false)
    }
}
