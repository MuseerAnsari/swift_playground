import UIKit
//
/*
 You have two strings of lowercase English letters. You can perform two types of operations on the first string:
 Append a lowercase English letter to the end of the string.
 Delete the last character of the string. Performing this operation on an empty string results in an empty string.

 string s: the initial string
 string t: the desired string
 int k: the exact number of operations that must be performed
 
 Example:
 hackerhappy
 hackerrank
 7
 OP: true
 
 Example:
 ashley
 ash
 2
 OP: false
 
 */

func appendAndDelete(s: String, t: String, k: Int) -> String {
    
    let sChars = Array(s)
    let tChars = Array(t)
    
    var commonPrefix = 0
    
    while commonPrefix < sChars.count, commonPrefix < tChars.count && sChars[commonPrefix] == tChars[commonPrefix] {
        commonPrefix += 1
    }
    
    let movesNeeded = (sChars.count - commonPrefix) + (tChars.count - commonPrefix)
    
    if movesNeeded > k {
        return "No"
    }
    
    // After you do the minimum required work to make  s  become  t , you may still have some moves left
    // That uses 2 moves and gets you back to the same kind of progress. So extra moves are only useful in even numbers
    if (k - movesNeeded) % 2 == 0 || k >= sChars.count + tChars.count {
        return "Yes"
    }

    return "No"
}
