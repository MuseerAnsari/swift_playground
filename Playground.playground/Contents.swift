import UIKit

// Given stock prices, find the maximum profit you can make with at most two transactions.
// [12,14,20,12,50,20]


func solution(_ nums: [Int]) -> Int {
    
    var profit = 0
    
    for i in 0..<nums.count {
        let current = nums[i]
        for j in (i + 1)..<nums.count {
            let currenProfit = nums[j] - current
            profit = max(profit, currenProfit)
        }
    }
    
    return profit
}

print(solution([12,14,20,12,50,20]))


