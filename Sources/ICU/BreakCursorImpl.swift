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

/// Provides the actual implementation of a break cursor.
///
/// This type allows the concrete break cursor types to handle creation of the
/// ICU cursor object (using `ubrk_open` or `ubrk_openRules`) and the precise
/// type used to represent rule status tags but otherwise share the
/// implementation of the other operations.
internal struct BreakCursorImpl<RuleStatus> {

  /// The string being scanned by the cursor.
  var text: String? {
    didSet {
      textPointer?.deallocate()
      if let text = text {
        textPointer = text.unsafeUTF16CodeUnits()

        var error = UErrorCode()
        ubrk_setText(
          cBreak,
          textPointer?.baseAddress,
          Int32(textPointer?.count ?? 0),
          &error)
      }
    }
  }

  /// The most recently returned text boundary.
  var index: String.Index? {
    let offset = ubrk_current(cBreak)
    guard let result = stringIndex(forUTF16Offset: offset) else {
      preconditionFailure("Break cursor index was not valid")
    }
    return result
  }

  /// The status tag from the break rule that determined the most recently
  /// returned break position.
  ///
  /// If more than one break rule applied at the current position, then the
  /// numerically largest status tag is returned.
  var ruleStatus: RuleStatus {
    return ruleStatusFactory(Int(ubrk_getRuleStatus(cBreak)))
  }

  /// The status tags from the break rules that determined the most recently
  /// returned break position.
  var ruleStatuses: [RuleStatus] {
    var error = UErrorCode()
    let capacity = ubrk_getRuleStatusVec(cBreak, nil, 0, &error)

    var rawStatuses = [Int32](repeating: 0, count: Int(capacity))
    rawStatuses.withUnsafeMutableBufferPointer { buffer in
      error = UErrorCode()
      _ = ubrk_getRuleStatusVec(cBreak, buffer.baseAddress, capacity, &error)
    }
    return rawStatuses.map { ruleStatusFactory(Int($0)) }
  }

  /// The pointer to the underlying C ICU break iterator object.
  private var cBreak: OpaquePointer

  /// The pointer to the UTF-16 code units of the text being scanned by the
  /// break iterator.
  private var textPointer: UnsafeMutableBufferPointer<UChar>?

  /// The function that converts the integer value of a rule status tag to a
  /// typed value.
  private var ruleStatusFactory: (Int) -> RuleStatus

  /// Creates a new break cursor implementation that wraps an already-created
  /// ICU break iterator.
  ///
  /// - Parameters:
  ///   - cBreak: The ICU break iterator object.
  ///   - text: The text string to be iterated over.
  ///   - textPointer: A pointer to a copy of the UTF-16 code units of `text`.
  init(
    cBreak: OpaquePointer,
    text: String?,
    textPointer: UnsafeMutableBufferPointer<UChar>?,
    ruleStatusFactory: @escaping (Int) -> RuleStatus
  ) {
    self.cBreak = cBreak
    self.text = text
    self.textPointer = textPointer
    self.ruleStatusFactory = ruleStatusFactory
  }

  /// Creates a new break cursor of the given type.
  ///
  /// - Parameters:
  ///   - type: The ICU break iterator type.
  ///   - text: The text string to be iterated over.
  ///   - locale: The locale used to determine the language rules for text
  ///     breaking.
  init(
    type: UBreakIteratorType,
    text: String?,
    locale: String?,
    ruleStatusFactory: @escaping (Int) -> RuleStatus
  ) {
    let textPointer = text?.unsafeUTF16CodeUnits()

    var error = UErrorCode()
    let cBreak = ubrk_open(
      type,
      locale ?? String(cString: uloc_getDefault()),
      textPointer?.baseAddress,
      Int32(truncatingIfNeeded: textPointer?.count ?? 0),
      &error)

    self.init(
      cBreak: cBreak!,
      text: text,
      textPointer: textPointer,
      ruleStatusFactory: ruleStatusFactory)
  }

  /// Closes the underlying ICU break iterator and frees the memory used to
  /// manage the current copy of the text.
  func release() {
    ubrk_close(cBreak)
    textPointer?.deallocate()
  }

  /// Returns the start index of the text being scanned.
  ///
  /// This method also adjusts the cursor such that its `index` is equal to the
  /// text's starting index.
  ///
  /// - Returns: The start index of the text being scanned.
  func first() -> String.Index {
    let result = ubrk_first(cBreak)
    return stringIndex(forUTF16Offset: result)!
  }

  /// Returns the index past the last character of the text being scanned.
  ///
  /// This method also adjusts the cursor such that its `index` is equal to the
  /// index past the last character of the text.
  ///
  /// - Returns: The index past the last character of the text being scanned.
  func last() -> String.Index {
    let result = ubrk_last(cBreak)
    return stringIndex(forUTF16Offset: result)!
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
  func next() -> String.Index? {
    let result = ubrk_next(cBreak)
    guard result != UBRK_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
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
  func previous() -> String.Index? {
    let result = ubrk_previous(cBreak)
    guard result != UBRK_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
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
  func moveToIndex(following index: String.Index) -> String.Index? {
    let offset = utf16Offset(forStringIndex: index)
    let result = ubrk_following(cBreak, offset)
    guard result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
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
  func moveToIndex(preceding index: String.Index) -> String.Index? {
    let offset = utf16Offset(forStringIndex: index)
    let result = ubrk_preceding(cBreak, offset)
    guard result != USEARCH_DONE else { return nil }
    return stringIndex(forUTF16Offset: result)
  }

  /// Returns true if the given index represents a boundary position in the
  /// cursor's text, also moving the cursor to the first boundary at or
  /// following that index.
  ///
  /// - Parameter index: The index to check.
  /// - Returns: True if the given index is a boundary position.
  func isBoundary(movingToOrAfter index: String.Index) -> Bool {
    let offset = utf16Offset(forStringIndex: index)
    return ubrk_isBoundary(cBreak, offset) != 0
  }

  /// Returns the index in the string being searched that corresponds to the
  /// given offset in its UTF-16 code units.
  ///
  /// - Parameters offset: An integer offset in the UTF-16 code units of the
  ///   string being searched.
  /// - Returns: The corresponding string index.
  private func stringIndex(forUTF16Offset offset: Int32) -> String.Index? {
    guard let text = text else { return nil }
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
    guard let text = text else { return 0 }
    let utf16 = text.utf16
    guard let utf16Index = index.samePosition(in: utf16) else {
      preconditionFailure("String index must be UTF-16 aligned")
    }
    let offset = utf16.distance(from: utf16.startIndex, to: utf16Index)
    return Int32(truncatingIfNeeded: offset)
  }
}
