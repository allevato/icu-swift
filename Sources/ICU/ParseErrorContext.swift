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

/// Represents the location and text content of an error that occurred while
/// parsing source text, such as break cursor rules.
public struct ParseErrorContext {

  /// Indicates where in the source text the error occurred.
  ///
  /// Parsers that support line numbers will return locations using the
  /// `lineAndColumn` case. Parsers that do not support them will only return
  /// locations that are case `offset`.
  public enum Location {

    /// The line number and column offset (both starting at 1) where the error
    /// occurred.
    case lineAndColumn(line: Int, column: Int)

    /// The offset (in terms of UTF-16 code units) in the source text where the
    /// error occurred.
    case offset(Int)
  }

  /// The location where the error occurred in the source text.
  public let location: Location

  /// Some textual context before the error.
  ///
  /// If the parser does not support this, it will be empty.
  public let preContext: String

  /// The textual content of the error itself and some trailing content.
  ///
  /// If the parser does not support this, it will be empty.
  public let postContext: String

  /// Creates a new `ParseErrorContext` from the given ICU C value.
  ///
  /// - Parameter cValue: The `UParseError` value from an ICU C API that
  ///   describes the error context.
  init(cValue: UParseError) {
    if cValue.line >= 1 {
      self.location =
        .lineAndColumn(line: Int(cValue.line), column: Int(cValue.offset))
    } else {
      self.location = .offset(Int(cValue.offset))
    }

    var cValueCopy = cValue
    self.preContext = withUnsafeBytes(of: &cValueCopy.preContext) {
      (rawPointer) in
      let codeUnitPointer =
        rawPointer.baseAddress!.assumingMemoryBound(to: UChar.self)
      return String(unsafeUTF16CodeUnits: codeUnitPointer)
    }
    self.postContext = withUnsafeBytes(of: &cValueCopy.postContext) {
      (rawPointer) in
      let codeUnitPointer =
        rawPointer.baseAddress!.assumingMemoryBound(to: UChar.self)
      return String(unsafeUTF16CodeUnits: codeUnitPointer)
    }
  }
}
