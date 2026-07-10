// https://leetcode.com/problems/largest-number/description/?envType=problem-list-v2&envId=string
/*
 Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.

 Since the result may be very large, so you need to return a string instead of an integer.

  

 Example 1:

 Input: nums = [10,2]
 Output: "210"
 Example 2:

 Input: nums = [3,30,34,5,9]
 Output: "9534330"
 */

func largestNumber(_ nums: [Int]) -> String {
    let strings = nums.map({"\($0)"})
    // Sort strings using a custom rule:
    // If a + b is larger than b + a, then a should come before b.
    let sorted = strings.sorted { a, b in
        return a + b > b + a
    }
    // If the first number is "0", then all numbers are zero.
    // In that case, the answer should be just "0".
    // [0,0]
    if sorted.first == "0" {
        return "0"
    }
    return sorted.joined()
}
