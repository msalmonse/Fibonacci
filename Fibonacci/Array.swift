//
//  Array.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

private let fibsMax = 92
private let fibs = Array(0...fibsMax).map { fIterative($0) }

func fArray(_ n: Int) -> Decimal {
    guard n > 0 else { return 0 }
    guard n <= fibsMax else { return -1 }

    return fibs[n]
}
