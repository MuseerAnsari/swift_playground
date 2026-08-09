// https://leetcode.com/problems/ugly-number/description/
/*
 An ugly number is a positive integer which does not have a prime factor other than 2, 3, and 5.
 Given an integer n, return true if n is an ugly number.

 Example 1:
 Input: n = 6
 Output: true
 Explanation: 6 = 2 × 3
 */

func isUgly(_ n: Int) -> Bool {
    guard n > 0 else { return false }
    var number = n
    while number != 1 {
        if number % 5 == 0 {
            number /= 5
        } else if number % 3 == 0 {
            number /= 3
        } else if number % 2 == 0 {
            number /= 2
        } else {
            return false
        }
    }
    return true
}

isUgly(14)

func isUgly2(_ n: Int) -> Bool {
    guard n > 0 else { return false }
    var number = n
    while number % 5 == 0 { number /= 5}
    while number % 3 == 0 { number /= 3}
    while number % 2 == 0 { number /= 2}
    return number == 1
}
isUgly2(14)
