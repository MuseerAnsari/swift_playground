// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums

 Example 1:
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

// https://www.youtube.com/watch?v=06ALbFrgIoQ
func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    guard nums.count > 0 else { return 0 }
    
    var left = 0
    for right in 0..<nums.count {
        if nums[left] != nums[right] {
            left += 1
            nums.swapAt(left, right)
        }
    }
    return left + 1
}
