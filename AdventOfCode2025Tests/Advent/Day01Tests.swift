//
//  Day01Tests.swift
//  AdventOfCode2025Tests
//
//  Created by Austin Betzer on 12/2/24.
//

import XCTest
@testable import AdventOfCode2025

final class Day01Tests: XCTestCase {

    func testIsSafe() {
        let result1 = Level.isLevelSafe([7, 6, 4, 2, 1]).isSafe
        XCTAssertTrue(result1, "Safe because the levels are all decreasing by 1 or 2.")

        let result2 = Level.isLevelSafe([1, 3, 6, 7, 9]).isSafe
        XCTAssertTrue(result2, "Safe because the levels are all increasing by 1, 2, or 3.")
    }

    func testIsFalse() {
        let result1 = Level.isLevelSafe([1, 2, 7, 8, 9]).isSafe
        XCTAssertFalse(result1, "Unsafe because 2 7 is an increase of 5.")

        let result2 = Level.isLevelSafe([9, 7, 6, 2, 1]).isSafe
        XCTAssertFalse(result2, "Unsafe because 6 2 is a decrease of 4.")

        let result3 = Level.isLevelSafe([1, 3, 2, 4, 5]).isSafe
        XCTAssertFalse(result3, "Unsafe because 1 3 is increasing but 3 2 is decreasing.")

        let result4 = Level.isLevelSafe([8, 6, 4, 4, 1]).isSafe
        XCTAssertFalse(result4, "Unsafe because 4 4 is neither an increase or a decrease.")
    }

    func testSafeAfterRemovingOneLevel() {
        let result1 = Level.isLevelSafeWithDamper([1, 3, 2, 4, 5])
        XCTAssertTrue(result1, "Safe by removing the second level, 3.")

        let result2 = Level.isLevelSafeWithDamper([8, 6, 4, 4, 1])
        XCTAssertTrue(result2, "Safe by removing the third level, 4.")

        let result3 = Level.isLevelSafeWithDamper([1, 2, 7, 8, 9])
        XCTAssertFalse(result3, "Unsafe regardless of which level is removed.")

        let result4 = Level.isLevelSafeWithDamper([9, 7, 6, 2, 1])
        XCTAssertFalse(result4, "Unsafe regardless of which level is removed.")
    }

    func testIsAlreadySafe() {
        let result1 = Level.isLevelSafeWithDamper([7, 6, 4, 2, 1])
        XCTAssertTrue(result1, "Safe without removing any level.")

        let result2 = Level.isLevelSafeWithDamper([1, 3, 6, 7, 9])
        XCTAssertTrue(result2, "Safe without removing any level.")
    }

    func testLoadFile() {
        let result = Day01FileProcessor.loadFileIntoArray(fileName: "day01")
        XCTAssertEqual(result.count, 1000)
    }

    func testVerifyNumberOfSafeLevels() {
        let result = Day01FileProcessor.loadFileIntoArray(fileName: "day01")

        var safeLevels = 0
        for level in result {
            let isSafe = Level.isLevelSafe(level).isSafe
            if isSafe {
                safeLevels += 1
            }
        }

        XCTAssertEqual(safeLevels, 402)
    }

    func testVerifyNumberOfSafeLevelsWithDamper() {
        let result = Day01FileProcessor.loadFileIntoArray(fileName: "day01")

        var safeLevels = 0
        for level in result {
            let isSafe = Level.isLevelSafeWithDamper(level)
            if isSafe {
                safeLevels += 1
            }
        }

        XCTAssertEqual(safeLevels, 455)
    }

}
