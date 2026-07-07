// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
/*
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

// [5,7,7,8,8,10], target = 8
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result = [-1, -1]
    guard !nums.isEmpty else { return result }
    
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        nums[mid] < target ? (left = mid + 1) : (right = mid)
    }
    
    guard nums[left] == target else { return result }
    result[0] = left
    
    right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2 + 1
        nums[mid] > target ? (right = mid - 1) : (left = mid)
    }
    result[1] = left
    
    return result
}

searchRange([5,7,7,8,8,9,10], 8)

func solution(_ nums: [Int], _ target: Int) -> [Int] {

    func findFirst() -> Int {
        var left = 0
        var right = nums.count - 1
        var ans = -1
        while left < right {
            let mid = left + (right - left) / 2
            let current = nums[mid]
            if current == target {
                ans = mid
                right = mid - 1
            } else if current < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
    
    func findLast() -> Int {
        var left = 0
        var right = nums.count - 1
        var ans = -1
        
        while left < right {
            let mid = left + (right - left) / 2
            let current = nums[mid]
            if current == target {
                ans = mid
                left = mid + 1
            } else if current < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }

    if findFirst() == -1 { return [-1, -1]}
    
    return [findFirst(), findLast()]
}

solution([5,7,7,8,8,9,10,10], 10)
