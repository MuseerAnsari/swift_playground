//https://leetcode.com/problems/minimum-index-sum-of-two-lists/description/?envType=problem-list-v2&envId=hash-table
/*
 Given two arrays of strings list1 and list2, find the common strings with the least index sum.
 A common string is a string that appeared in both list1 and list2.
 A common string with the least index sum is a common string such that if it appeared at list1[i] and list2[j]
 then i + j should be the minimum value among all the other common strings.
 Return all the common strings with the least index sum. Return the answer in any order.
 
 Example 3:
 Input: list1 = ["happy","sad","good"], list2 = ["sad","happy","good"]
 Output: ["sad","happy"]
 Explanation: There are three common strings:
 "happy" with index sum = (0 + 1) = 1.
 "sad" with index sum = (1 + 0) = 1.
 "good" with index sum = (2 + 2) = 4.
 The strings with the least index sum are "sad" and "happy".
 */

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        
    var map: [String: Int] = [:]
    for (index1, word1) in list1.enumerated() {
        for (index2, word2) in list2.enumerated() where word1 == word2 {
            let indexSum = index1 + index2
            map[word1] = indexSum
        }
    }
    
    let min = map.values.min()
    let result = map.filter({$0.value == min}).map({$0.key})
    
    return result
}

//findRestaurant(["happy","sad","good"], ["sad","happy","good"])

func findRestaurant2(_ list1: [String], _ list2: [String]) -> [String] {
        
    
    let uniques = Set(list1).intersection(Set(list2))
    var minSum = Int.max
    var result: [String] = []
    for uniuque in uniques {
        let index1 = list1.firstIndex(of: uniuque)!
        let index2 = list2.firstIndex(of: uniuque)!
        let indexSum = index1 + index2
        if indexSum < minSum {
            minSum = indexSum
            result = [uniuque]
        } else if indexSum == minSum {
            result.append(uniuque)
        }
    }
    return result
}
//findRestaurant2(["happy","sad","good"], ["sad","happy","good"])

func findRestaurant3(_ list1: [String], _ list2: [String]) -> [String] {
        
    var dic1: [String: Int] = [:]
    for (index, word) in list1.enumerated() {
        dic1[word] = index
    }
    var minSum = Int.max
    var result: [String] = []
    for (index2, word) in list2.enumerated() {
        guard let index1 = dic1[word] else { continue }
        let sum = index1 + index2
        if sum < minSum {
            minSum = sum
            result = [word]
        } else if sum == minSum {
            result.append(word)
        }
    }
    return result
}
findRestaurant3(["happy","sad","good"], ["sad","happy","good"])
