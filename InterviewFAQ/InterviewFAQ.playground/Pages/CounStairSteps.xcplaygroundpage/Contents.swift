/*
 ** There is a staircase with 'n' number of steps. A child
 ** walks by and wants to climb up the stairs, starting at
 ** the bottom step and ascending to the top.instead
 ** of taking 1 step at a time, it will vary between taking
 ** either 1, 2 or 3 steps at a time.
 ** Given 'n' number of steps below method should find
 ** number of
 ** unique combinations the child could traverse.
 ** An example would be countSteps(3) == 4:
 ** 1 1 1
 ** 2 1
 ** 1 2
 ** 3
 */

func countSteps(_ n: Int) -> Int {
    
    if n < 0 { return 0 }
    if n == 0 { return 1 } // One way: already at top
    if n == 1 { return 1 } // One way: (1)
    if n == 2 { return 2 } // Two ways: (1,1), (2)
    
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 1 // 0 steps: 1 way (do nothing)
    dp[1] = 1 // 1 step: 1 way (1)
    dp[2] = 2 // 2 steps: 2 ways (1+1, 2)
    
    for i in 3...n {
        // Can reach step i from:
        // - step i-1 (take 1 step)
        // - step i-2 (take 2 steps)
        // - step i-3 (take 3 steps)
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    
    return dp[n]
}

