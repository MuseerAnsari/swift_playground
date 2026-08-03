// 010001010101 output: 1


func minFlipsToMakeAlternating(_ s: String) -> Int {
    
    let chars = Array(s)
    var diff0 = 0
    var diff1 = 0
    
//    func isExpected(_ i: Int, startWithZero zero: Bool) -> Character {
//        var expected: Character = " "
//        if zero {
//            expected = (i % 2) == 0 ? "0" : "1"
//        } else {
//            expected = (i % 2) == 0 ? "1" : "0"
//        }
//        return expected
//    }
    
    // Work over doubled string logically via index % n
    func isExpected(_ i: Int, startWithZero zero: Bool) -> Character {
        let bit = (i % 2 == 0) ? (zero ? 0 : 1) : (zero ? 1 : 0)
        return bit == 0 ? "0" : "1"
    }
    
    for i in 0..<chars.count {
        if chars[i] != isExpected(i, startWithZero: true) {
            diff0 += 1
        }
        if chars[i] != isExpected(i, startWithZero: false) {
            diff1 += 1
        }
    }
    var ans = min(diff0, diff1)
    let n = chars.count
    // Slide window: remove i-1, add i+n-1 for i = 1..n-1
    
    for i in 1..<n {
        let outIndex = i - 1
        let inIndex = i + n - 1
        
        let outChar = chars[outIndex]
        let inChar = chars[inIndex % n]
        
        // Update diff0 (pattern starting with '0')
        if outChar != isExpected(outIndex, startWithZero: true) { diff0 -= 1 }
        if inChar != isExpected(inIndex, startWithZero: true) { diff0 += 1 }
        
        // Update diff1 (pattern starting with '1')
        if outChar != isExpected(outIndex, startWithZero: false) { diff1 -= 1 }
        if inChar != isExpected(inIndex, startWithZero: false) { diff1 += 1 }
        
        ans = min(ans, diff0, diff1)
    }

    return ans
}

print(minFlipsToMakeAlternating("010001010101"))


