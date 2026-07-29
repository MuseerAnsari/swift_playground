// https://leetcode.com/problems/reverse-vowels-of-a-string/

/*
 Given a string s, reverse only all the vowels in the string and return it.
 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 Example 1:
 Input: s = "IceCreAm"
 Output: "AceCreIm"
 Explanation:

 The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".
 */

import Foundation

func reverseVowels(_ s: String) -> String {
    
    let vowelsSet: Set<Character> = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]
    var vowels: [Character] = []
    
    for char in s {
        if vowelsSet.contains(char) {
            vowels.append(char)
        }
    }
    
    var chars = Array(s)
    for i in 0..<chars.count {
        let current = chars[i]
        if vowelsSet.contains(current) {
            let last = vowels.removeLast()
            chars[i] = last
        }
    }

    return String(chars)
}

//print(reverseVowels("IceCreAm"))


func reverseVowels2(_ s: String) -> String {
    
    let vowelsSet: Set<Character> = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]
    var chars = Array(s)
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        let leftChar = chars[left]
        let rightChar = chars[right]
        
        if !vowelsSet.contains(leftChar) {
            left += 1
            continue
        }
        
        if !vowelsSet.contains(rightChar) {
            right -= 1
            continue
        }
        
        chars.swapAt(left, right)
        left += 1
        right -= 1
    }
 
    return String(chars)
}

print(reverseVowels2("IceCreAm"))
