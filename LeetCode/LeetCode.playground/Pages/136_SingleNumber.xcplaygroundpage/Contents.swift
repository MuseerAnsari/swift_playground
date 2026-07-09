// https://leetcode.com/problems/single-number/description/
/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
 You must implement a solution with a linear runtime complexity and use only constant extra space.

 Example 1:
 Input: nums = [2,2,1]
 Output: 1
 */
func singleNumber(_ nums: [Int]) -> Int {
    var map: [Int: Int] = [:]
    for num in nums {
        map[num, default: 0] += 1
    }
    return map.first(where: {$0.value == 1})?.key ?? 0
}
singleNumber([2,2,1])
