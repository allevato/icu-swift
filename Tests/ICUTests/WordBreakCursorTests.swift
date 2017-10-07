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

/// Unit tests for `WordBreakCursor`.
class WordBreakCursorTests: XCTestCase {
  //                    000000000011111111112222222
  //                    012345678901234567890123456
  let text =           "This is the test, isn't it?"
  //                    0   10 10  10   100    10 10
  // 0 = .none
  // 1 = .letter

  var cursor: WordBreakCursor!

  override func setUp() {
    cursor = WordBreakCursor(text: text)
  }

  func testBreaksForward() {
    assertBreak(cursor.first(), at: 0, status: .none)
    assertBreak(cursor.next(), at: 4, status: .letter)
    assertBreak(cursor.next(), at: 5, status: .none)
    assertBreak(cursor.next(), at: 7, status: .letter)
    assertBreak(cursor.next(), at: 8, status: .none)
    assertBreak(cursor.next(), at: 11, status: .letter)
    assertBreak(cursor.next(), at: 12, status: .none)
    assertBreak(cursor.next(), at: 16, status: .letter)
    assertBreak(cursor.next(), at: 17, status: .none)
    assertBreak(cursor.next(), at: 18, status: .none)
    assertBreak(cursor.next(), at: 23, status: .letter)
    assertBreak(cursor.next(), at: 24, status: .none)
    assertBreak(cursor.next(), at: 26, status: .letter)
    assertBreak(cursor.next(), at: 27, status: .none)
    XCTAssertNil(cursor.next())
  }

  func testBreaksBackward() {
    assertBreak(cursor.last(), at: 27, status: .none)
    assertBreak(cursor.previous(), at: 26, status: .letter)
    assertBreak(cursor.previous(), at: 24, status: .none)
    assertBreak(cursor.previous(), at: 23, status: .letter)
    assertBreak(cursor.previous(), at: 18, status: .none)
    assertBreak(cursor.previous(), at: 17, status: .none)
    assertBreak(cursor.previous(), at: 16, status: .letter)
    assertBreak(cursor.previous(), at: 12, status: .none)
    assertBreak(cursor.previous(), at: 11, status: .letter)
    assertBreak(cursor.previous(), at: 8, status: .none)
    assertBreak(cursor.previous(), at: 7, status: .letter)
    assertBreak(cursor.previous(), at: 5, status: .none)
    assertBreak(cursor.previous(), at: 4, status: .letter)
    assertBreak(cursor.previous(), at: 0, status: .none)
    XCTAssertNil(cursor.previous())
  }
  
  func testBreaksFollowing() {
    assertBreak(cursor.moveToIndex(
      following: text.index(text.startIndex, offsetBy: 2)
    ), at: 4, status: .letter)
    XCTAssertNil(cursor.moveToIndex(following: text.endIndex))
  }

  func testBreaksPreceding() {
    assertBreak(cursor.moveToIndex(
      preceding: text.index(text.startIndex, offsetBy: 20)
    ), at: 18, status: .none)
    XCTAssertNil(cursor.moveToIndex(preceding: text.startIndex))
  }

  func testIsBoundary() {
    XCTAssertTrue(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 12)))
    assertBreak(cursor.index, at: 12, status: .none)

    XCTAssertFalse(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 14)))
    assertBreak(cursor.index, at: 16, status: .letter)
  }

  func testSetText() {
    cursor.text = "one two"
    _ = cursor.first()
    assertBreak(cursor.next(), at: 3, status: .letter)
  }

  /// Asserts that the given break index is `distance` from the start of the
  /// string and that the most recent rule status matches the given one.
  private func assertBreak(
    _ index: String.Index?,
    at distance: Int,
    status: WordBreakCursor.RuleStatusRange,
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
