// Copyright 2017 Tony Allevato.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import ICU
import XCTest

/// Unit tests for `LineBreakCursor`.
class LineBreakCursorTests: XCTestCase {
  //                    000000000011 11111111222222222
  //                    012345678901 23456789012345678
  let text =           "Here's some\npossible—breaks."
  //                    0      0     1       00      0
  // 0 = .soft
  // 1 = .hard
  
  var cursor: LineBreakCursor!
  
  override func setUp() {
    cursor = LineBreakCursor(text: text)
  }
  
  func testBreaksForward() {
    assertBreak(cursor.first(), at: 0, status: .soft)
    assertBreak(cursor.next(), at: 7, status: .soft)
    assertBreak(cursor.next(), at: 12, status: .hard)
    assertBreak(cursor.next(), at: 20, status: .soft)
    assertBreak(cursor.next(), at: 21, status: .soft)
    assertBreak(cursor.next(), at: 28, status: .soft)
    XCTAssertNil(cursor.next())
  }
  
  func testBreaksBackward() {
    assertBreak(cursor.last(), at: 28, status: .soft)
    assertBreak(cursor.previous(), at: 21, status: .soft)
    assertBreak(cursor.previous(), at: 20, status: .soft)
    assertBreak(cursor.previous(), at: 12, status: .hard)
    assertBreak(cursor.previous(), at: 7, status: .soft)
    assertBreak(cursor.previous(), at: 0, status: .soft)
    XCTAssertNil(cursor.previous())
  }
  
  func testBreaksFollowing() {
    assertBreak(cursor.moveToIndex(
      following: text.index(text.startIndex, offsetBy: 15)
    ), at: 20, status: .soft)
    XCTAssertNil(cursor.moveToIndex(following: text.endIndex))
  }
  
  func testBreaksPreceding() {
    assertBreak(cursor.moveToIndex(
      preceding: text.index(text.startIndex, offsetBy: 18)
    ), at: 12, status: .hard)
    XCTAssertNil(cursor.moveToIndex(preceding: text.startIndex))
  }

  func testIsBoundary() {
    XCTAssertTrue(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 12)))
    assertBreak(cursor.index, at: 12, status: .hard)

    XCTAssertFalse(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 17)))
    assertBreak(cursor.index, at: 20, status: .soft)
  }

  func testSetText() {
    cursor.text = "a\nb"
    _ = cursor.first()
    assertBreak(cursor.next(), at: 2, status: .hard)
  }

  /// Asserts that the given break index is `distance` from the start of the
  /// string and that the most recent rule status matches the given one.
  private func assertBreak(
    _ index: String.Index?,
    at distance: Int,
    status: LineBreakCursor.RuleStatusRange,
    file: StaticString = #file,
    line: UInt = #line
    ) {
    assertIndex(
      index,
      isDistance: distance,
      fromStartOf: text,
      file: file,
      line: line)
    XCTAssertTrue(status ~= cursor.ruleStatus, file: file, line: line)
  }
}


