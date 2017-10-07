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

/// Provides an interface for efficiently searching a text string for matches of
/// a pattern in both forward and backward directions.
///
/// The name "cursor" has been chosen instead of "iterator" to better map to the
/// concepts found in Swift. Swift's iterator types provide unidirectional
/// traversal of a sequence; by contrast, a "cursor" more accurately describes
/// this type, which can move forward and backward arbitrarily within a string.
///
/// TODO(allevato): Support collators, search attributes, and break iterators.
public final class SearchCursor {

  /// The string being searched by the cursor.
  ///
  /// Setting this property causes the cursor's position to be reset to the
  /// beginning. This allows a cursor to be reüsed to search for the same
  /// pattern in multiple text strings.
  public var text: String {
    didSet {
      textPointer.deallocate()
      textPointer = text.unsafeUTF16CodeUnits()

      var error = UErrorCode()
      usearch_setText(
        cSearch, textPointer.baseAddress!, Int32(textPointer.count), &error)
    }
  }

  /// The pattern used for matching.
  ///
  /// Setting this property causes the cursor's internal data structures (like
  /// the Boyer-Moore table) to be recalculated, but the cursor's position is
  /// unchanged.
  public var pattern: String {
    didSet {
      patternPointer.deallocate()
      patternPointer = pattern.unsafeUTF16CodeUnits()

      var error = UErrorCode()
      usearch_setPattern(
        cSearch,
        patternPointer.baseAddress!,
        Int32(patternPointer.count),
        &error)
    }
  }

  private let cSearch: OpaquePointer
  private var patternPointer: UnsafeMutableBufferPointer<UChar>
  private var textPointer: UnsafeMutableBufferPointer<UChar>

  /// The current index in the string being searched.
  ///
  /// Setting this property sets the index at which the next search will begin.
  public var index: String.Index? {
    get {
      let offset = usearch_getOffset(cSearch)
      guard offset != USEARCH_DONE else { return nil }
      guard let result = stringIndex(forUTF16Offset: offset) else {
        preconditionFailure("Search index was not valid")
      }
      return result
    }
    set {
      guard let newValue = newValue else {
        preconditionFailure("New value for index may not be nil")
      }
      var error = UErrorCode()
      let position = utf16Offset(forStringIndex: newValue)
      usearch_setOffset(cSearch, position, &error)
    }
  }

  /// The substring representing the cursor's current match.
  public var matchedText: Substring {
    let utf16Start = usearch_getMatchedStart(cSearch)
    let start = stringIndex(forUTF16Offset: utf16Start)
    let utf16Length = usearch_getMatchedLength(cSearch)
    let end = stringIndex(forUTF16Offset: utf16Start + utf16Length)
    return text[start..<end]
  }

  /// Creates a new search cursor that finds matches of the given pattern in a
  /// text string.
  ///
  /// - Parameters:
  ///   - text: A text string to be searched.
  ///   - pattern: The pattern that will be searched for in the text string.
  ///   - locale: The locale used to determine the language rules for searching.
  public init(text: String, pattern: String, locale: String? = nil) {
    self.text = text
    self.pattern = pattern

    self.textPointer = text.unsafeUTF16CodeUnits()
    self.patternPointer = pattern.unsafeUTF16CodeUnits()

    var error = UErrorCode()
    self.cSearch = usearch_open(
      self.patternPointer.baseAddress!,
      Int32(truncatingBitPattern: self.patternPointer.count),
      self.textPointer.baseAddress!,
      Int32(truncatingBitPattern: self.textPointer.count),
      locale ?? String(cString: uloc_getDefault()),
      nil,
      &error)
  }

  deinit {
    usearch_close(cSearch)
    textPointer.deallocate()
    patternPointer.deallocate()
  }

  /// Resets the cursor.
  ///
  /// Searching will start at the beginning of the string if a forward movement
  /// is initiated before a backward movement. If a backward movement is
  /// initiated before a forward movement, then the search will start at the end
  /// of the string.
  public func reset() {
    usearch_reset(cSearch)
  }

  /// Returns the first index at which the text matches the search pattern.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Returns: The first index at which the text matches the search pattern,
  ///   or nil if no match was found.
  public func first() -> String.Index? {
    var error = UErrorCode()
    let result = usearch_first(cSearch, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the last index at which the text matches the search pattern.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Returns: The last index at which the text matches the search pattern,
  ///   or nil if no match was found.
  public func last() -> String.Index? {
    var error = UErrorCode()
    let result = usearch_last(cSearch, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the index of the next point where the text matches the search
  /// pattern, starting from the current position.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Returns: The index of the next point where the text matches the search
  ///   pattern, or nil if no match was found.
  public func next() -> String.Index? {
    var error = UErrorCode()
    let result = usearch_next(cSearch, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the index of the previous point where the text matches the search
  /// pattern, starting from the current position.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Returns: The index of the previous point where the text matches the
  ///   search pattern, or nil if no match was found.
  public func previous() -> String.Index? {
    var error = UErrorCode()
    let result = usearch_previous(cSearch, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the first index equal to or greater than `index` at which the
  /// text matches the search pattern.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Parameter index: The index at which the search should be started.
  /// - Returns: The index of the first match following `index`, or nil if no
  ///   match was found.
  public func moveToIndex(following index: String.Index) -> String.Index? {
    var error = UErrorCode()
    let offset = utf16Offset(forStringIndex: index)
    let result = usearch_following(cSearch, offset, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the first index equal to or less than `index` at which the text
  /// matches the search pattern.
  ///
  /// This method adjusts the cursor such that its `index` is equal to the match
  /// position if the pattern was found, or `nil` if it was not found.
  ///
  /// - Parameter index: The index at which the search should be started.
  /// - Returns: The index of the first match preceding `index`, or nil if no
  ///   match was found.
  public func moveToIndex(preceding index: String.Index) -> String.Index? {
    var error = UErrorCode()
    let offset = utf16Offset(forStringIndex: index)
    let result = usearch_preceding(cSearch, offset, &error)
    guard error.isSuccess && result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns the index in the string being searched that corresponds to the
  /// given offset in its UTF-16 code units.
  ///
  /// - Parameters offset: An integer offset in the UTF-16 code units of the
  ///   string being searched.
  /// - Returns: The corresponding string index.
  private func stringIndex(forUTF16Offset offset: Int32) -> String.Index? {
    let utf16 = text.utf16
    return utf16.index(
      utf16.startIndex,
      offsetBy: Int(offset)
    ).samePosition(in: text)
  }

  /// Returns the offset in UTF-16 code units corresponding to an index in the
  /// string being searched.
  ///
  /// - Parameter index: An index into the string being searched.
  /// - Returns: The integer offset in UTF-16 code units corresponding to the
  ///   index.
  private func utf16Offset(forStringIndex index: String.Index) -> Int32 {
    let utf16 = text.utf16
    let offset = utf16.distance(
      from: utf16.startIndex,
      to: index.samePosition(in: utf16))
    return Int32(truncatingBitPattern: offset)
  }
}
