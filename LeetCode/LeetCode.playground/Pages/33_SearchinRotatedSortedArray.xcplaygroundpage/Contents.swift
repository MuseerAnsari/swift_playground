// https://leetcode.com/problems/search-in-rotated-sorted-array/description/
/*
 There is an integer array nums sorted in ascending order (with distinct values).
 Prior to being passed to your function, nums is possibly left rotated at an unknown index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be left rotated by 3 indices and become [4,5,6,7,0,1,2].
 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        if nums[mid] == target {
            return mid
        }
        // binary search in partially sorted array
        if nums[start] <= nums[mid] {
            if target >= nums[start] && target < nums[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else {
            if target <= nums[end] && target > nums[mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
    }
    return nums[start] == target ? start : -1
}

search([5,1,3], 3)
