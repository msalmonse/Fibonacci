//
//  Recursive.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation

func fRecursive(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    
    if n > 40 { print(n) }

    if n > 2 { return fRecursive(n - 1) + fRecursive(n - 2) }
    return 1
}

func fRecursive2(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    switch n {
    case 1: return 1
    case 2: return 1
    case 3: return 2
    case 4: return 3
    case 5: return 5
    case 6: return 8
    case 7: return 13
    case 8: return 21
    case 9: return 34
    default:
        // use fib(i+j) == fib(i+1)*fib(j) + fib(i)*fib(j-1)
        let i = n >> 1
        let j = n - (i << 1)
        return fRecursive2(i + 1) * fRecursive2(j) + fRecursive2(i) * fRecursive2(j - 1)
    }
}

func fRecursive10(_ n: Int) -> Int {
    guard n > 0 else { return 0 }

    switch n {
    case 1: return 1
    case 2: return 1
    case 3: return 2
    case 4: return 3
    case 5: return 5
    case 6: return 8
    case 7: return 13
    case 8: return 21
    case 9: return 34
    default:
        // No need to calculate intermediate values
        return 55 * fRecursive10(n - 9) + 34 * fRecursive10(n - 10)
    }
}
