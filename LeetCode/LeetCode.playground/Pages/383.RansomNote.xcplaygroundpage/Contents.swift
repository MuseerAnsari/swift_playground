// https://leetcode.com/problems/ransom-note/description/?envType=problem-list-v2&envId=hash-table
/*
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
 Each letter in magazine can only be used once in ransomNote.
 
 Example 3:
 Input: ransomNote = "aa", magazine = "aab"
 Output: true
 */


func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    guard
        magazine.count > 0,
        magazine.count >= ransomNote.count
    else { return false }
    
    var notes = Array(ransomNote)
    for char in magazine {
        if let index = notes.firstIndex(of: char) {
            notes.remove(at: index)
        }
    }
    return notes.isEmpty
}

canConstruct("aa", "aab")

func canConstruct2(_ ransomNote: String, _ magazine: String) -> Bool {
    
    guard
        magazine.count > 0,
        magazine.count >= ransomNote.count
    else { return false }
        
    var map: [Character: Int] = [:]
    
    for note in ransomNote {
        map[note, default: 0] += 1
    }
    
    for char in magazine {
        if let count = map[char],
           count > 0 {
            map[char]! -= 1
        }
    }
    return map.allSatisfy({$0.value == 0})
}


func canConstruct3(_ ransomNote: String, _ magazine: String) -> Bool {
    
    guard
        magazine.count > 0,
        magazine.count >= ransomNote.count
    else { return false }
        
    var map: [Character: Int] = [:]
    
    for magChar in magazine {
        map[magChar, default: 0] += 1
    }
    
    for char in ransomNote {
        if let count = map[char],
           count > 0 {
            map[char]! -= 1
        } else {
            return false
        }
    }
    return true
}
