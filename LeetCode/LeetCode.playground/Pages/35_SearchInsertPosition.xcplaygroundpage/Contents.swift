// https://leetcode.com/problems/search-insert-position/
/*
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        
        let mid = left + (right - left) / 2
        
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}

searchInsert([1,3,5,6], 5)

