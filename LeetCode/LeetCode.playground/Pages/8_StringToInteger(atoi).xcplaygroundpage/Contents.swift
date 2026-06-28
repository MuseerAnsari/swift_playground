// https://leetcode.com/problems/string-to-integer-atoi/description/
/*
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.

 Input: s = "1337c0d3"
 Output: 1337
 
 Explanation:
 Step 1: "1337c0d3" (no characters read because there is no leading whitespace)
          ^
 Step 2: "1337c0d3" (no characters read because there is neither a '-' nor '+')
          ^
 Step 3: "1337c0d3" ("1337" is read in; reading stops because the next character is a non-digit)
 */
import Foundation

func myAtoi(_ s: String) -> Int {
    let sting = s.trimmingCharacters(in: .whitespacesAndNewlines)
    var chars = Array(sting)
    var sign = 1
    var result = 0
    
    guard let first = chars.first
    else { return 0 }
    if first == "-" {
        sign = -1
        chars.dropFirst()
    } else if first == "+" {
        chars.dropFirst()
    }
    for char in chars {
        guard char.isNumber else { return result * sign }
        let num = Int(String(char)) ?? 0
        result  = result * 10 + num
        if result * sign > Int32.max {
            return Int(Int32.max)
        } else if result * sign < Int32.min {
            return Int(Int32.min)
        }
    }
    return result * sign
}

myAtoi("-13372q8w09e8q0wc0d3")
