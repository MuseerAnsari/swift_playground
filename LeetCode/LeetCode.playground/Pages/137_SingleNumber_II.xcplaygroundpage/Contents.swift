// https://leetcode.com/problems/single-number-ii/description/
/*
 Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.
 You must implement a solution with a linear runtime complexity and use only constant extra space.


 Example 1:
 Input: nums = [2,2,3,2]
 Output: 3
 */

//https://www.youtube.com/watch?v=wsbflzYTi2U
func singleNumber(_ nums: [Int]) -> Int {
    
    var ones = 0
    var twos = 0
    
    for num in nums {
        ones = (ones ^ num) & ~twos
        twos = (twos ^ num) & ~ones
    }
    
    return ones
}
