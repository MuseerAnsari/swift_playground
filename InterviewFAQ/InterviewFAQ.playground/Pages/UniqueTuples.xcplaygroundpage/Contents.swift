
/*
 uniqueTuples("ABC", 2)
 Output: ["AB", "AC", "BC"]
 */

import Foundation

func uniqueTuples(_ s: String, _ length: Int) throws -> Set<String> {
    
    guard !s.isEmpty else { throw NSError(domain: "Invalid String", code: 400)}
    guard s.count > length else { throw NSError(domain: "Invalid lenght", code: 400)}
    
    var chars = Array(s)
    var result = Set<String>()
    
    func generateCombinations(_ start: Int, _ current: String) {
        
        // Base case: if current tuple has the required length
        if current.count == length {
            result.insert(current)
            return
        }
        // Try each character from start position
        for i in start..<chars.count {
            generateCombinations(i + 1, current + String(chars[i]))
        }
    }
    
    generateCombinations(0, "")
    
    return result
}

do {
    let unitTuple = try uniqueTuples("ABC", 2)
    print(unitTuple)
} catch {
    
}
 

