import XCTest
@testable import EquallySpacedStack

final class EquallySpacedStackTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EquallySpacedStack().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
