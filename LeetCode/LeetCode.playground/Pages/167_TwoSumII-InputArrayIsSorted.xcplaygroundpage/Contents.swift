// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
/*
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
 The tests are generated such that there is exactly one solution. You may not use the same element twice.
 Your solution must use only constant extra space.

 Example 1:
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 */


func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var start = 0
    var end = numbers.count - 1
    while start < end {
        let sum = numbers[start] + numbers[end]
        if sum == target {
            return [start + 1, end + 1]
        } else if sum < target {
            start += 1
        } else {
            end -= 1
        }
    }
    return []
}

twoSum([2,3,3,5], 6)

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    for i in 0..<numbers.count {
        let compliment = target - numbers[i]
        if let index = map.first(where: {$0.value == compliment})?.key {
            return [index + 1, i + 1]
        }
        map[i] = numbers[i]
    }
    return []
}

//twoSum2([2,3,3,4], 6)

func solution(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map = [Int: Int]()
    for i in 0..<nums.count {
        let compliment = target - nums[i]
        if let index = map[compliment] {
            return [(index + 1), (i + 1)]
        }
        map[nums[i]] = i
    }
    return []
}

