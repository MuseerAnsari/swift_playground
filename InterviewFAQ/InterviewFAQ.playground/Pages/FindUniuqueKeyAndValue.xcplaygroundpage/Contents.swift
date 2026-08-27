// Grab Intereview
/*
 find unique keys and values
 iahefu1:45oseg38jhsgo4:35kljsdg1:78ksdgieval
 ["1": [45, 78], "4": [35]]
 */

func solution(_ s: String) -> [String: [Int]] {
    
    let chars = Array(s)
    var map: [String : [Int]] = [:]
    for i in 0..<chars.count {
        let char = chars[i]
        if char == ":" {
            let (key, value) = getKeyAndValue(i)
            map[key, default: []].append(value)
        }
    }
    
    func getKeyAndValue(_ index: Int) -> (String, Int) {
        var left = index - 1
        var right = index + 1
        var key = ""
        var value = ""
        
        while chars[left].isNumber || chars[left] == "-" {
            key = String(chars[left]) + key
            left -= 1
        }
        while chars[right].isNumber || chars[right] == "-" {
            value += String(chars[right])
            right += 1
        }
        
        let intValue = Int(value) ?? 0
        return (key, intValue)
    }
    
    return map
}

//print(solution("iahefu14:45oseg38jhsgo-4:35kljsdg14:78ksdgieval"))

func solution2(_ s: String) -> [String: [Int]] {
    
    var key = ""
    var value = ""
    var isKeyAppear = false
    var map: [String: [Int]] = [:]
    
    for char in s {
        if char == ":" {
            isKeyAppear = true
        }
        else if !char.isNumber && char != "-" {
            if !key.isEmpty && !value.isEmpty {
                let intValue = Int(value) ?? 0
                map[key, default: []].append(intValue)
                key = ""
                value = ""
                isKeyAppear = false
            } else {
                key = ""
            }
        } else if (char.isNumber || char == "-" ) && !isKeyAppear {
            key += String(char)
        } else {
            value += String(char)
        }
    }
    
    return map
}

print(solution2("iahefu14:45oseg38jhsgo-4:35kljsdg14:78ksdgieval"))
