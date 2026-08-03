// https://leetcode.com/problems/majority-element-ii/description/
/*
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 
 Example 1:
 Input: nums = [3,2,3]
 Output: [3]
 
 Example 2:
 Input: nums = [1]
 Output: [1]
 
 Example 3:
 Input: nums = [1,2]
 Output: [1,2]
 */

func majorityElement(_ nums: [Int]) -> [Int] {
    
    var map:[Int: Int] = [:]
    var result: [Int] = []
    var lenght = nums.count
    for num in nums {
        map[num, default: 0] += 1
    }
    
    for (num, count) in map {
        if count > lenght / 3 {
            result.append(num)
        }
    }
    
    return result
}
majorityElement([3,2,3])


func majorityElement2(_ nums: [Int]) -> [Int] {
    
    var map:[Int: Int] = [:]
    var result: Set<Int> = []
    var lenght = nums.count
    for num in nums {
        map[num, default: 0] += 1
        if map[num]! > lenght / 3 {
            result.insert(num)
        }
    }
    return Array(result)
}
majorityElement2([3,2,3])
