//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

let loopCount = 1000
let nList = [ 1, 2, 3, 6, 9, 14, 21, 32, 48, 72 ]

// compare implementations
for n in nList {
    let impList = Implementation.allCases.shuffled()
    for i in stride(from: 0, through: impList.count - 1, by: 2) {
        _ = test(impList[1], impList[i + 1], n)
    }
}

for imp in Implementation.allCases {
    for n in nList {
        if imp.checkMax(n) {
            let runTime = String(format: "%.1f",
                timeImplementation(n, count: loopCount, imp: imp)/Double(loopCount)
            )
            print("\(imp.name())(\(n)) took \(runTime) ns.")
        }
    }
}
