// https://leetcode.com/problems/divide-two-integers/description/
/*
 Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.
 The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.
 Return the quotient after dividing dividend by divisor.
 Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231, 231 − 1]. For this problem, if the quotient is strictly greater than 231 - 1, then return 231 - 1, and if the quotient is strictly less than -231, then return -231.

 Example 1:
 Input: dividend = 10, divisor = 3
 Output: 3
 Explanation: 10/3 = 3.33333.. which is truncated to 3.
 
 Example 2:
 Input: dividend = 7, divisor = -3
 Output: -2
 Explanation: 7/-3 = -2.33333.. which is truncated to -2.
 */


func divide(_ dividend: Int, _ divisor: Int) -> Int {
    
    let is_negitive = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
    let dividend = abs(dividend)
    let divisor = abs(divisor)

    var number = dividend
    var ans = 0
    
    while number >= divisor {
        var count = 0
        // number >= divisor * 2 d power 0.1.2...
        while number >= (divisor << (count + 1)) {
            count += 1
        }
        // ans + 2 d power count
        ans += 1 << count
        // number - 2 d power count
        number = number - (divisor << count)
    }
    return is_negitive ? -ans : ans
}

print(divide(-10, 3))

// Not a proper solution but an idea
func divide2(_ dividend: Int, _ divisor: Int) -> Int {
    
    let is_negitive = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
    
    let dividend = abs(dividend)
    let divisor = abs(divisor)

    var num = 0
    var coun = -1
    while dividend >= num {
        num += divisor
        coun += 1
    }
    return is_negitive ? -coun : coun
}

//print(divide2(10, -1))
