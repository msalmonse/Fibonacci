//
//  Binet.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

private let root5 = sqrt(5.0)
private let log2root5 = log2(root5)
private let phi = (1.0 + root5)/2.0
private let log2phi = log2(phi)

func fBinet(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    // pow(phi, n) == exp2(log2(phi)) * n
    return Int(round(exp2(log2phi * Double(n) - log2root5)))
}

func fBinet2(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    // pow(phi, n) == exp2(log2(phi)) * n
    return Int(round(pow(phi, Double(n))/root5))
}
