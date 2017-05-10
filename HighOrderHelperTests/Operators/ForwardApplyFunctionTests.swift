import XCTest
@testable import HighOrderHelper

final class ForwardApplyFunctionTests: XCTestCase {

    func test_OneArgument_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?) -> Int in return a! }
        let expect = f(1)
        let actual = 1 |> f
        XCTAssertEqual(expect, actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?) -> Int in return a! }
        let actual = nil |> f
        XCTAssertNil(actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?) -> Int? in return a }
        let expect = f(1)
        let actual = 1 |> f
        XCTAssertEqual(expect, actual)
    }

    func test_OneArgument_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?) -> Int? in return a }
        XCTAssertNil(nil |> f)
    }

    func test_TowArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int) -> Int in return a! + b }
        let expect = f(1, 2)
        let actual = 1 |> (f, 2)
        XCTAssertEqual(expect, actual)
    }

    func test_TowArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int) -> Int in return a! + b }
        XCTAssertNil(nil |> (f, 2))
    }

    func test_TowArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int) -> Int? in return .some(a! + b) }
        let expect = f(1, 2)
        let actual = 1 |> (f, 2)
        XCTAssertEqual(expect, actual)
    }

    func test_TowArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int) -> Int? in return .some(a! + b) }
        XCTAssertNil(nil |> (f, 2))
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int in return a! + b + c }
        let expect = f(1, 2, 3)
        let actual = 1 |> (f, 2, 3)
        XCTAssertEqual(expect, actual)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int in return a! + b + c }
        XCTAssertNil(nil |> (f, 2, 3))
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int? in return .some(a! + b + c) }
        let expect = f(1, 2, 3)
        let actual = 1 |> (f, 2, 3)
        XCTAssertEqual(expect, actual)
    }

    func test_ThreeArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int) -> Int? in return .some(a! + b + c) }
        XCTAssertNil(nil |> (f, 2, 3))
    }

    func test_FourArguments_InputIsNilAndReturnIsNotNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int in return a! + b + c + d }
        let expect = f(1, 2, 3, 4)
        let actual = 1 |> (f, 2, 3, 4)
        XCTAssertEqual(expect, actual)
    }

    func test_FourArguments_InputIsNilAndReturnIsNotNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int in return a! + b + c + d }
        XCTAssertNil(nil |> (f, 2, 3, 4))
    }

    func test_FourArguments_InputIsNilAndReturnIsNilFunction() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int? in return .some(a! + b + c + d) }
        let expect = f(1, 2, 3, 4)
        let actual = 1 |> (f, 2, 3, 4)
        XCTAssertEqual(expect, actual)
    }

    func test_FourArguments_InputIsNilAndReturnIsNilFunction_WhenGivenNil() {
        let f = { (_ a: Int?, _ b: Int, _ c: Int, _ d: Int) -> Int? in return .some(a! + b + c + d) }
        XCTAssertNil(nil |> (f, 2, 3, 4))
    }

}
