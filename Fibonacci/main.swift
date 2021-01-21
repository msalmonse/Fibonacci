//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

let loopCount = 10
let shiftMax = 6

_ = timeImplementation(3, count: 1, imp: .recursive)
for i in 0...shiftMax {
    let n = 1 << i
    for imp in Implementation.allCases {
        let runTime =
            String(format: "%.1f", timeImplementation(n, count: loopCount, imp: imp))
        print("\(imp.name())(\(n)) took \(runTime) ns.")
    }
}
