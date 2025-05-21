//
//  main.swift
//  BalancedParantheses
//
//  Created by Bartosz Pabian on 17/05/2025.
//

import Foundation

public func isBalancedParentheses(input: String) -> Bool {
    var balance = 0
    
    for char in input {
        if char == "(" {
            balance += 1
        } else if char == ")" {
            balance -= 1
            
            if balance < 0 {
                return false
            }
        }
    }
    return balance == 0
}

// Test cases function
func runTests() {
    let testCases: [(String, Bool)] = [
        // Edge cases mentioned in the review
        (")(", false),     // This should be unbalanced - closing before opening
        (")()(", false),   // This should be unbalanced - starts with closing
        
        // Valid balanced cases
        ("", true),        // Empty string is balanced
        ("()", true),      // Simple balanced case
        ("(())", true),    // Nested balanced case
        ("()()", true),    // Multiple balanced pairs
        ("((())())", true), // Complex balanced case
        
        // Invalid cases
        ("(", false),      // Only opening
        (")", false),      // Only closing
        ("(()", false),    // More opening than closing
        ("())", false),    // More closing than opening
        ("())(()", false), // Initially balanced but then unbalanced
        ("((())", false),  // Nested but unbalanced
        (")()())", false), // Multiple pairs but overall unbalanced
    ]
    
    var passedTests = 0
    var failedTests: [(String, Bool, Bool)] = [] // (input, expected, actual)
    
    for (input, expected) in testCases {
        let result = isBalancedParentheses(input: input)
        if result == expected {
            passedTests += 1
        } else {
            failedTests.append((input, expected, result))
        }
    }
    
    // Report results
    print("Test Results:")
    print("Passed: \(passedTests) of \(testCases.count)")
    
    if !failedTests.isEmpty {
        print("\nFailed Tests:")
        for (input, expected, actual) in failedTests {
            print("Input: \"\(input)\"")
            print("  Expected: \(expected ? "balanced" : "unbalanced")")
            print("  Actual:   \(actual ? "balanced" : "unbalanced")\n")
        }
    }
}

// Run the tests
print("Running test cases for isBalancedParentheses function:")
runTests()

// Console input
print("\nEnter a string to check for balanced parentheses:")

if let input = readLine() {
    let result = isBalancedParentheses(input: input)
    print("The parentheses in the string are \(result ? "balanced" : "not balanced").")
} else {
    print("No input received.")
}
