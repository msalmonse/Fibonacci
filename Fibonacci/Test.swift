//
//  Test.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-28.
//

import Foundation

func test(_ i1: Implementation, _ i2: Implementation, _ n: Int) -> Bool {
    if i1.checkMax(n) && i2.checkMax(n) {
        if runImplementation(n, imp: i1) != runImplementation(n, imp: i2) {
            print("\(i1.name())(\(n)) != \(i2.name())(\(n))")
            return false
        }
    }
    return true
}
