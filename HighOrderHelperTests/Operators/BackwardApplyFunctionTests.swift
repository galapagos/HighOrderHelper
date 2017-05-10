import XCTest
@testable import HighOrderHelper

final class BackwardApplyFunctionTests: XCTestCase {

    func test_OneArgument_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?) -> Int in return a! }
        let expect = f(1)
        let actual = f <| 1
        XCTAssertEqual(expect, actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?) -> Int in return a! }
        let actual = f <| nil
        XCTAssertNil(actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?) -> Int? in return a }
        let expect = f(1)
        let actual = f <| 1
        XCTAssertEqual(expect, actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?) -> Int? in return a }
        XCTAssertNil(f <| nil)
    }

    func test_TowArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int) -> Int in return a! + b }
        let expect = f(1, 2)
        let actual = (f, 1) <| 2
        XCTAssertEqual(expect, actual)
    }

    func test_TowArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int) -> Int in return a! + b }
        XCTAssertNil((f, 1) <| nil)
    }

    func test_TowArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int) -> Int? in return .some(a! + b) }
        let expect = f(1, 2)
        let actual = (f, 1) <| 2
        XCTAssertEqual(expect, actual)
    }

    func test_TowArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int) -> Int? in return .some(a! + b) }
        XCTAssertNil((f, 1) <| nil)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int in return a! + b + c }
        let expect = f(1, 2, 3)
        let actual = (f, 1, 2) <| 3
        XCTAssertEqual(expect, actual)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int in return a! + b + c }
        XCTAssertNil((f, 1, 2) <| nil)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int? in return .some(a! + b + c) }
        let expect = f(1, 2, 3)
        let actual = (f, 1, 2) <| 3
        XCTAssertEqual(expect, actual)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int? in return .some(a! + b + c) }
        XCTAssertNil((f, 1, 2) <| nil)
    }

    func test_FourArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int in return a! + b + c + d }
        let expect = f(1, 2, 3, 4)
        let actual = (f, 1, 2, 3) <| 4
        XCTAssertEqual(expect, actual)
    }

    func test_FourArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int in return a! + b + c + d }
        XCTAssertNil((f, 1, 2, 3) <| nil)
    }

    func test_FourArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int? in return .some(a! + b + c + d) }
        let expect = f(1, 2, 3, 4)
        let actual = (f, 1, 2, 3) <| 4
        XCTAssertEqual(expect, actual)
    }

    func test_FourArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int? in return .some(a! + b + c + d) }
        XCTAssertNil((f, 1, 2, 3) <| nil)
    }
    
}
