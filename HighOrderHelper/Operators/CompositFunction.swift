precedencegroup CompositFunctionRightPrecedence {
    associativity: left
}

infix operator >>> : CompositFunctionRightPrecedence

func >>> <A, B, Z>(lhs: @escaping (A) -> B, rhs: @escaping (B) -> Z) -> (A) -> Z {
    return { (_ a: A) -> Z in rhs(lhs(a)) }
}

precedencegroup CompositFunctionLeftPrecedence {
    associativity: right
}

infix operator <<< : CompositFunctionLeftPrecedence

func <<< <A, B, Z>(lhs: @escaping (B) -> Z, rhs: @escaping (A) -> B) -> (A) -> Z {
    return { (_ a: A) -> Z in lhs(rhs(a)) }
}
