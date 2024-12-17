//
//  Day01.swift
//  AdventOfCode2025
//
//  Created by Austin Betzer on 12/2/24.
//

import Foundation
import os

struct Level {
    static func isLevelSafe(_ level: [Int]) -> (index: Int?, isSafe: Bool) {
        var isSafe = true
        var currentIndex: Int? = nil

        guard level.count > 1 else { return (nil, false) } 

        var isPositiveDifference: Bool? = nil

        for i in 0..<level.count - 1 {
            let difference = level[i] - level[i + 1]

            // Check if the difference is invalid
            if difference == 0 || abs(difference) > 3 {
                isSafe = false
                currentIndex = i
            }

            // Determine the trend on the first iteration or validate it
            let isPositive = difference > 0
            if let trend = isPositiveDifference {
                if trend != isPositive {
                    isSafe = false
                    currentIndex = i
                }
            } else {
                isPositiveDifference = isPositive
            }
        }

        return (currentIndex, isSafe)
    }

    static func isLevelSafeWithDamper(_ levels: [Int]) -> Bool {
        // Check if the original levels are safe
        if isLevelSafe(levels).isSafe {
            return true
        }

        // Try removing each element one by one
        for i in 0..<levels.count {
            var modifiedLevels = levels
            modifiedLevels.remove(at: i)
            if isLevelSafe(modifiedLevels).isSafe {
                return true
            }
        }

        // If no single removal makes the levels safe
        return false
    }
}

struct Day01FileProcessor {
    static let logger = Logger(subsystem: "com.example.Day01", category: "FileProcessing")

    static func loadFileIntoArray(fileName: String) -> [[Int]] {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            logger.error("File not found: \(fileName, privacy: .public)")
            return []
        }

        do {
            let content = try String(contentsOfFile: filePath)
            let lines = content.split(separator: "\n")

            var result: [[Int]] = []
            for line in lines {
                let numbers = line.split(separator: " ").compactMap { Int($0) }
                result.append(numbers)
            }

            logger.info("Successfully loaded \(result.count) rows from the file.")
            return result
        } catch {
            logger.error("Error reading file: \(error.localizedDescription, privacy: .public)")
            return []
        }
    }
}
