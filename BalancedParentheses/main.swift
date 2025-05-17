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

// Console input
print("Enter a string to check for balanced parentheses:")

if let input = readLine() {
    let result = isBalancedParentheses(input: input)
    print("The parentheses in the string are \(result ? "balanced" : "not balanced").")
} else {
    print("No input received.")
}
