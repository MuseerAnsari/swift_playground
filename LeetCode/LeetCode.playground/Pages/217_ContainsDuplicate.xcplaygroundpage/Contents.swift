// https://leetcode.com/problems/contains-duplicate/description/
/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: true
 Explanation:
 The element 1 occurs at the indices 0 and 3.
 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    var map: [Int: Int] = [:]
    for num in nums {
        if map[num] != nil {
            return true
        }
        map[num] = num
    }
    return false
}


func containsDuplicate2(_ nums: [Int]) -> Bool {
    let set = Set(nums)
    return set.count != nums.count
}

func solution(_ nums: [Int]) -> Bool {
    var map = [Int: Int]()
    for num in nums {
        if map[num] != nil { return true }
        map[num] = num
    }
    return false
}

