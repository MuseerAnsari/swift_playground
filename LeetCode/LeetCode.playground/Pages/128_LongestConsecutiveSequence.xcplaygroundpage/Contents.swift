// https://leetcode.com/problems/longest-consecutive-sequence/description/
/*
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
 You must write an algorithm that runs in O(n) time.

 Example 1:
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    
    let setNum = Set(nums)
    var maxLength = 0
    
    for num in setNum {
        if !setNum.contains(num - 1) {
            var number = num
            var length = 1
            
            while setNum.contains(number + 1) {
                number += 1
                length += 1
            }
            maxLength = max(maxLength, length)
        }
    }
    return maxLength
}

//longestConsecutive([0,3,7,2,5,8,4,6,0,1])

func longestConsecutive2(_ nums: [Int]) -> Int {
    
    guard !nums.isEmpty else { return 0 }
    
    let sorted = nums.sorted()
    var currentMaxLenght = 1
    var prevNumber = sorted.first ?? 0
    var result = 1
    for i in 1..<sorted.count {
        if sorted[i] - 1 == prevNumber {
            currentMaxLenght += 1
            result = max(result, currentMaxLenght)
        } else if sorted[i] != prevNumber {
            currentMaxLenght = 1
        }
        prevNumber = sorted[i]
    }
    return result
}

//longestConsecutive2([1,0,1,2])

func solution(_ nums: [Int]) -> Int {
    
    guard nums.isEmpty else { return 0 }
    let sortedNums = nums.sorted()
    var prevNumber = sortedNums[0]
    var maxLength = 1
    var tempMaxLength = 1
    
    for num in sortedNums.dropFirst() {
        if prevNumber + 1 == num {
            tempMaxLength += 1
        } else if num != prevNumber {
            tempMaxLength = 1
        }
        maxLength = max(maxLength, tempMaxLength)
        prevNumber = num
    }
    return maxLength
}

solution([1,0,1,2])

// https://www.youtube.com/watch?v=LvbtUMdcgbw
func solution2(_ nums: [Int]) -> Int {
    
    var visitedNums: [Int: Bool] = [:]
    var maxLength = 0
    for num in nums {
        visitedNums[num] = false
    }

    for num in nums {
        var currentLength = 1
        // check in forword direction
        var nextNum = num + 1
        while let visited = visitedNums[nextNum], visited == false {
            visitedNums[nextNum] = true
            currentLength += 1
            nextNum += 1
        }
        // check in backword direction
        var preNum = num - 1
        while let visited = visitedNums[preNum], visited == false {
            visitedNums[preNum] = true
            currentLength += 1
            preNum -= 1
        }
        maxLength = max(maxLength, currentLength)
    }
    return maxLength
}



