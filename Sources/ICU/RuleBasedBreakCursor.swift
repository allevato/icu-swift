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

import ICU4C

/// Provides an interface for efficiently locating boundaries in a text string
/// based on a set of custom rules described using a string-based encoding.
///
/// The generic `RuleStatus` type argument itself is unconstrained, but through
/// extensions this cursor can only be instantiated when `RuleStatus` is one of
/// the following types, and instances of these types will be returned by the
/// `ruleStatus` and `ruleStatuses` properties:
///
/// 1. Anything conforming to `RawRepresentable` where `RawValue == Int`
/// 1. `Int` itself
///
/// In the first case, the `RuleStatus` type must have a value for all of the
/// tags that you specify in your rules, and also for zero; missing values will
/// result in a runtime failure. In the second case, querying `ruleStatus(es)`
/// simply returns the raw integer.
///
/// **Terminology note:** The name "cursor" has been chosen instead of
/// "iterator" to better map to the concepts found in Swift. Swift's iterator
/// types provide unidirectional traversal of a sequence; by contrast, a
/// "cursor" more accurately describes this type, which can move forward and
/// backward arbitrarily within a string.
public final class RuleBasedBreakCursor<RuleStatus> {

  /// The text being scanned by the cursor.
  public var text: String? {
    get { return impl.text }
    set { impl.text = newValue }
  }

  /// The status tag from the break rule that determined the most recently
  /// returned break position.
  ///
  /// If more than one break rule applied at the current position, then the
  /// numerically largest status tag is returned.
  public var ruleStatus: RuleStatus {
    return impl.ruleStatus
  }

  /// The status tags from the break rules that determined the most recently
  /// returned break position.
  public var ruleStatuses: [RuleStatus] {
    return impl.ruleStatuses
  }

  /// The actual break cursor implementation to which this class's operations
  /// are delegated.
  private var impl: BreakCursorImpl<RuleStatus>

  /// The string representation of the break rules used by the cursor.
  public let rules: String

  /// A pointer to a copy of the UTF-16 code units in `rules`.
  private var rulesPointer: UnsafeMutableBufferPointer<UChar>

  /// The most recently returned text boundary.
  public var index: String.Index? {
    return impl.index
  }

  /// This is the designated initializer, which is internal. it is called by
  /// the public convenience initializers, which allow public instantiation of
  /// `RuleBasedBreakIterator` for generic type arguments that satisfy specific
  /// constraints.
  ///
  /// - Parameters:
  ///   - rules: The string representation of the break rules used by the
  ///     cursor.
  ///   - text: The optional initial text that the cursor will scan.
  ///   - ruleStatusFactory: A function that converts the raw integer values of
  ///     rule status tags into instances of the generic `RuleStatus` type.
  /// - Throws: `BreakRuleParseError` if an error occurs while parsing the
  ///   rules.
  internal init(
    rules: String,
    text: String?,
    ruleStatusFactory: @escaping (Int) -> RuleStatus
  ) throws {
    self.rules = rules
    self.rulesPointer = rules.unsafeUTF16CodeUnits()
    let textPointer = text?.unsafeUTF16CodeUnits()

    var parseError = UParseError()
    var error = UErrorCode()
    let cBreak = ubrk_openRules(
      rulesPointer.baseAddress!,
      Int32(truncatingIfNeeded: rulesPointer.count),
      textPointer?.baseAddress,
      Int32(truncatingIfNeeded: textPointer?.count ?? 0),
      &parseError,
      &error)

    guard error.isSuccess else {
      let errorContext = ParseErrorContext(cValue: parseError)
      throw BreakRuleParseError(cValue: error, context: errorContext)
    }

    impl = BreakCursorImpl(
      cBreak: cBreak!,
      text: text,
      textPointer: textPointer,
      ruleStatusFactory: ruleStatusFactory)
  }

  deinit {
    impl.release()
    rulesPointer.deallocate()
  }

  /// Returns the start index of the text being scanned.
  ///
  /// This method also adjusts the cursor such that its `index` is equal to the
  /// text's starting index.
  ///
  /// - Returns: The start index of the text being scanned.
  public func first() -> String.Index {
    return impl.first()
  }

  /// Returns the index past the last character of the text being scanned.
  ///
  /// This method also adjusts the cursor such that its `index` is equal to the
  /// index past the last character of the text.
  ///
  /// - Returns: The index past the last character of the text being scanned.
  public func last() -> String.Index {
    return impl.last()
  }

  /// Returns the index of the boundary following the current boundary in the
  /// text.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the
  /// position of the next boundary, or `nil` if all boundaries have been
  /// returned.
  ///
  /// - Returns: The index of the next boundary in the text, or nil if all
  ///   boundaries have been returned.
  public func next() -> String.Index? {
    return impl.next()
  }

  /// Returns the index of the boundary preceding the current boundary in the
  /// text.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the
  /// position of the previous boundary, or `nil` if all boundaries have been
  /// returned.
  ///
  /// - Returns: The index of the previous boundary in the text, or nil if all
  ///   boundaries have been returned.
  public func previous() -> String.Index? {
    return impl.previous()
  }

  /// Returns the first index greater than `index` at which a boundary occurs.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the
  /// boundary position if one was found, or `nil` if there were no boundaries
  /// after `index`.
  ///
  /// - Parameter index: The index at which scanning should begin.
  /// - Returns: The index of the first boundary following `index`, or nil if no
  ///   boundaries were found.
  public func moveToIndex(following index: String.Index) -> String.Index? {
    return impl.moveToIndex(following: index)
  }

  /// Returns the first index less than `index` at which a boundary occurs.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the
  /// boundary position if one was found, or `nil` if there were no boundaries
  /// before `index`.
  ///
  /// - Parameter index: The index at which the scanning should begin.
  /// - Returns: The index of the first boundary preceding `index`, or nil if no
  ///   boundaries were found.
  public func moveToIndex(preceding index: String.Index) -> String.Index? {
    return impl.moveToIndex(preceding: index)
  }

  /// Returns true if the given index represents a boundary position in the
  /// cursor's text, also moving the cursor to the first boundary at or
  /// following that index.
  ///
  /// - Parameter index: The index to check.
  /// - Returns: True if the given index is a boundary position.
  public func isBoundary(movingToOrAfter index: String.Index) -> Bool {
    return impl.isBoundary(movingToOrAfter: index)
  }
}

extension RuleBasedBreakCursor
where RuleStatus: RawRepresentable, RuleStatus.RawValue == Int {

  /// Creates a new rule-based break cursor with the given rules.
  ///
  /// - Parameters:
  ///   - rules: The string representation of the break rules used by the
  ///     cursor.
  ///   - text: The optional initial text that the cursor will scan.
  /// - Throws: `BreakRuleParseError` if an error occurs while parsing the
  ///   rules.
  public convenience init(rules: String, text: String? = nil) throws {
    try self.init(rules: rules, text: text) { RuleStatus(rawValue: $0)! }
  }
}

extension RuleBasedBreakCursor where RuleStatus == Int {

  /// Creates a new rule-based break cursor with the given rules.
  ///
  /// - Parameters:
  ///   - rules: The string representation of the break rules used by the
  ///     cursor.
  ///   - text: The optional initial text that the cursor will scan.
  /// - Throws: `BreakRuleParseError` if an error occurs while parsing the
  ///   rules.
  public convenience init(rules: String, text: String? = nil) throws {
    try self.init(rules: rules, text: text) { $0 }
  }
}
