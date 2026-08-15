import Foundation


func mergeSortedArrays(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    //TODO: Implement your solution here
    
    var (i, j) = (0, 0)
    var result: [Int] = []
    
    while i < arr1.count && j < arr2.count {
        
        let a = arr1[i]
        let b = arr2[j]
        
        if a <= b {
            result.append(a)
            i += 1
        } else {
            result.append(b)
            j += 1
        }
    }
    
    result.append(contentsOf: arr2[j...])
    result.append(contentsOf: arr1[i...])
    
    return result
}

print(mergeSortedArrays([1,3,5], [2,4,6]) )
