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

/// Unit tests for `CharacterBreakCursor`.
class CharacterBreakCursorTests: XCTestCase {
  //                    01                                         23
  let text =           "a\u{1F937}\u{1F3FD}\u{200D}\u{2642}\u{FE0F}b"

  var cursor: CharacterBreakCursor!

  override func setUp() {
    cursor = CharacterBreakCursor(text: text)
  }

  func testBreaksForward() {
    assertBreak(cursor.first(), at: 0)
    assertBreak(cursor.next(), at: 1)
    assertBreak(cursor.next(), at: 2)
    assertBreak(cursor.next(), at: 3)
    XCTAssertNil(cursor.next())
  }

  func testBreaksBackward() {
    assertBreak(cursor.last(), at: 3)
    assertBreak(cursor.previous(), at: 2)
    assertBreak(cursor.previous(), at: 1)
    assertBreak(cursor.previous(), at: 0)
    XCTAssertNil(cursor.previous())
  }

  func testBreaksFollowing() {
    assertBreak(cursor.moveToIndex(
      following: text.index(text.startIndex, offsetBy: 2)), at: 3)
    XCTAssertNil(cursor.moveToIndex(following: text.endIndex))
  }

  func testBreaksPreceding() {
    assertBreak(cursor.moveToIndex(
      preceding: text.index(text.startIndex, offsetBy: 3)), at: 2)
    XCTAssertNil(cursor.moveToIndex(preceding: text.startIndex))
  }

  func testIsBoundary() {
    XCTAssertTrue(cursor.isBoundary(movingToOrAfter: text.startIndex))
    assertBreak(cursor.index, at: 0)

    // This even works with String indices that are in the middle of a
    // character, like the following example where the index is in the middle of
    // a multi-scalar cluster that combine to make a single emoji character.
    // Swift's indices, combined with ICU functionality, properly determine that
    // the index is not a character boundary and moves it to the correct
    // position.
    let scalars = text.unicodeScalars
    XCTAssertFalse(cursor.isBoundary(
      movingToOrAfter: scalars.index(scalars.startIndex, offsetBy: 2)))
    assertBreak(cursor.index, at: 2)
  }

  func testSetText() {
    cursor.text = "abc"
    _ = cursor.first()
    assertBreak(cursor.next(), at: 1)
  }

  /// Asserts that the given break index is `distance` from the start of the
  /// string and that the most recent rule status matches the given one.
  private func assertBreak(
    _ index: String.Index?,
    at distance: Int,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    assertIndex(
      index,
      isDistance: distance,
      fromStartOf: text,
      file: file,
      line: line)
  }
}

