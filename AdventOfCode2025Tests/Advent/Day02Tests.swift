//
//  Day02Tests.swift
//  AdventOfCode2025Tests
//
//  Created by Austin Betzer on 12/3/24.
//

import XCTest
@testable import AdventOfCode2025

final class Day02Tests: XCTestCase {

    func testDay02() {
        let value = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
        XCTAssertEqual(Day02.mullItOver(value), 161)
    }

    func testloadFile(){
        XCTAssertNotNil(Day02FileProcessor.loadFileAsString(fileName: "day02"), "Failed to load file")
    }

    func testRunDay02() {
        let value = Day02FileProcessor.loadFileAsString(fileName: "day02")!
        let result = Day02.mullItOver(value)
        print("runDay02: \(result)")
    }
}
