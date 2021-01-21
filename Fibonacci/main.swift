//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation
import BlockRunTime

let loopCount = 1000
let shiftMax = 5

for i in 0...shiftMax {
    let n = 2 >> i
    for imp: Implementation in [ .array, .binet, .iterative, .recursive, .recursive10] {
        _ = timeImplementation(n, count: loopCount, imp: imp)
    }
}
