// https://leetcode.com/problems/plus-one/
/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
 Increment the large integer by one and return the resulting array of digits.

 Example 1:
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 */

func plusOne(_ nums: [Int]) -> [Int] {
    
    let number = nums
    var result: [Int] = []
    var carry = 0
    
    for i in (0..<number.count).reversed() {
        let num = number[i]
        if num == 9 {
            result.append(0)
            carry = 1
        } else {
            result.append(num + carry)
            carry = 0
        }
    }
    
    if carry == 1 {
        result.append(1)
    }
    
    return result.reversed()
}

plusOne([1,4,9])


func solution(_ nums: [Int]) -> [Int] {
    var result = nums
    for i in (0..<nums.count).reversed() {
        if nums[i] == 9 {
            result[i] = 0
        } else {
            result[i] += 1
            return result
        }
    }
    result.insert(1, at: 0)
    return result
}
solution([9,2,9])
solution([9,9,9])

