//
//  Day02.swift
//  AdventOfCode2025
//
//  Created by Austin Betzer on 12/17/24.
//

import Foundation
import os

struct Day02 {

    static func mullItOver(_ value: String) -> Int {
        let pattern = /mul\(\d+,\d+\)/
        let matches = value.matches(of: pattern).map{ match in
            String(value[match.range])
        }

        let result = matches.joined(separator: ",").filter("0123456789,.".contains)

        var total = 0

        for (index, value) in result.split(separator: ",").enumerated() where index % 2 == 0 {
            let first = Int(value)!
            let second = Int(result.split(separator: ",")[index + 1])!
            total += first * second
        }

        return total
    }
}

struct Day02FileProcessor {
    static let logger = Logger(subsystem: "com.example.Day02", category: "FileProcessing")

    static func loadFileAsString(fileName: String) -> String? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            logger.error("File not found: \(fileName, privacy: .public)")
            return nil
        }

        do {
            let content = try String(contentsOfFile: filePath)
            logger.info("Successfully loaded file: \(fileName, privacy: .public)")
            return content
        } catch {
            logger.error("Error reading file \(fileName, privacy: .public): \(error.localizedDescription, privacy: .public)")
            return nil
        }
    }
}

