// https://leetcode.com/problems/longest-palindromic-substring/description/
/*
 Given a string s, return the longest palindromic substring in s.

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 
 Example 2:
 Input: s = "cbbd"
 Output: "bb"
 */
import Foundation


func longestPalindrome(_ s: String) -> String {
    
    let chars = Array(s)
    var result = ""
    for i in 0..<chars.count {
        for j in i..<chars.count {
            print(chars[i...j])
            let tempResult = String(chars[i...j])
            if isStringPalindrom(tempResult) {
                if tempResult.count > result.count {
                    result = tempResult
                }
            }
        }
    }
    
    func isStringPalindrom(_ s: String) -> Bool {
        return s == String(s.reversed())
    }

    return result
}
//print(longestPalindrome("babad"))

func longestPalindromeOptimal(_ s: String) -> String {
    
    let chars = Array(s)
    var result = ""
    
    func getLongestPalindrome(_ index: Int) -> String {
        var left = index
        var right = index
        
        // incase left char is same
        while left - 1 >= 0
                && chars[left - 1] == chars[left] {
            left -= 1
        }
        // incase right char is same
        while right + 1 < chars.count
                && chars[right] == chars[right + 1] {
            right += 1
        }
        // while left and right chars are same
        while left - 1 >= 0
                && right + 1 < chars.count
                && left <= right
                && chars[left - 1] == chars[right + 1] {
            
            left -= 1
            right += 1
        }
        let palindrom = String(chars[left...right])
        return palindrom
    }
    
    for i in 0..<chars.count {
        let palindrom = getLongestPalindrome(i)
        if palindrom.count > result.count {
            result = palindrom
        }
    }
    
    return result
}

print(longestPalindromeOptimal("baaba"))
