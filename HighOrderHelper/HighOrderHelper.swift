/// Given a value, returns exactly the same value.
///
/// - See: https://en.wikipedia.org/wiki/Identity_function
/// - Parameter input: input value
/// - Returns: same to input value
public func identity<T>(_ input: T) -> T {
    return input
}

/// Always returns the given first argument value.
///
/// - Parameters:
///   - first: always returned value.
///   - second: value that will never returned.
/// - Returns: first argument.
public func always<T, U>(_ first: T, _ second: U) -> T {
    return first
}

/// Flip the order of the first two arguments to a function.
///
/// - Parameter f: target function.
/// - Returns: flipped argument function.
public func flip<T, U, V>(_ f: @escaping (T, U) -> V) -> (U, T) -> V {
    return { (_ a: U, _ b: T) in f(b, a) }
}

/// Change how arguments are passed to a function.
///
/// - Parameter f: target function.
/// - Returns: curried function.
public func curry<T, U, V>(_ f: @escaping (T, U) -> V) -> (T) -> (U) -> V {
    return { (_ a: T) -> (U) -> V in
        return { (_ b: U) -> V in
            return f(a, b)
        }
    }
}

public func curry<T, U, V, W>(_ f: @escaping (T, U, V) -> W) -> (T) -> (U) -> (V) -> W {
    return { (_ a: T) -> (U) -> (V) -> W in
        return { (_ b: U) -> (V) -> W in
            return { (_ c: V) -> W in
                return f(a, b, c)
            }
        }
    }
}

public func curry<T, U, V, W, X>(_ f: @escaping (T, U, V, W) -> X) -> (T) -> (U) -> (V) -> (W) -> X {
    return { (_ a: T) -> (U) -> (V) -> (W) -> X in
        return { (_ b: U) -> (V) -> (W) -> X in
            return { (_ c: V) -> (W) -> X in
                return { (_ d: W) -> X in
                    return f(a, b, c, d)
                }
            }
        }
    }
}

/// Change how arguments are passed to a function.
///
/// - Parameter f: target function.
/// - Returns: uncurried function.
public func uncurry<T, U, V>(_ f: @escaping (T) -> (U) -> V) -> (T, U) -> V {
    return { (_ a: T, _ b: U) -> V in return f(a)(b) }
}

public func uncurry<T, U, V, W>(_ f: @escaping (T) -> (U) -> (V) -> W) -> (T, U, V) -> W {
    return { (_ a: T, _ b: U, _ c: V) -> W in return f(a)(b)(c) }
}

public func uncurry<T, U, V, W, X>(_ f: @escaping (T) -> (U) -> (V) -> (W) -> X) -> (T, U, V, W) -> X {
    return { (_ a: T, _ b: U, _ c: V, _ d: W) -> X in return f(a)(b)(c)(d) }
}
