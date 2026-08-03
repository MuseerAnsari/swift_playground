import Foundation

/*
    Input: letters = "dogcat", words = ["dog", "cat", "god", "tac", "dogs"]
    Output: ["dog", "cat", "god", "tac"]

 */

func wordsFromLetters(_ l: String, words: [String]) -> [String] {
    
    var lFrequency: [Character: Int] = [:]
    for char in l {
        lFrequency[char, default: 0] += 1
    }
    var maxLenght = 0
    var result: [String] = []
    
    for word in words {
        // Skip words longer than the letters string (can't be formed)
        if word.count > l.count {
            continue
        }
        
        var tempFrequency = lFrequency
        var canBeFarmed = true
        // First, check if the entire word can be formed
        for char in word {
            if let count = tempFrequency[char], count > 0 {
                tempFrequency[char] = count - 1
            } else {
                canBeFarmed = false
                break
            }
        }
        // Only after checking the whole word, update max/result
        if canBeFarmed {
            if word.count > maxLenght {
                maxLenght = word.count
                result = [word]
            } else if word.count == maxLenght {
                result.append(word)
            }
        }
    }
    return result
}

print(wordsFromLetters("dogcat", words: ["dog", "cat", "god", "tac", "dogs"]))
