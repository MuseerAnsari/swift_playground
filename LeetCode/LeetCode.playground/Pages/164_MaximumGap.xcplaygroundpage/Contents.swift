// https://leetcode.com/problems/maximum-gap/
/*
 Given an integer array nums, return the maximum difference between two successive elements in its sorted form. If the array contains less than two elements, return 0.
 You must write an algorithm that runs in linear time and uses linear extra space.

 Example 1:
 Input: nums = [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
 */


func maximumGap(_ nums: [Int]) -> Int {
    
    guard nums.count > 1 else { return 0 }
    let sorted = nums.sorted()
    var maxDifference = Int.min
    
    for i in 1..<nums.count {
        let diff = sorted[i] - sorted[i - 1]
        maxDifference = max(maxDifference, diff)
    }
    
    return maxDifference
}
maximumGap([1,3,6,9])

func solution(_ nums: [Int]) -> Int {
    
    guard nums.count > 1 else { return 0 }
    var sortedNums = nums.sorted()
    var maxDiff = 0
    for i in 1..<sortedNums.count {
        let diff = sortedNums[i] - sortedNums[i - 1]
        maxDiff = max(maxDiff, diff)
    }
    return maxDiff
}

