//
//  Hybrid.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-02-14.
//

import Foundation

func fHybrid(_ n: Int) -> Decimal {
    if n < 40 {
        return fArray(n)
    } else {
        // use fib(i+j) == fib(i+1)*fib(j) + fib(i)*fib(j-1)
        let i = n >> 1
        let j = n - i
        if i == j {
            let k = fHybrid(i)      // also fib(j)
            let l = fHybrid(i - 1)  // also fib(j-1)
            // fib(i + 1) == fib(i) + fib(i - 1)
            return (k + l) * k + k * l
        } else {
            // i == j - 1 and j == i + 1
            let k = fHybrid(i)
            let l = fHybrid(j)
            return k * k + l * l
        }
    }
}
