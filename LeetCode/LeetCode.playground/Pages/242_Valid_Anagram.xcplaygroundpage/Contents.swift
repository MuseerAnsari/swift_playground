// https://leetcode.com/problems/valid-anagram/description/?envType=problem-list-v2&envId=string
/*
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true

 Example 2:
 Input: s = "rat", t = "car"
 Output: false
 */
import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    return Array(s).sorted() == Array(t).sorted()
}

func isAnagram2(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var mapS: [Character: Int] = [:]
    for char in s {
        mapS[char, default: 0] += 1
    }
    
    var mapT: [Character: Int] = [:]
    for char in t {
        mapT[char, default: 0] += 1
    }
    
    for dic in mapS {
        let value = dic.value
        if value != mapT[dic.key] { return false }
    }
    
    return true
}

func isAnagram3(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var mapS: [Character: Int] = [:]
    for char in s {
        mapS[char, default: 0] += 1
    }
    
    for char in t {
        if let count = mapS[char] {
            if count > 1 {
                mapS[char]! -= 1
            } else {
                mapS[char] = nil
            }
        }
    }
    return mapS.isEmpty
}


