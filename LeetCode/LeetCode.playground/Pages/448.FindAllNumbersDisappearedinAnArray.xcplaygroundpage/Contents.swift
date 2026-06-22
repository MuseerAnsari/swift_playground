//https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/description/?envType=problem-list-v2&envId=hash-table
/*
 Given an array nums of n integers where nums[i] is in the range [1, n],
 return an array of all the integers in the range [1, n] that do not appear in nums.

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 
 Example 2:
 Input: nums = [1,1]
 Output: [2]
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = []
    for i in 1...nums.count {
        if !nums.contains(where: {$0 == i}) {
            result.append(i)
        }
    }
    return result
}

//findDisappearedNumbers([4,3,2,7,8,2,3,1])

func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = []
    var tempNums = nums
    
    for num in tempNums {
        // For each num in nums, we treat  num - 1  as an index.
        tempNums[num - 1] *= tempNums[num - 1] > 0 ? -1 : 1
    }
    
    for i in 1...tempNums.count where tempNums[i - 1] > 0 {
        result.append(i)
    }
    
    return result
}

findDisappearedNumbers2([4,3,2,7,8,2,3,1])
