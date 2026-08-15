// https://leetcode.com/problems/majority-element/description/
/*
 Given an array nums of size n, return the majority element.
 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 Example 1:
 Input: nums = [3,2,3]
 Output: 3
 
 Example 2:
 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
 */


// https://www.youtube.com/watch?v=wD7fs5P_MVo
func majorityElement(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    var majority = nums[0]
    var vote = 1
    
    for i in 1..<nums.count {
        if vote == 0 {
            vote = 1
            majority = nums[i]
        } else if nums[i] == majority {
            vote += 1
        } else {
            vote -= 1
        }
    }
    return majority
}

func majorityElement2(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var nums = nums.sorted()
    return nums[nums.count/2]
}

func majorityElement3(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var freqMap: [Int: Int] = [:]
    for num in nums {
        freqMap[num, default: 0] += 1
    }
    let max = freqMap.max(by: {$0.value > $1.value})?.key ?? 0
    return max
}
