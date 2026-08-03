/*
 
 */

func minPlatformsRequired(arrival: [Int], departure: [Int]) -> Int {
    
    guard !arrival.isEmpty, arrival.count == departure.count else { return 0 }
    
    let sortArrival = arrival.sorted()
    let sortDeparture = departure.sorted()
    
    let count = arrival.count
    var i = 0 // arrival index
    var j = 0 // departure index
    var platformNeeded = 0
    var maxPlatform = 0
    while i < count, j < count {
        if sortArrival[i] <= sortDeparture[j] {
            // A train arrives before (or when) another departs
            // Need one more platform
            platformNeeded += 1
            i += 1
        } else {
            // A train departs before the next arrival
            // Free up one platform
            platformNeeded -= 1
            j += 1
        }
        maxPlatform = max(platformNeeded, maxPlatform)
    }
    return maxPlatform
}

// Test with the example
let arrival = [900, 940, 950, 1100, 1500, 1800]
let departure = [910, 1200, 1120, 1130, 1900, 2000]
//print(minPlatformsRequired(arrival: arrival, departure: departure))  // Output: 3


func minPlatformsBrueForceRequired(arrival: [Int], departure: [Int]) -> Int {
    
    guard !arrival.isEmpty, arrival.count == departure.count else { return 0 }

    var maxPlatform = 0
    
    for i in 0..<arrival.count {
        var platformNeeded = 0
        
        for j in 0..<departure.count {
            // Check if train j overlaps with train i
            // Overlap condition: train j arrives before train i departs
            // AND train j departs after train i arrives
            if arrival[j] < departure[i] && departure[j] > arrival[i] {
                platformNeeded += 1
            }
        }
        maxPlatform  = max(maxPlatform, platformNeeded)
    }
 
    return maxPlatform
}

// Test with the example
let arrivals = [900, 940, 950, 1100, 1500, 1800]
let departures = [910, 1200, 1120, 1130, 1900, 2000]
print(minPlatformsBrueForceRequired(arrival: arrivals, departure: departures))  // Output: 3
