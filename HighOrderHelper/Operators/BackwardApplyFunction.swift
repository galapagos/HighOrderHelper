precedencegroup BackwardApplyFunctionPrecedence {
    associativity: right
}

infix operator <| : BackwardApplyFunctionPrecedence

public func <| <A, Z>(lhs: (A) -> Z, rhs: A?) -> Z? {
    return rhs.map(lhs)
}

public func <| <A, Z>(lhs: (A) -> Z?, rhs: A?) -> Z? {
    return rhs.flatMap(lhs)
}

public func <| <A, B, Z>(lhs: ((B, A) -> Z, B), rhs: A?) -> Z? {
    return rhs.map { lhs.0(lhs.1, $0) }
}

public func <| <A, B, Z>(lhs: ((B, A) -> Z?, B), rhs: A?) -> Z? {
    return rhs.flatMap { lhs.0(lhs.1, $0) }
}

public func <| <A, B, C, Z>(lhs: ((B, C, A) -> Z, B, C), rhs: A?) -> Z? {
    return rhs.map { lhs.0(lhs.1, lhs.2, $0) }
}

public func <| <A, B, C, Z>(lhs: ((B, C, A) -> Z?, B, C), rhs: A?) -> Z? {
    return rhs.flatMap { lhs.0(lhs.1, lhs.2, $0) }
}

public func <| <A, B, C, D, Z>(lhs: ((B, C, D, A) -> Z, B, C, D), rhs: A?) -> Z? {
    return rhs.map { lhs.0(lhs.1, lhs.2, lhs.3, $0) }
}

public func <| <A, B, C, D, Z>(lhs: ((B, C, D, A) -> Z?, B, C, D), rhs: A?) -> Z? {
    return rhs.flatMap { lhs.0(lhs.1, lhs.2, lhs.3, $0) }
}
