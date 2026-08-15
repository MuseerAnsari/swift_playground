// https://leetcode.com/problems/compare-version-numbers/description/
/*
 Given two version strings, version1 and version2, compare them. A version string consists of revisions separated by dots '.'. The value of the revision is its integer conversion ignoring leading zeros.

 To compare version strings, compare their revision values in left-to-right order. If one of the version strings has fewer revisions, treat the missing revision values as 0.

 Return the following:

 If version1 < version2, return -1.
 If version1 > version2, return 1.
 Otherwise, return 0.
 
 Example 1:
 Input: version1 = "1.2", version2 = "1.10"
 Output: -1
 Explanation:
 version1's second revision is "2" and version2's second revision is "10": 2 < 10, so version1 < version2.

 Example 2:
 Input: version1 = "1.01", version2 = "1.001"
 Output: 0
 Explanation:
 Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

 Example 3:
 Input: version1 = "1.0", version2 = "1.0.0.0"
 Output: 0
 Explanation:
 version1 has less revisions, which means every missing revision are treated as "0".
 */

import Foundation

// https://www.youtube.com/watch?v=RzHzIJYEiys
func compareVersion(_ version1: String, _ version2: String) -> Int {
    
    let version1Components = version1.components(separatedBy: ".").compactMap({Int($0)})
    let version2Components = version2.components(separatedBy: ".").compactMap({Int($0)})
    let mCount = version1Components.count
    let nCount = version2Components.count
        
    var (i, j) = (0, 0)
    
    while i < mCount || j < nCount {
        let revision1 = i < mCount ? version1Components[i] : 0 // pass 0 if index exeeds
        let revision2 = j < nCount ? version2Components[i] : 0 // pass 0 if index exeeds
        if revision1 != revision2 { return revision1 < revision2 ? -1 : 1 }
        i += 1
        j += 1
    }
    // if revision is equal
    return 0
}

print(compareVersion("1.0", "1.0.0.0"))
