
/*
 Find the best average grade.
 Given a list of student test scores
 Each student may have more than one test score in the list.
 
 
 Input: [["Alice", "85"], ["Bob", "90"], ["Alice", "95"], ["Bob", "80"]]
 Output: 90
 */

func findBestAverage(_ scores: [[String]]) -> Int {
    // Group scores by student name
    var mapStudents: [String: [Int]] = [:]
    for score in scores {
        let name = score[0]
        let score = Int(score[1]) ?? 0
        mapStudents[name, default: []].append(score)
    }
 
    // ["Alice": ["85", "95"], "Bob": ["90", "80"]]
    // Compute average for each student and track the maximum
    var maxAverage = 0.0
    for (name, scores) in mapStudents {
        let average = Double(scores.reduce(0, +)) / Double(scores.count)
        maxAverage = max(maxAverage, average)
    }

    return Int(maxAverage)
}

print(findBestAverage([["Alice", "85"], ["Bob", "90"], ["Alice", "95"], ["Bob", "80"]]))

