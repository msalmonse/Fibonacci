//
//  Binet.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-01.
//

import Foundation

let root5 = sqrt(5.0)
let phi = (1.0 + root5)/2.0

func fBinet(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    return Int(round(pow(phi, Double(n))/root5))
}
