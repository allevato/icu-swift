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

/// Provides an interface for efficiently locating character boundaries in a
/// text string.
///
/// Note that this cursor essentially provides the same informatio that Swift's
/// own treatment of `String` as a collection of `Character` values provides. It
/// is included primarily for API completeness.
///
/// Unlike other cursor types, character break cursors do not surface rule
/// status values.
///
/// **Terminology note:** The name "cursor" has been chosen instead of
/// "iterator" to better map to the concepts found in Swift. Swift's iterator
/// types provide unidirectional traversal of a sequence; by contrast, a
/// "cursor" more accurately describes this type, which can move forward and
/// backward arbitrarily within a string.
public final class CharacterBreakCursor {

  /// The actual break cursor implementation to which this class's operations
  /// are delegated.
  private var impl: BreakCursorImpl<Void>

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

  /// Creates a new character break cursor with the given rules.
  ///
  /// - Parameters:
  ///   - text: The optional initial text that the cursor will scan.
  ///   - locale: The locale used to determine the language rules for text
  ///     breaking.
  public init(text: String? = nil, locale: String? = nil) {
    self.locale = locale
    self.impl = BreakCursorImpl(
      type: UBRK_CHARACTER,
      text: text,
      locale: locale
    ) { _ in () }
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
