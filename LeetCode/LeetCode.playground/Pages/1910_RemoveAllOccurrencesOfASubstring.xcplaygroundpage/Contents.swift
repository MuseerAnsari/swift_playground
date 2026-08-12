// https://leetcode.com/problems/remove-all-occurrences-of-a-substring/description/?envType=problem-list-v2&envId=string
/*
 Given two strings s and part, perform the following operation on s until all occurrences of the substring part are removed:
 Find the leftmost occurrence of the substring part and remove it from s.
 Return s after removing all occurrences of part.
 A substring is a contiguous sequence of characters in a string.

 Example 1:
 Input: s = "daabcbaabcbc", part = "abc"
 Output: "dab"
 Explanation: The following operations are done:
 - s = "daabcbaabcbc", remove "abc" starting at index 2, so s = "dabaabcbc".
 - s = "dabaabcbc", remove "abc" starting at index 4, so s = "dababc".
 - s = "dababc", remove "abc" starting at index 3, so s = "dab".
 Now s has no occurrences of "abc".
 
 */


func removeOccurrences(_ s: String, _ part: String) -> String {
    var stack: [Character] = []
    for char in s {
        stack.append(char)
        if stack.count >= part.count {
            let substring = String(stack.suffix(part.count))
            if substring == part {
                stack.removeLast(part.count)
            }
        }
    }
    return String(stack)
}

print(removeOccurrence2("daabcbaabcbc", "abc"))

func removeOccurrence2(_ s: String, _ part: String) -> String {
    
//    s.reduce(into: "") { partialResult, ch in
//        partialResult.append(ch)
//        if partialResult.hasSuffix(part) {
//            partialResult.removeLast(part.count)
//        }
//    }
    var result = ""
    for ch in s {
        result += String(ch)
        if result.hasSuffix(part) {
            result.removeLast(part.count)
        }
    }
    return result
    
}
