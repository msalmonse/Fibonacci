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
    case array, binet, binet2, iterative, recursive, recursive2, recursive10

    func checkMax(_ n: Int) -> Bool {
        switch self {
        case .array: return n <= nMax
        case .binet: return n < 33
        case .binet2: return n < 67
        case .recursive: return n < 20
        case .recursive2: return n < 190
        case .recursive10: return n < 65
        default: return true
        }
    }

    func countDivisor() -> Int {
        switch self {
        case .binet: return 1000
        case .binet2: return 1000
        case .iterative: return 1000
        case .recursive: return 10000
        case .recursive2: return 100
        case .recursive10: return 50
        default: return 1
        }
    }

    func name() -> String {
        switch self {
        case .array: return "Array"
        case .binet: return "Binet"
        case .binet2: return "Binet2"
        case .iterative: return "Iterative"
        case .recursive: return "Recursive"
        case .recursive2: return "Recursive2"
        case .recursive10: return "Recursive10"
        }
    }
}

func runImplementation(_ n: Int, imp: Implementation) -> Decimal {
    switch imp {
    case .array: return fArray(n)
    case .binet: return fBinet(n)
    case .binet2: return fBinet2(n)
    case .iterative: return fIterative(n)
    case .recursive: return fRecursive(n)
    case .recursive2: return fRecursive2(n)
    case .recursive10: return fRecursive10(n)
    }
}

func timeImplementation(_ n: Int, count: Int, imp: Implementation) -> Double {
    switch imp {
    case .array: return blockRunTime(count: count) {fArray(n)}
    case .binet: return blockRunTime(count: count) {fBinet(n)}
    case .binet2: return blockRunTime(count: count) {fBinet2(n)}
    case .iterative: return blockRunTime(count: count) {fIterative(n)}
    case .recursive: return blockRunTime(count: count) {fRecursive(n)}
    case .recursive2: return blockRunTime(count: count) {fRecursive2(n)}
    case .recursive10: return blockRunTime(count: count) {fRecursive10(n)}
    }
}
