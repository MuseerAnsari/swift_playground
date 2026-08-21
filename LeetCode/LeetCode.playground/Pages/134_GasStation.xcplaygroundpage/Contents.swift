// https://leetcode.com/problems/gas-station/description/?envType=problem-list-v2&envId=dsqw4pzm
/*
 There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].

 You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations.

 Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique.
 
 
 Example 1:

 Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
 Output: 3
 Explanation:
 Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
 Travel to station 4. Your tank = 4 - 1 + 5 = 8
 Travel to station 0. Your tank = 8 - 2 + 1 = 7
 Travel to station 1. Your tank = 7 - 3 + 2 = 6
 Travel to station 2. Your tank = 6 - 4 + 3 = 5
 Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
 Therefore, return 3 as the starting index.
 */

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    
    // if sum of gas is equal or greater than cost then travel is possible
    let gasSum = gas.reduce(0, +)
    let costSum = cost.reduce(0, +)
    
    guard gasSum >= costSum else { return -1 }
    
    var total = 0
    var index = 0
    
    for i in 0..<gas.count {
        total += gas[i] - cost[i]
        if total < 0 {
            total = 0
            index += 1
        }
    }
    
    return index
}
