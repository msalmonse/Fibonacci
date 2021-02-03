//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

let loopCount = 1000000
let nList = [ 1, 2, 3, 6, 9, 14, 21, 32, 48, 64, 77, 92, 127, 160 ]

var comparedOK = true

// compare implementations
for n in 1...92 {
    let impList = Implementation.allCases.filter { $0.checkMax(n) }
    let res1 = runImplementation(n, imp: impList[0])
    for i in 1..<impList.count {
        let res2 = runImplementation(n, imp: impList[i])
        if res1 != res2 {
            print("\(impList[0].name())(\(n))(\(res1)) != \(impList[i].name())(\(n))(\(res2))")
            comparedOK = false
        }
    }
}

if !comparedOK { exit(1) }

for imp in Implementation.allCases {
    let runCount = loopCount/imp.countDivisor()
    for n in nList {
        if imp.checkMax(n) {
            let runTime = String(format: "%.1f",
                timeImplementation(n, count: runCount, imp: imp)/Double(runCount)
            )
            print("\(imp.name())(\(n)) took \(runTime) ns.")
        }
    }
}
