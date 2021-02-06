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
