// https://leetcode.com/problems/subsets/description/
/*
 Given an integer array nums of unique elements, return all possible subsets (the power set).
 The solution set must not contain duplicate subsets. Return the solution in any order.

 Example 1:
 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 
 Example 2:
 Input: nums = [0]
 Output: [[],[0]]
 */

// https://www.youtube.com/watch?v=3tpjp5h3M6Y
func subsets(_ nums: [Int]) -> [[Int]] {
    
    var result: [[Int]] = []
   
    func recursion(_ start: Int, _ subset: inout [Int]) {
        result.append(subset)
        for i in start..<nums.count {
            // case of incliding num
            subset.append(nums[i])
            // Backtrace the new subset
            recursion(i + 1, &subset)
            // case of not including numebr
            subset.removeLast()
        }
    }
    
    var subset: [Int] = []
    recursion(0, &subset)
    
    return result
}

print(subsets([1,2,3]))
