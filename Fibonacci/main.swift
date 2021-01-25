//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

let loopCount = 1000
let shiftMax = 6

for imp in Implementation.allCases {
    for i in 0...shiftMax {
        let n = 1 << i
        if imp != .recursive || n <= 32 {
            let runTime = String(format: "%.1f",
                timeImplementation(n, count: loopCount, imp: imp)/Double(loopCount)
            )
            print("\(imp.name())(\(n)) took \(runTime) ns.")
        }
    }
}
