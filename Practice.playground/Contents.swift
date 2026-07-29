import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    
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
    
    
//    var mapT: [Character: Int] = [:]
//    for char in t {
//        mapT[char, default: 0] += 1
//    }
//    
//    for dic in mapS {
//        let value = dic.value
//        if value != mapT[dic.key] { return false }
//    }

    return mapS.isEmpty
    
}
