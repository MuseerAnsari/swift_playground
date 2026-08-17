// https://leetcode.com/problems/coin-change-ii/description/
/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
 Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.
 You may assume that you have an infinite number of each kind of coin.
 The final answer is guaranteed to fit into a signed 32-bit integer.
 
 Example 1:
 Input: amount = 5, coins = [1,2,5]
 Output: 4
 Explanation: there are four ways to make up the amount:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 
 Example 2:
 Input: amount = 3, coins = [2]
 Output: 0
 Explanation: the amount of 3 cannot be made up just with coins of 2.
 
 Example 3:
 Input: amount = 10, coins = [10]
 Output: 1
 */

// https://www.youtube.com/watch?v=khIBdTrRggk&t=10s
func change(_ amount: Int, _ coins: [Int]) -> Int {
    
    // Number of combinations that form currentAmount
    var maxCombinationDP = [Int](repeating: 0, count: amount + 1)
    // One way to make amount 0: choose no coins
    maxCombinationDP[0] = 1
    
    for coin in coins where coin <= amount {
        for currentAmount in 0...amount where currentAmount >= coin {
            // maxCombinationDP[currentAmount] = number of combinations
            maxCombinationDP[currentAmount] = maxCombinationDP[currentAmount] + maxCombinationDP[currentAmount - coin]
        }
    }
    return maxCombinationDP[amount]
}

print(change(5, [1,2,5]))
