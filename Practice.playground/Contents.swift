import Foundation

func longestSubstring(_ s: String) -> String {
    
    let chars = Array(s)
    var result: [Character] = []
    
    for i in 0..<chars.count {
        if let index = result.firstIndex(of: chars[i]) {
            result.removeSubrange(0...index)
        }
        result.append(chars[i])
    }
    return String(result)
}

print(longestSubstring("abcabcbbefg"))
