import XCTest
@testable import SwiftZSTD

final class SwiftZSTDTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftZSTD().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
