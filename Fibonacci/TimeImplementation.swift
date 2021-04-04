//
//  TimeImplementation.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-02.
//

import Foundation

func blockRunTime<T>(count: Int = 1, _ block: () -> T) -> Double {
    let stt = clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
    for _ in 1...count {
        _ = block()
    }
    let dur = Double(clock_gettime_nsec_np(CLOCK_UPTIME_RAW) - stt)

    return dur
}

enum Implementation: CaseIterable {
    case array, binet1, binet2, iterative, recursive, recursive1, recursive2, hybrid

    func checkMax(_ n: Int) -> Bool {
        switch self {
        case .array: return n <= nMax
        case .binet1: return n < 70
        case .binet2: return n < 70
        case .recursive: return n < 20
        case .recursive1: return n < 70
        case .recursive2: return n < 190
        default: return true
        }
    }

    func countDivisor() -> Int {
        switch self {
        case .binet1: return 1000
        case .binet2: return 1000
        case .hybrid: return 50
        case .iterative: return 1000
        case .recursive: return 10000
        case .recursive1: return 50
        case .recursive2: return 50
        default: return 1
        }
    }

    func name() -> String {
        switch self {
        case .array: return "Array"
        case .binet1: return "Binet1"
        case .binet2: return "Binet2"
        case .hybrid: return "Hybrid"
        case .iterative: return "Iterative"
        case .recursive: return "Recursive"
        case .recursive1: return "Recursive1"
        case .recursive2: return "Recursive2"
        }
    }
}

func runImplementation(_ n: Int, imp: Implementation) -> Decimal {
    switch imp {
    case .array: return fArray(n)
    case .binet1: return fBinet1(n)
    case .binet2: return fBinet2(n)
    case .hybrid: return fHybrid(n)
    case .iterative: return fIterative(n)
    case .recursive: return fRecursive(n)
    case .recursive1: return fRecursive1(n)
    case .recursive2: return fRecursive2(n)
    }
}

func timeImplementation(_ n: Int, count: Int, imp: Implementation) -> Double {
    switch imp {
    case .array: return blockRunTime(count: count) {fArray(n)}
    case .binet1: return blockRunTime(count: count) {fBinet1(n)}
    case .binet2: return blockRunTime(count: count) {fBinet2(n)}
    case .hybrid: return blockRunTime(count: count) {fHybrid(n)}
    case .iterative: return blockRunTime(count: count) {fIterative(n)}
    case .recursive: return blockRunTime(count: count) {fRecursive(n)}
    case .recursive1: return blockRunTime(count: count) {fRecursive1(n)}
    case .recursive2: return blockRunTime(count: count) {fRecursive2(n)}
    }
}
