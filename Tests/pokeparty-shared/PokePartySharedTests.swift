import XCTest
@testable import pokeparty-shared

class pokeparty-sharedTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(pokeparty-shared().text, "Hello, World!")
    }


    static var allTests : [(String, (pokeparty-sharedTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
