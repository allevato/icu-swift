// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import ICUTests

extension SearchCursorTests {
  static var allTests = [
    ("testFirst", testFirst),
    ("testNext", testNext),
    ("testLast", testLast),
    ("testPrevious", testPrevious),
    ("testMoveToIndexFollowing", testMoveToIndexFollowing),
    ("testMoveToIndexPreceding", testMoveToIndexPreceding),
  ]
}

XCTMain([
  testCase(SearchCursorTests.allTests),
])
