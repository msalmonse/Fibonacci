//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

let loopCount = 1000000

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

print("\"n\"", terminator: "")
_ = Implementation.allCases.map { print(",\"\($0.name())\"", terminator: "") }
print()

for n in 1...160 {
    print("\(n)", terminator: "")
    for imp in Implementation.allCases {
        let runCount = loopCount/imp.countDivisor()

        if !imp.checkMax(n) {
            print(",", terminator: "")
        } else {
            let runTime = String(format: "%.1f",
                timeImplementation(n, count: runCount, imp: imp)/Double(runCount)
            )
            print(",\(runTime)", terminator: "")
        }
    }
    print()
}
