//
//  TimeImplementation.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2021-01-02.
//

import Foundation

// measure run time of count runs of block in seconds
func impRunTime(count: Int = 1, n: Int, imp: Implementation) -> Double {
    if #available(macOS 13.0, *) {
        let clock = ContinuousClock()
        let elapsed = clock.measure {
            for _ in 1...count {
                _ = runImplementation(n, imp: imp)
            }
        }

        let (seconds, attoseconds) = elapsed.components
        return Double(seconds) + Double(attoseconds)/1.0e18
    } else {
        let stt = clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
        for _ in 1...count {
            _ = runImplementation(n, imp: imp)
        }
        let dur = Double(clock_gettime_nsec_np(CLOCK_UPTIME_RAW) - stt)

        return dur * 1e-9
    }
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
        case .recursive2: return n < 80
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
