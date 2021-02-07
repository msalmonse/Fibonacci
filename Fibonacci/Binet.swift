//
//  Binet.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

private let root5 = sqrt(5.0)
private let logroot5 = Decimal(log(root5))
private let phi = (1.0 + root5)/2.0
private let logphi = Decimal(log(phi))

func fBinet(_ n: Int) -> Decimal {
    guard n > 0 else { return 0 }

    // pow(phi, n) == exp2(log2(phi)) * n
    return round(exp(logphi * Decimal(n) - logroot5))
}

func fBinet2(_ n: Int) -> Decimal {
    guard n > 0 else { return 0 }

    // pow(phi, n) == exp2(log2(phi)) * n
    return round(pow(Decimal(phi), n)/Decimal(root5))
}
