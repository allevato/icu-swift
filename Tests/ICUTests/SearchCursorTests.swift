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

/// Unit tests for `SearchCursor`.
class SearchCursorTests: XCTestCase {

  let text = "This is the test, isn't it?"

  var cursor: SearchCursor!

  override func setUp() {
    cursor = SearchCursor(text: text, pattern: "is")
  }

  func testFirst() {
    assertIndex(cursor.first(), isDistance: 2, fromStartOf: text)
  }

  func testNext() {
    _ = cursor.first()
    assertIndex(cursor.next(), isDistance: 5, fromStartOf: text)
    assertIndex(cursor.next(), isDistance: 18, fromStartOf: text)
    XCTAssertNil(cursor.next())
  }

  func testLast() {
    assertIndex(cursor.last(), isDistance: 18, fromStartOf: text)
  }

  func testPrevious() {
    _ = cursor.last()
    assertIndex(cursor.previous(), isDistance: 5, fromStartOf: text)
    assertIndex(cursor.previous(), isDistance: 2, fromStartOf: text)
    XCTAssertNil(cursor.previous())
  }

  func testMoveToIndexFollowing() {
    let index = text.index(text.startIndex, offsetBy: 3)
    assertIndex(
      cursor.moveToIndex(following: index), isDistance: 5, fromStartOf: text)
  }

  func testMoveToIndexPreceding() {
    let index = text.index(text.startIndex, offsetBy: 16)
    assertIndex(
      cursor.moveToIndex(preceding: index), isDistance: 5, fromStartOf: text)
  }
}
