import Foundation


func longestRepetingCharRepleacement(_ s: String, _ k: Int) -> Int {
    
    var left = 0
    var window: [Character: Int] = [:]
    var maxFreq = 0
    var maxWindowSize = 0
    let chars = Array(s)
    
    for (right, char) in chars.enumerated() {
        window[char, default: 0] += 1
        maxFreq = max(maxFreq, window[char]!)
        
        let windowSize = right - left + 1
        let replacementRequired = windowSize - maxFreq
        
        if replacementRequired > k {
            window[chars[left], default: 0] -= 1
            left += 1
        }
        
        maxWindowSize = max(maxWindowSize, (right - left + 1))
    }

    return maxWindowSize
}

print(longestRepetingCharRepleacement("BABBA", 1))
