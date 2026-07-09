//https://leetcode.com/problems/valid-palindrome/
/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 */

func isValidePalindrome(_ s: String) -> Bool {
    let str = s.filter({$0.isLetter || $0.isNumber}).lowercased()
    let revesreStr = String(str.reversed())
    return str == revesreStr
}

func solution(_ s: String) -> Bool {
    
    let str = s.filter({$0.isLetter || $0.isNumber}).lowercased()
    var aOs = Array(str)
    var left = 0
    var right = aOs.count - 1
    
    while left < right {
        if aOs[left] != aOs[right] { return false }
        left += 1
        right -= 1
    }
    return true
}

