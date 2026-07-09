// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

 Example 1:
 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 */


func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else { return 0 }
    if prices.isEmpty { return 0 }
    
    var minPrice = prices[0]
    var maxProfit = 0
    
    for price in prices.dropFirst() {
        //minPrice = min(minPrice, price) OR
        if price < minPrice {
            minPrice = price
        }
        let currenProfit = price - minPrice
        // maxProfit = max(maxProfit, currenProfit) OR
        if currenProfit > maxProfit {
            maxProfit = currenProfit
        }
    }
    return maxProfit
}

maxProfit([7,1,5,3,16,4])


func getMaximumProfit(_ price: [Int]) -> Int {
    var profit = 0
    for i in 0..<price.count {
        for j in (i+1)..<price.count {
            profit = max(profit, (price[j] - price[i]))
        }
    }
    return profit
}

getMaximumProfit([10,9,8,7,6,5])

func solution(_ prices:[Int]) -> Int {
    
    var maxProfit = 0
    var minPrice = prices[0]
    
    for i in 1..<prices.count {
        minPrice = min(minPrice, prices[i])
        let currentProfit = prices[i] - minPrice
        maxProfit = max(maxProfit, currentProfit)
    }
    return maxProfit
}




