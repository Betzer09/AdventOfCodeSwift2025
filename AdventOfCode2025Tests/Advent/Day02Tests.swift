//
//  Day02Tests.swift
//  AdventOfCode2025Tests
//
//  Created by Austin Betzer on 12/3/24.
//

import XCTest

final class Day02Tests: XCTestCase {

    func testDay02() {
        let value = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

        let pattern = /mul\(\d+,\d+\)/
        let matches = value.matches(of: pattern).map{ match in
            String(value[match.range])
        }

        print(matches.joined())

        let multiplicationPattern = /\d+,\d+/
        let matches2 = matches.joined().matches(of: multiplicationPattern).map{ match in
            String(value[match.range])
        }

        print(matches2)


        XCTAssertEqual(matches.count, 4)
    }

}
