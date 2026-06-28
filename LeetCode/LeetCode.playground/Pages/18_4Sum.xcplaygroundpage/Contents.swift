// https://leetcode.com/problems/4sum/description/
/*
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

 Example 1:
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    guard nums.count >= 4 else { return []}
    var result: Set<[Int]> = Set<[Int]>()
    let sorted = nums.sorted()
    for i in 0..<sorted.count {
        let a = sorted[i]
        for j in i+1..<sorted.count {
            let b = sorted[j]
            var left = j + 1
            var right = sorted.count - 1
            
            while left < right {
                let sum = a + b + sorted[left] + sorted[right]
                if sum == target {
                    result.insert([a, b, sorted[left], sorted[right]])
                }
                sum < target ? (left += 1) : (right -= 1)
            }
        }
    }
    return Array(result)
}

print(fourSum([0], 0))
