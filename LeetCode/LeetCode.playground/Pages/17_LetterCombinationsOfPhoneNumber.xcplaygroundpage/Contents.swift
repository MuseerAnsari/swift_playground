// https://leetcode.com/problems/letter-combinations-of-a-phone-number/
/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 Example 1:
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 Example 2:
 Input: digits = "2"
 Output: ["a","b","c"]
 */


import Foundation

func letterCombinations(_ digits: String) -> [String] {
    
    // Dictionary mapping digits to their corresponding letters on phone keypad
    let phoneMap: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    
    guard !digits.isEmpty else { return [] }
    
    let chars = Array(digits)
    var result: [String] = []
    
    func backTrace(_ index: Int, _ path: inout String) {
        if index == chars.count {
            result.append(path)
            return
        }
        
        let digit = chars[index]
        guard let letters = phoneMap[digit] else { return }
        
        for char in letters {
            path.append(char)
            backTrace(index + 1, &path)
            path.removeLast()
        }
    }
    var current = ""
    backTrace(0, &current)
    return result
}

func letterCombinations2(_ digits: String) -> [String] {
    // Handle empty input
    if digits.isEmpty { return [] }
    // Dictionary mapping digits to their corresponding letters on phone keypad
    let phoneMap: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    let digits = Array(digits)
    // Final answers
    var result: [String] = []
    
    func solve(_ index: Int, _ path: String) {
        // If we have processed all digits, store the current combination
        if path.count == digits.count {
            result.append(path)
            return
        }
        // Get the current digit
        let digit = digits[index]
        // Find the letters mapped to this digit
        guard let letters = phoneMap[digit] else { return }
        // Try every letter for the current digit
        for letter in letters {
            // Recurse for the next digit
            solve(index + 1, path + String(letter))
        }
    }
    // Start recursion from the first digit
    solve(0, "")
    return result
}

print(letterCombinations2("2"))
