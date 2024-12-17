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
