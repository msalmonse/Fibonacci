//
//  Iterative.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

func fIterative(_ n: Int) -> Decimal {
    guard n > 0 else { return 0 }

    if n == 1 { return 1 }

    var fib1: Decimal = 1
    var fib2: Decimal = 0

    for _ in 2...n {
        let t = fib1 + fib2
        fib2 = fib1
        fib1 = t
    }

    return fib1
}
