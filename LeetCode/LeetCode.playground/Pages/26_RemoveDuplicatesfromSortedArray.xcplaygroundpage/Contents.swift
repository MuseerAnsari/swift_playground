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

func removeDuplicateFromArray(_ nums: [Int]) -> ([Int], Int) {
    
    guard let first = nums.first else { return ([], 0) }
    guard nums.count > 1 else { return ([first], 1) }
    
    var result: [Int] = [Int](repeating: 0, count: nums.count)
    var count = 0
    
    for num in nums {
        if !result.contains(num) {
            result[count] = num
            count += 1
        }
    }
    return (result, count)
}

removeDuplicateFromArray([0,0,1,1,1,2,2,3,3,4])


func solution2(_ nums: [Int]) -> ([Int], Int) {
    
    guard let first = nums.first else { return ([], 0) }
    guard nums.count > 1 else { return ([first], 1) }
    
    var currenNumber = 0
    var result: [Int] = [Int](repeating: 1, count: nums.count)
    var count = 0
    
    for num in nums {
        if currenNumber != num {
            currenNumber = num
            result[count] = num
            count += 1
        }
    }
    return (result, count)
}

solution2([0,0,1,1,1,2,2,3,3,4])

func solution3(_ nums: inout [Int]) -> ([Int], Int) {
    
    guard let first = nums.first else { return ([], 0) }
    guard nums.count > 1 else { return ([first], 1) }
    
    var currenNumber = 0
    var count = 0
    
    for num in nums {
        if currenNumber != num {
            currenNumber = num
            nums[count] = num
            count += 1
        }
    }
    return (nums, count)
}

var nums = [0,0,1,1,1,2,2,3,3,4]
solution3(&nums)
