// https://leetcode.com/problems/single-number-iii/description/
/*
 Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.
 You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

 Example 1:
 Input: nums = [1,2,1,3,2,5]
 Output: [3,5]
 Explanation:  [5, 3] is also a valid answer.
 */


func singleNumber(_ nums: [Int]) -> [Int] {
    var map: [Int: Int] = [:]
    for num in nums {
        map[num, default: 0] += 1
    }
    return map.filter({$0.value == 1}).map({$0.value})
}
