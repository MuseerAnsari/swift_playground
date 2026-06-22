//https://leetcode.com/problems/distribute-candies/?envType=problem-list-v2&envId=hash-table
/*
 Alice has n candies, where the ith candy is of type candyType[i]. Alice noticed that she started to gain weight, so she visited a doctor.
 The doctor advised Alice to only eat n / 2 of the candies she has (n is always even). Alice likes her candies very much, and she wants to eat the maximum number of different types of candies while still following the doctor's advice.
 Given the integer array candyType of length n, return the maximum number of different types of candies she can eat if she only eats n / 2 of them.

 Example 1:
 Input: candyType = [1,1,2,2,3,3]
 Output: 3
 Explanation: Alice can only eat 6 / 2 = 3 candies. Since there are only 3 types, she can eat one of each type.
 */


func distributeCandies(_ candyType: [Int]) -> Int {
    
    var result = 0
    var mapCandy: [Int: Int] = [:]
    var maxCandy = candyType.count / 2
    
    for candy in candyType where maxCandy > 0  {
        if mapCandy[candy] == nil {
            maxCandy -= 1
            result += 1
        }
        mapCandy[candy, default: 0] += 1
    }
    return result
       
}

// distributeCandies([1,1,2,3])

func distributeCandies2(_ candyType: [Int]) -> Int {
    let uniqueCandy = Set(candyType)
    let maxCandyCanEat = candyType.count / 2
    return min(uniqueCandy.count, maxCandyCanEat)
}

distributeCandies2([1,1,2,3])
