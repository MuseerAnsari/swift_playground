// https://leetcode.com/problems/3sum-closest/
/*
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
 Return the sum of the three integers.
 You may assume that each input would have exactly one solution.

 Example 1:
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */


func solution(_ nums: [Int], target: Int) -> Int {
    
    // [-4,-1,1,2]
    let sorted = nums.sorted()
    var result = 0
    var diff = Int.max
    
    for i in 0..<sorted.count {
        let value = sorted[i] // -4
        var left = i + 1
        var right = sorted.count - 1
        
        while left < right {
    
            let leftValue = sorted[left] // -1
            let rightValue = sorted[right] // 2
            
            let sum = value + leftValue + rightValue // - 3
            if sum == target { return sum }
            sum < target ? (left += 1) : (right -= 1)
            
            let tempDiff = abs(sum - target) // 4
            if tempDiff < diff {
                diff = tempDiff
                result = sum
            }
        }
    }
   return result
}
solution([-1,2,1,-4], target: 1)
