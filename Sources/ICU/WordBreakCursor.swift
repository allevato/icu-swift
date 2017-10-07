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

/// Provides an interface for efficiently locating word boundaries in a text
/// string.
///
/// ICU defines the rule status tags for word breaks as _ranges_, which allows
/// future versions to subdivide tag groups into finer subcategories. Because of
/// this, they should not (and cannot) be compared using `==`. Instead, use
/// pattern matching (i.e., `if case`, `switch`, or the `~=` operator directly)
/// to determine if a status tag belongs to one of the known categories:
///
/// ```swift
/// if case .letter = cursor.ruleStatus {
///   // do something
/// }
/// ```
///
/// **Terminology note:** The name "cursor" has been chosen instead of
/// "iterator" to better map to the concepts found in Swift. Swift's iterator
/// types provide unidirectional traversal of a sequence; by contrast, a
/// "cursor" more accurately describes this type, which can move forward and
/// backward arbitrarily within a string.
public final class WordBreakCursor {

  /// Represents the status tag from a break rule.
  public struct RuleStatus {

    /// The raw integer value of the status tag.
    public let rawValue: Int

    /// Creates a new `RuleStatus` value with the given integer value.
    ///
    /// - Parameter rawValue: The integer value of the status tag.
    init(rawValue: Int) {
      self.rawValue = rawValue
    }
  }

  /// Represents a range of status tags from a break rule.
  ///
  /// The rule status tags for word breaks are meant to be treated as ranges,
  /// not exact values; this allows future versions of the library to further
  /// subdivide a break rule's tags. Thus, `RuleStatus` values should not be
  /// compared using equality, but instead use the `~=` operator (directly, or
  /// through pattern matching):
  ///
  /// ```swift
  /// if case .letter = cursor.ruleStatus {
  ///   // do something
  /// }
  /// ```
  public struct RuleStatusRange {

    /// The range of integer values.
    private let range: Range<Int>

    /// Creates a new rule status range from a range of unsigned integers.
    ///
    /// - Parameter range: The range of unsigned integers.
    private init(_ range: Range<UInt32>) {
      self.range = Int(range.lowerBound)..<Int(range.upperBound)
    }

    /// The rule status range containing "words" that do not fit into any of
    /// the other categories (such as spaces and most punctuation).
    public static let none = RuleStatusRange(
      UBRK_WORD_NONE.rawValue..<UBRK_WORD_NONE_LIMIT.rawValue)

    /// The rule status range containing "words" that appear to be numbers.
    public static let number = RuleStatusRange(
      UBRK_WORD_NUMBER.rawValue..<UBRK_WORD_NUMBER_LIMIT.rawValue)

    /// The rule status range for words that contain letters (excluding
    /// hiragana, katakana, and ideographic characters).
    public static let letter = RuleStatusRange(
      UBRK_WORD_LETTER.rawValue..<UBRK_WORD_LETTER_LIMIT.rawValue)

    /// The rule status range for words containing hiragana or katakana.
    public static let kana = RuleStatusRange(
      UBRK_WORD_KANA.rawValue..<UBRK_WORD_KANA_LIMIT.rawValue)

    /// The rule status range for words containing ideographic characters.
    public static let ideographic = RuleStatusRange(
      UBRK_WORD_IDEO.rawValue..<UBRK_WORD_IDEO_LIMIT.rawValue)

    /// Returns true if the range contains the given rule status tag.
    ///
    /// - Parameters:
    ///   - range: The rule status range.
    ///   - ruleStatus: The rule status.
    /// - Returns: True if the range contains the given rule status tag.
    public static func ~= (
      range: RuleStatusRange,
      ruleStatus: RuleStatus
    ) -> Bool {
      return range.range.contains(ruleStatus.rawValue)
    }
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

  /// The text being scanned by the cursor.
  public var text: String? {
    get { return impl.text }
    set { impl.text = newValue }
  }

  /// The most recently returned text boundary.
  public var index: String.Index? {
    return impl.index
  }

  /// The locale used to determine the language rules for text breaking.
  public let locale: String?

  /// Creates a new word break cursor with the given rules.
  ///
  /// - Parameters:
  ///   - text: The optional initial text that the cursor will scan.
  ///   - locale: The locale used to determine the language rules for text
  ///     breaking.
  public init(text: String? = nil, locale: String? = nil) {
    self.locale = locale
    self.impl = BreakCursorImpl(
      type: UBRK_WORD,
      text: text,
      locale: locale,
      ruleStatusFactory: RuleStatus.init)
  }

  deinit {
    impl.release()
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
