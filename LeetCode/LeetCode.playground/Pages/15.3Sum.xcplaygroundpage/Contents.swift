// https://leetcode.com/problems/3sum/
/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 Notice that the solution set must not contain duplicate triplets.

 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 */

func solution(_ nums: [Int]) -> [[Int]] {
    //[-4,-1,-1,0,1,2]
    let array = nums.sorted()
    var result = Set<[Int]>()
    for i in 0..<array.count {
        let curren = array[i]
        if curren > 0 { continue }
        var left = i + 1
        var right = array.count - 1
        while left < right {
            let sum = curren + array[left] + array[right]
            if sum == 0 {
                result.insert([curren, array[left], array[right]])
                left += 1
                right -= 1
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return Array(result)
}

print(solution([-1,0,1,2,-1,-4]))

func solution2(_ nums: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
    for i in 0..<nums.count {
        for j in (i+1)..<nums.count {
            for k in (j+1)..<nums.count {
                let sum = nums[i] + nums[j] + nums[k]
                if sum == 0 {
                    // Sort the triplet to handle duplicates
                    let triplet = [nums[i], nums[j], nums[k]].sorted()
                    result.insert(triplet)
                }
            }
        }
    }
    return Array(result)
}

print(solution2([-1,0,1,2,-1,-4]))

func solution3(_ nums: [Int]) -> [[Int]]  {
    
    let nums = nums.sorted()
    var result = Set<[Int]>()
    
    for i in 0..<nums.count {
        
        let current = nums[i]
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            let sum = current + nums[left] + nums[right]
            if sum == 0 {
                result.insert([current, nums[left], nums[right]])
                left += 1
                right -= 1
            }
            else if sum < 0 {
                left += 1
            } else {
                right += 1
            }
        }
    }
    
    return Array(result)
}
