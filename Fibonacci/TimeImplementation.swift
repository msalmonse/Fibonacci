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
    case array, binet, iterative, recursive, recursive10
    
    func name() -> String {
        switch self {
        case .array: return "Array"
        case .binet: return "Binet"
        case .iterative: return "Iterative"
        case .recursive: return "Recursive"
        case .recursive10: return "Recursive10"
        }
    }
}

func timeImplementation(_ n: Int, count: Int, imp: Implementation) -> Double {
    switch imp {
    case .array: return blockRunTime(count: count) {fArray(n)}
    case .binet: return blockRunTime(count: count) {fBinet(n)}
    case .iterative: return blockRunTime(count: count) {fIterative(n)}
    case .recursive: return blockRunTime(count: count) {fRecursive(n)}
    case .recursive10: return blockRunTime(count: count) {fRecursive10(n)}
    }
}
