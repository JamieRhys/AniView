
import XCTest
@testable import Splash

final class SplashControllerTests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func test_example() {
        XCTAssertTrue(true)
    }
}
