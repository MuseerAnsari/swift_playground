// https://leetcode.com/problems/contains-duplicate-ii/description/
/*
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
  
 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true
 */


func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    
    var map = [Int: Int]()
    for i in 0..<nums.count {
        let num = nums[i]
        if let mapped = map[num] {
            if abs(mapped - i) <= k { return true }
        }
        map[num] = i
    }
    return false
}
