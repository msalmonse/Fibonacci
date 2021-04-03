//
//  DecimalMath.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-02-06.
//

import Foundation

// Round a Decimal number using NSdecimalNumber.rounding()

private let roundingBehaviour = NSDecimalNumberHandler(
    roundingMode: NSDecimalNumber.RoundingMode.plain,
    scale: 0,
    raiseOnExactness: true,
    raiseOnOverflow: true,
    raiseOnUnderflow: true,
    raiseOnDivideByZero: true
)

func round(_ n: Decimal) -> Decimal {
    let nsd = n as NSDecimalNumber
    let ret = nsd.rounding(accordingToBehavior: roundingBehaviour)
    return ret as Decimal
}

// reversed reciprocal factorial
// list of ..., 1/3!. 1/2!
private let rrFactorial = invFactList(50).reversed()

private func invFactList(_ max: Int) -> [Decimal] {
    var fact = Decimal(1)
    var ret: [Decimal] = []

    for i in 2...max {
        fact *= Decimal(i)
        ret.append(Decimal(1)/fact)
    }

    return ret
}

// Calculate e raised to the power of the input using a Taylor series via Horner's scheme

func exp(_ x: Decimal) -> Decimal {
    var res = Decimal(0)

    for mult in rrFactorial {
        res = x * (res + mult)
    }
    res = x * (res + Decimal(1)) + Decimal(1)

    return res
}
