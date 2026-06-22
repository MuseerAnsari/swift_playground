// https://leetcode.com/problems/minimum-path-sum/description
/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
 Note: You can only move either down or right at any point in time.
 
 Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
 Output: 7
 Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

 */

func minPathSum(_ grid: [[Int]]) -> Int {
    var result = 0
    
    for row in 0..<grid.count {
        print("row ==\(row)")
        for colum in 0..<grid.count {
            print("colum ==\(grid[row][colum])")
        }
    }
    return result
}

minPathSum([[1,3,1],[1,5,1],[4,2,1]])
