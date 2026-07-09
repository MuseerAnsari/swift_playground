// https://leetcode.com/problems/find-peak-element/description/
/*
 A peak element is an element that is strictly greater than its neighbors.
 Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.
 You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.
 You must write an algorithm that runs in O(log n) time.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 */


func findPeakElement(_ nums: [Int]) -> Int {
    
    var peak: Int = Int.min
    var index = 0
    for i in 0..<nums.count {
        if nums[i] > peak {
            peak = nums[i]
            index = i
            continue
        } else {
            return index
        }
    }
    return index
}

findPeakElement([1,2,3,1])

func findPeakElement2(_ nums: [Int]) -> Int {
    
    var start = 0
    var end = nums.count - 1
    while start < end {
        let mid = start + (end - start) / 2
        if nums[mid] < nums[mid+1] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return start
}

findPeakElement2([1,2,3,1])
