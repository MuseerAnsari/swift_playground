// https://leetcode.com/problems/summary-ranges/
/*
 You are given a sorted unique integer array nums.
 A range [a,b] is the set of all integers from a to b (inclusive).
 Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.
 Each range [a,b] in the list should be output as:
 "a->b" if a != b
 "a" if a == b
  

 Input: nums = [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: The ranges are:
 [0,0] --> "0"
 [2,4] --> "2->4"
 [6,6] --> "6"
 [8,9] --> "8->9"
 */

func summaryRanges(_ nums: [Int]) -> [String] {
    guard !nums.isEmpty else { return [] }
    
    var result: [String] = []
    var right = 0
    var left = 0
    for i in 1..<nums.count {
        if nums[i] - nums[i - 1] == 1 {
            right += 1
        } else {
            appendString(a: left, b: right)
            left = right + 1
            right = left
        }
    }
    func appendString(a: Int, b: Int) {
        if left == right {
            result.append("\(nums[left])")
        } else {
            result.append("\(nums[left])->\(nums[right])")
        }
    }
    appendString(a: left, b: right)
    return result
}

summaryRanges([0,2,3,4,6,8,9])


func summaryRanges2(_ nums: [Int]) -> [String] {
    
    var result: [String] = []
    var left = 0
    
    while left < nums.count {
        var right = left
        while right + 1 < nums.count &&
                nums[right + 1] - nums[right] == 1 {
            right += 1
        }
        if left == right {
            result.append("\(nums[right])")
        } else {
            result.append("\(nums[left])->\(nums[right])")
        }
        left = right + 1
    }

    return result
}
summaryRanges2([0,2,3,4,6,8,9])
