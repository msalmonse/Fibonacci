//
//  Array.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

private let fibs = Array(0...nMax).map { fIterative($0) }

func fArray(_ n: Int) -> Decimal {
    guard n > 0 else { return 0 }
    guard n <= nMax else { return -1 }

    return fibs[n]
}
