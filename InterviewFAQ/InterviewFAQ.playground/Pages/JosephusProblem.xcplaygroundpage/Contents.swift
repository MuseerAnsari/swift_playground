/*
 
Josephus Problem
There are N people standing in a circle waiting to be executed. The counting out begins at some
point in the circle and proceeds around the circle in a fixed direction. In each step, a certain
number of people are skipped and the next person is executed. The elimination proceeds around the
circle (which is becoming smaller and smaller as the executed people are removed), until only the
last person remains, who is given freedom.

Given the total number of persons N and a number k which indicates that k-1 persons are skipped and
the kth person is killed in a circle. The task is to choose the person in the initial circle that
survives.
 Examples:
    
 Input: N = 5 and k = 2  
 Output: 3  
 Explanation: Firstly, the person at position 2 is killed, then the person at position 4 is
 killed, then the person at position 1 is killed.  
 Finally, the person at position 5 is killed. So the person at position 3 survives.
 
 Input: N = 7 and k = 3 
 Output:4
 Explanations: The persons at positions 3, 6, 2, 7, 5, and 1 are killed in order, and the person at
 position 4 survives.
 
*/


func josephusIterative(_ n: Int, _ k: Int) -> Int {
    var result = 0  
    
    // Build up from 2 people to n people
    for i in 2...n {
        result = (result + k) % i
        print(result)
    }
    return result + 1  // Convert to 1-indexed
}

//print(josephusIterative(5, 2))  // Output: 3

print(josephusIterative(7, 3))  // Output: 4




func josephus(_ n: Int, _ k: Int) -> Int {
    // Base case
    if n == 1 {
        return 0 // 0-indexed position
    }
    
    // Recursively find the safe position for n-1 people
    // Then adjust for the current circle size
    return (josephus(n - 1, k) + k) % n
}

// Helper to convert to 1-indexed result
func josephusSurvivor(_ n: Int, _ k: Int) -> Int {
    return josephus(n, k) + 1
}
