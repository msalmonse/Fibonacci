//
//  Binet.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

let log2root5 = log2(5.0)/2.0
let log2phi = log2(1.0 + sqrt(5.0)) - 1.0

func fBinet(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    // pow(phi, n) == exp2(log2(phi) * n
    return Int(round(exp2(log2phi * Double(n) - log2root5)))
}
