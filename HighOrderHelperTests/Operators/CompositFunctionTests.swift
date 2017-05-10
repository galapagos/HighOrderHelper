import XCTest
@testable import HighOrderHelper

final class CompositFunctionTests: XCTestCase {

    private let f1 = { (_ a: Int) -> Int in return a * 2 }

    private let f2 = { (_ a: Int) -> String in return "\(a)" }

    func testRightCompose() {
        let expect = f2(f1(2))
        let actual = (f1 >>> f2)(2)
        XCTAssertEqual(expect, actual)
     }

    func testLeftCompose() {
        let expect = f2(f1(2))
        let actual = (f2 <<< f1)(2)
        XCTAssertEqual(expect, actual)
    }

}
