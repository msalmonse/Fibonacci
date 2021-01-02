//
//  main.swift
//  Fibonacci
//
//  Created by Michael Salmon on 2020-12-31.
//

import Foundation
import BlockRunTime

let n = 40
print("Recursive fib(\(n)): \(fRecursive(n))")
print("Loop unrolled fib(\(n)): \(fRecursive10(n))")
print("Iterative fib(\(n)): \(fIterative(n))")
print("Binet fib(\(n)): \(fBinet(n))")
print("Array fib(\(n)): \(fArray(n))")
