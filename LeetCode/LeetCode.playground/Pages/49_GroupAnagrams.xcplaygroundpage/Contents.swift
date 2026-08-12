// https://leetcode.com/problems/group-anagrams/description/
/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:
 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {

    var map: [String: [String]] = [:]
    for str in strs {
        let sorted = String(str.sorted())
        map[sorted, default: []].append(str)
    }
    return map.map({$0.value})
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))

func groupAnagrams2(_ strs: [String]) -> [[String]] {

    var map: [[Character: Int]: [String]] = [:]
    for str in strs {
        var freq: [Character: Int] = [:]
        for char in str {
            freq[char, default: 0] += 1
        }
        map[freq, default: []].append(str)
    }
    return map.map({$0.value})
}

print(groupAnagrams2(["eat","tea","tan","ate","nat","bat"]))
