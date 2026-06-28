/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 */

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else { return s }
    // is iterating from top to down ⬇️ true and up ↗️ false
    var traversingDown = true
    // create an empty array upto row count
    var arryOfString = Array(repeating: "", count: numRows)
    var rowIndex = 0
    for char in s {
        // append char at row string
        arryOfString[rowIndex] += String(char)
        // colomn top position
        if rowIndex == 0 {
            traversingDown = true
        }
        // colomn bottom position
        else if (rowIndex == numRows - 1) {
            traversingDown = false
        }
        // update row index
        traversingDown ? (rowIndex += 1) : (rowIndex -= 1)
    }
    return arryOfString.joined()
}

convert("PAYPALISHIRING", 2)

