/*
 Given an integer x, return true if x is a palindrome, and false otherwise.

 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 */

func isPalindrome(_ x: Int) -> Bool {
    var number = x
    var result = 0
    while number != 0 {
        let reminder = number % 10
        result = result * 10 + reminder
        number = number / 10
    }
    return x == result
}

isPalindrome(1221)
