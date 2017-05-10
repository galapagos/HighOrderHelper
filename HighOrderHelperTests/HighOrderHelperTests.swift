import XCTest
@testable import HighOrderHelper

final class HighOrderHelperTests: XCTestCase {

    func testIdentity() {
        let expect = "a"
        let actual = identity("a")
        XCTAssertEqual(expect, actual)
    }

    func testAlways() {
        let expect = "a"
        let actual = always("a", "b")
        XCTAssertEqual(expect, actual)
    }

    func testFlip() {
        let f = { (_ a: String, _ b: Int) -> String in return "\(a)\(b)" }
        let expect = f("a", 0)
        let actual = flip(f)(0, "a")
        XCTAssertEqual(expect, actual)
    }

    func testCurryWhenTowArgumentFunction() {
        let f = { (_ a: Int, _ b: Int) -> Int in return a + b }
        let expect = f(1, 2)
        let actual = curry(f)(1)(2)
        XCTAssertEqual(expect, actual)
    }

    func testCurryWhenThreeArgumentFunction() {
        let f = { (_ a: Int, _ b: Int, _ c: Int) -> Int in return a + b + c }
        let expect = f(1, 2, 3)
        let actual = curry(f)(1)(2)(3)
        XCTAssertEqual(expect, actual)
    }

    func testCurryWhenFourArgumentFunction() {
        let f = { (_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int in return a + b + c + d }
        let expect = f(1, 2, 3, 4)
        let actual = curry(f)(1)(2)(3)(4)
        XCTAssertEqual(expect, actual)
    }

    func testUncurryWhenTowArgumentFunction() {
        let f = curry({ (_ a: Int, _ b: Int) -> Int in return a + b })
        let expect = f(1)(2)
        let actual = uncurry(f)(1, 2)
        XCTAssertEqual(expect, actual)
    }

    func testUncurryWhenThreeArgumentFunction() {
        let f = curry({ (_ a: Int, _ b: Int, _ c: Int) -> Int in return a + b + c })
        let expect = f(1)(2)(3)
        let actual = uncurry(f)(1, 2, 3)
        XCTAssertEqual(expect, actual)
    }

    func testUncurryWhenFourArgumentFunction() {
        let f = curry({ (_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int in return a + b + c + d })
        let expect = f(1)(2)(3)(4)
        let actual = uncurry(f)(1, 2, 3, 4)
        XCTAssertEqual(expect, actual)
    }

}
