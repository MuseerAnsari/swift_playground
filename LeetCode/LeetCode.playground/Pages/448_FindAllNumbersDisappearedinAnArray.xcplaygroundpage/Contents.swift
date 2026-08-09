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


func findMissingNum(_ nums: [Int]) -> [Int] {

  let nums = nums.sorted()
  var result: [Int] = []

  for i in 1..<nums.count {
    var diff = nums[i] - nums[i - 1]
    let current = nums[i]

    while diff > 1 {
      result.append(current - diff + 1)
      diff -= 1
    }
  }
    
  return result
}
