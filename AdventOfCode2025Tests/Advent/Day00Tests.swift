//
//  AdventOfCode2025Tests.swift
//  AdventOfCode2025Tests
//
//  Created by Austin Betzer on 12/1/24.
//

import XCTest
@testable import AdventOfCode2025

final class AdventOfCode2025Tests: XCTestCase {
    func testDay00() {
        let left = [3, 4, 2, 1, 3, 3]
        let right = [4, 3, 5, 3, 9, 3]

        XCTAssertEqual(Day00.perform(left: left, right: right), 11)
    }

    func testDay00part2() {
        let left = [3, 4, 2, 1, 3, 3]
        let right = [4, 3, 5, 3, 9, 3]

        XCTAssertEqual(Day00.simulairtyScore(left: left, right: right), 31)
    }

    func testrunDay00() {
        let (left, right) = FileProcessor.processDay00File(fileName: "day00")
        let result = Day00.perform(left: left, right: right)
        XCTAssertEqual(result, 2000468)
    }

    func testrunDay00Par2() {
        let (left, right) = FileProcessor.processDay00File(fileName: "day00")
        let result = Day00.simulairtyScore(left: left, right: right)
        XCTAssertEqual(result, 18567089)
    }
}
