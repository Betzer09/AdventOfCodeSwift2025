/**
 Within each pair, figure out how far apart the two numbers are; you'll need to add up all of those distances. For example, if you pair up a 3 from the left list with a 7 from the right list, the distance apart is 4; if you pair up a 9 with a 3, the distance apart is 6.

 In the example list above, the pairs and distances would be as follows:

 The smallest number in the left list is 1, and the smallest number in the right list is 3. The distance between them is 2.
 The second-smallest number in the left list is 2, and the second-smallest number in the right list is another 3. The distance between them is 1.
 The third-smallest number in both lists is 3, so the distance between them is 0.
 The next numbers to pair up are 3 and 4, a distance of 1.
 The fifth-smallest numbers in each list are 3 and 5, a distance of 2.
 Finally, the largest number in the left list is 4, while the largest number in the right list is 9; these are a distance 5 apart.
 */

import Foundation
import os

struct Day00 {
    static let logger = Logger(subsystem: "com.example.Day00", category: "Calculation")

    static public func perform(left: [Int], right: [Int]) -> Int {
        let sortedLeft = left.sorted()
        let sortedRight = right.sorted()

        logger.info("Sorted Left: \(sortedLeft, privacy: .public)")
        logger.info("Sorted Right: \(sortedRight, privacy: .public)")

        var totalDistance = 0

        for (index, element) in sortedLeft.enumerated() {
            let difference = abs(element - sortedRight[index])
            logger.info("Index \(index): |\(element) - \(sortedRight[index])| = \(difference, privacy: .public)")
            totalDistance += difference
        }

        logger.info("Total Distance: \(totalDistance, privacy: .public)")
        return totalDistance
    }

    /**
     For these example lists, here is the process of finding the similarity score:

     The first number in the left list is 3. It appears in the right list three times, so the similarity score increases by 3 * 3 = 9.
     The second number in the left list is 4. It appears in the right list once, so the similarity score increases by 4 * 1 = 4.
     The third number in the left list is 2. It does not appear in the right list, so the similarity score does not increase (2 * 0 = 0).
     The fourth number, 1, also does not appear in the right list.
     The fifth number, 3, appears in the right list three times; the similarity score increases by 9.
     The last number, 3, appears in the right list three times; the similarity score again increases by 9.
     So, for these example lists, the similarity score at the end of this process is 31 (9 + 4 + 0 + 0 + 9 + 9).

     3   4
     4   3
     2   5
     1   3
     3   9
     3   3
     */
    static public func simulairtyScore(left: [Int], right: [Int]) -> Int {
        var hashTable: [Int: Int] = [:]

        var similarityScore = 0

        for number in right {
            hashTable[number, default: 0] += 1
        }

        for number in left {
            if let value = hashTable[number] {
                similarityScore += value * number
            }
        }

        return similarityScore
    }
}

struct FileProcessor {
    static let logger = Logger(subsystem: "com.example.Day00", category: "FileProcessing")

    static func processDay00File(fileName: String) -> (left: [Int], right: [Int]) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            logger.error("File not found: \(fileName, privacy: .public)")
            return ([], [])
        }

        do {
            let content = try String(contentsOfFile: filePath)
            let lines = content.split(separator: "\n")

            var left: [Int] = []
            var right: [Int] = []

            for line in lines {
                // Adjusted to split by spaces
                let numbers = line.split(separator: " ").compactMap { Int($0) }
                if numbers.count == 2 {
                    left.append(numbers[0])
                    right.append(numbers[1])
                } else {
                    logger.warning("Invalid line format: \(line, privacy: .public)")
                }
            }

            logger.info("Parsed \(left.count) pairs of numbers.")
            return (left, right)

        } catch {
            logger.error("Error reading file: \(error.localizedDescription, privacy: .public)")
        }

        return ([], [])
    }
}
