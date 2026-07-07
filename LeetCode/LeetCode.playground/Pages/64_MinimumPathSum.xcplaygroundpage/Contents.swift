// https://leetcode.com/problems/minimum-path-sum/description
/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
 Note: You can only move either down or right at any point in time.
 
 Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
 [[1,3,1],
  [1,5,1],
  [4,2,1]]
 Output: 7
 Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

 */

func minPathSum(_ grid: [[Int]]) -> Int {
    // Get the number of rows in the grid.
    let n = grid.count
    // Get the number of columns in the grid.
    let m = grid[0].count
    // Create a DP table with the same size as grid, initialized with 0.
    // dp[i][j] will store the minimum path sum needed to reach cell (i, j).
    var dp = Array(repeatElement(Array(repeating: 0, count: m),count: n))
    dp[0][0] = grid[0][0]
    // Fill the first row.
    // In the first row, we can only move right, so each cell depends on the cell to its left.
    for i in 1..<m {
        dp[0][i] = dp[0][i - 1] + grid[0][i]
    }
    // Fill the first column.
    // In the first column, we can only move down, so each cell depends on the cell above it.
    for j in 1..<n {
        dp[j][0] = dp[j - 1][0] + grid[j][0]
    }
    
    if n > 1 && m > 1 {
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    return dp[n - 1][m - 1]
}

minPathSum([[1,2,3],[4,5,6]])
