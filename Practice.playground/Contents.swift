import Foundation

// cbaebabacd "abc"

func findAnagramInString(_ s: String, t: String) -> [Int] {
    guard s.count > t.count else { return [] }
    
    var anagramMap: [Character: Int] = [:]
    for char in t {
        anagramMap[char, default: 0] += 1
    }
    
    let tCount = t.count
    let sCount = s.count
    var windowMap: [Character: Int] = [:]
    var chars = Array(s)
    var result: [Int] = []
    
    for i in 0..<sCount {
        windowMap[chars[i], default: 0] += 1
        
        if i >= tCount {
            let firstChar = chars[i - tCount]
            windowMap[firstChar]! -= 1
            if windowMap[firstChar] == 0 {
                windowMap[firstChar] = nil
            }
        }
        
        if anagramMap == windowMap {
            result.append(i - (tCount - 1))
        }
        
    }
    return result
}


print(findAnagramInString("cbaebabacd", t: "abc"))






