// https://leetcode.com/problems/combination-sum-iii/description/
/*
 Find all valid combinations of k numbers that sum up to n such that the following conditions are true:
 Only numbers 1 through 9 are used.
 Each number is used at most once.
 Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

  

 Example 1:
 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Explanation:
 1 + 2 + 4 = 7
 There are no other valid combinations.
 
 Example 2:
 Input: k = 3, n = 9
 Output: [[1,2,6],[1,3,5],[2,3,4]]
 Explanation:
 1 + 2 + 6 = 9
 1 + 3 + 5 = 9
 2 + 3 + 4 = 9
 There are no other valid combinations.
 */

func combinationSum(_ k: Int, _ n: Int) -> [[Int]] {
    
    var result: [[Int]] = []
    var combination: [Int] = []
    
    func recursion(_ start: Int, total: Int) {
        // If we already picked k numbers and sum is exactly n
        if combination.count == k && total == n {
            result.append(combination)
            return
        }
        // if reached base case or f sum is already too large, stop exploring
        if combination.count == k || total > n {
            return
        }
        // If start goes beyond 9, there is nothing left to try
        if start > 9 { return }
        
        for num in start...9 {
            let sum = total + num
            // If sum exceeds n, no need to continue because numbers are increasing
            if sum > n { break }
            combination.append(num)
            recursion(num + 1, total: sum)
            combination.removeLast()
        }
    }
    recursion(1, total: 0)

    return result
}

print(combinationSum(3, 9))
