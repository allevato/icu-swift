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

/// Unit tests for `RuleBasedBreakCursor`.
class RuleBasedBreakCursorTests: XCTestCase {

  let text = "AB12"
  var cursor: RuleBasedBreakCursor<Int>!
  
  override func setUp() {
    do {
      let breakRules = """
        [A-Z]{100};
        [\\p{Lu}]{200};
        [0-9]{300};
        [\\p{N}]{400};
        !.*;
        """
      cursor = try RuleBasedBreakCursor(rules: breakRules, text: text)
    } catch {
      XCTFail("Setup should not throw error")
    }
  }
  
  func testInvalidRule() {
    let badRules = """
                 # This is a rule comment on line 1
      [:L:];     # This rule is OK.
      abcdefg);  # Error, mismatched parens
      """
    XCTAssertThrowsError(try RuleBasedBreakCursor(rules: badRules)) { error in
      guard case BreakRuleParseError.mismatchedParentheses(
        let context) = error
      else {
        XCTFail("Expected mismatchedParentheses thrown, but got \(error)")
        return
      }
      guard case ParseErrorContext.Location.lineAndColumn(
        line: let line, column: let column) = context.location
      else {
        XCTFail("Expected lineAndColumn location, but got \(context.location)")
        return
      }
      XCTAssertEqual(line, 3)
      XCTAssertEqual(column, 8)
    }
  }

  func testRuleStatuses() {
    assertIndex(cursor.first(), isDistance: 0, fromStartOf: text)
    XCTAssertEqual(cursor.ruleStatuses, [0])
    assertIndex(cursor.next(), isDistance: 1, fromStartOf: text)
    XCTAssertEqual(cursor.ruleStatuses, [100, 200])
    assertIndex(cursor.next(), isDistance: 2, fromStartOf: text)
    XCTAssertEqual(cursor.ruleStatuses, [100, 200])
    assertIndex(cursor.next(), isDistance: 3, fromStartOf: text)
    XCTAssertEqual(cursor.ruleStatuses, [300, 400])
    assertIndex(cursor.next(), isDistance: 4, fromStartOf: text)
    XCTAssertEqual(cursor.ruleStatuses, [300, 400])
    XCTAssertNil(cursor.next())
  }
}
