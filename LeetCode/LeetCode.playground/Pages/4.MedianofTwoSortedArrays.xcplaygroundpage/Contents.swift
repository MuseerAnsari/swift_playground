/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays without using inbuild sorted function.
 The overall run time complexity should be O(log (m+n)).
  
 Example 1:
 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 */

func medianOfSortedArray(_ a1: [Int], _ a2: [Int]) -> Double {
    
    var (i, j) = (0, 0)
    var mergedArray: [Int] = []
    // this will iterate until atleast one array elements arranged in sorted order
    while i < a1.count, j < a2.count {
        mergedArray.append(min(a1[i], a2[j]))
        let increment_i = a1[i] < a2[j] ? 1 : 0
        increment_i > 0 ? (i += 1) : (j += 1)
    }
    mergedArray.append(contentsOf: a2[j...])
    mergedArray.append(contentsOf: a1[i...])

    let count = mergedArray.count
    let result = Double(mergedArray[(count - 1) / 2] + mergedArray[count / 2]) * 0.5
    
    return result
}

medianOfSortedArray([4,5,6,14],[2,12,13])

func medianOfSortedArraySolution2(_ a1: [Int], _ a2: [Int]) -> Double {
    let mergedArray = a1 + a2
    let sortedArray = mergedArray.sorted()
    let count = sortedArray.count
    let result = Double(sortedArray[(count - 1) / 2] + sortedArray[count / 2]) * 0.5
    return result
}

medianOfSortedArraySolution2([4,5,6,14],[2,12,13])

func medianOfSortedArraySolution3(_ a1: [Int], _ a2: [Int]) -> Double {
    
    var (i, j) = (0, 0)
    var array:[Int] = []
    
    while i < a1.count && j < a2.count {
        if a1[i] < a2[j] {
            array.append(a1[i])
            i += 1
        } else {
            array.append(a2[j])
            j += 1
        }
    }
    array.append(contentsOf: a1[i...])
    array.append(contentsOf: a2[j...])

    let arrayCount = array.count
    let median = array[(arrayCount - 1) / 2] + array[arrayCount / 2]
    return Double(median) * 0.5
}

medianOfSortedArraySolution3([4,5,6,14],[2,12,13])
