//
/*
 Given an array [5,3,12,3,4,34,4]
 sort it using quick sort algorithm
 */

func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
    if left >= right { return }
    let pivot = partition(&nums, left, right)
    quickSort(&nums, left, pivot - 1)
    quickSort(&nums, pivot + 1, right)
}

func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
   
    let pivot = nums[right]
    var i = left
    var j = left
    
    while j < right {
        if nums[j] < pivot {
            nums.swapAt(i, j)
            i += 1
        }
        j += 1
    }
    nums.swapAt(i, j)
    return i
}

var num = [5,3,12,3,4,34,4]
quickSort(&num, 0, num.count - 1)
print(num)
