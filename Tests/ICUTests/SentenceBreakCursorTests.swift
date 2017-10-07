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

/// Unit tests for `SentenceBreakCursor`.
class SentenceBreakCursorTests: XCTestCase {
  //                    0000000000111111111122222222223 33333333344444
  //                    0123456789012345678901234567890 12345678901234
  let text =           "Here's a sentence. Another one\nAnd one more?"
  //                    0                  0            1            0
  // 0 = .terminator
  // 1 = .separator
  
  var cursor: SentenceBreakCursor!
  
  override func setUp() {
    cursor = SentenceBreakCursor(text: text)
  }
  
  func testBreaksForward() {
    assertBreak(cursor.first(), at: 0, status: .terminator)
    assertBreak(cursor.next(), at: 19, status: .terminator)
    assertBreak(cursor.next(), at: 31, status: .separator)
    assertBreak(cursor.next(), at: 44, status: .terminator)
    XCTAssertNil(cursor.next())
  }
  
  func testBreaksBackward() {
    assertBreak(cursor.last(), at: 44, status: .terminator)
    assertBreak(cursor.previous(), at: 31, status: .separator)
    assertBreak(cursor.previous(), at: 19, status: .terminator)
    assertBreak(cursor.previous(), at: 0, status: .terminator)
    XCTAssertNil(cursor.previous())
  }
  
  func testBreaksFollowing() {
    assertBreak(cursor.moveToIndex(
      following: text.index(text.startIndex, offsetBy: 15)
    ), at: 19, status: .terminator)
    XCTAssertNil(cursor.moveToIndex(following: text.endIndex))
  }
  
  func testBreaksPreceding() {
    assertBreak(cursor.moveToIndex(
      preceding: text.index(text.startIndex, offsetBy: 35)
    ), at: 31, status: .separator)
    XCTAssertNil(cursor.moveToIndex(preceding: text.startIndex))
  }

  func testIsBoundary() {
    XCTAssertTrue(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 19)))
    assertBreak(cursor.index, at: 19, status: .terminator)

    XCTAssertFalse(cursor.isBoundary(
      movingToOrAfter: text.index(text.startIndex, offsetBy: 28)))
    assertBreak(cursor.index, at: 31, status: .separator)
  }

  func testSetText() {
    cursor.text = "A. B."
    _ = cursor.first()
    assertBreak(cursor.next(), at: 3, status: .terminator)
  }

  /// Asserts that the given break index is `distance` from the start of the
  /// string and that the most recent rule status matches the given one.
  private func assertBreak(
    _ index: String.Index?,
    at distance: Int,
    status: SentenceBreakCursor.RuleStatusRange,
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

