// https://leetcode.com/problems/coin-change/description/
/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 You may assume that you have an infinite number of each kind of coin.


 Example 1:
 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 
 Example 2:
 Input: coins = [2], amount = 3
 Output: -1
 */

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    guard amount > 0 else { return 0 }
    // amount + 1 acts as an unreachable/infinity value
    let unreachable = amount + 1
    var minCoinsDP = [Int](repeating: unreachable, count: amount + 1)
    minCoinsDP[0] = 0
    
    for currentAmount in 1...amount {
        for coin in coins where coin <= currentAmount {
            minCoinsDP[currentAmount] = min(
                minCoinsDP[currentAmount],
                minCoinsDP[currentAmount - coin] + 1
            )
        }
    }
    return minCoinsDP[amount] == unreachable ? -1 : minCoinsDP[amount]
}
print(coinChange([1], 0))

func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
    
    guard amount > 0 else { return 0 }
    // amount + 1 acts as an unreachable/infinity value
    let unreachable = amount + 1
    var minCoinsDP = [Int](repeating: unreachable, count: amount + 1)
    minCoinsDP[0] = 0
    
    for coin in coins where coin <= amount {
        for currentAmount in coin...amount {
            minCoinsDP[currentAmount] = min(
                minCoinsDP[currentAmount],
                minCoinsDP[currentAmount - coin] + 1
            )
        }
    }
    
    return minCoinsDP[amount] == unreachable ? -1 : minCoinsDP[amount]
}
