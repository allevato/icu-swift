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

extension Unicode.Scalar {

  /// The type of a function passed to `UnicodeScalar.enumerateCodePointRanges`.
  /// It takes three arguments: the `GeneralCategory`, the `Range<Int>` of code
  /// points, and an `inout Bool` that should be set to `true` to stop
  /// enumeration.
  public typealias EnumerateCodePointRangesCallback =
    (Unicode.GeneralCategory?, Range<Int>, inout Bool) -> Void

  /// The type of a function passed to `UnicodeScalar.enumerateScalarRanges`. It
  /// takes three arguments: the `GeneralCategory`, the
  /// `ClosedRange<UnicodeScalar>` of code points, and an `inout Bool` that
  /// should be set to `true` to stop enumeration.
  public typealias EnumerateScalarRangesCallback =
    (Unicode.GeneralCategory?, ClosedRange<UnicodeScalar>, inout Bool) -> Void

  /// The type of a function passed to `UnicodeScalar.enumerateScalars`. It
  /// takes three arguments: the current `UnicodeScalar` in the enumeration,
  /// a `String` containing the name of the code point, and an `inout Bool` that
  /// should be set to `true` to stop enumeration.
  public typealias EnumerateScalarsCallback =
    (UnicodeScalar, String, inout Bool) -> Void

  /// Enumerates contiguous ranges of Unicode code points such that the code
  /// points in each range have the same general category.
  ///
  /// This function enumerates all defined code points, including surrogates, so
  /// its callback receives integer ranges instead of `UnicodeScalar` values.
  /// To iterate only valid scalar ranges, see `enumerateScalarRanges` instead.
  ///
  /// - Parameters:
  ///   - block: A block that will be called for each contiguous range of code
  ///     points that share the same general category. It takes three arguments:
  ///     the `GeneralCategory`, the `Range<Int>` of code points, and an `inout
  ///     Bool` that should be set to `true` to stop enumeration.
  public static func enumerateCodePointRanges(
    block: EnumerateCodePointRangesCallback
  ) {
    withoutActuallyEscaping(block) { block in
      CInterop.withPointer(wrapping: block) { blockPointer in
        u_enumCharTypes(enumerateCodePointRangesCCallback, blockPointer)
      }
    }
  }

  /// Enumerates contiguous ranges of Unicode code points such that the code
  /// points in each range have the same general category.
  ///
  /// This function enumerates only code points that are valid `UnicodeScalar`
  /// values (that is, it excludes surrogates). Thus, its callback receives
  /// closed ranges of `UnicodeScalar` values. To iterate *all* code points, see
  /// `enumerateCodePointRanges` instead.
  ///
  /// - Parameters:
  ///   - includeUnassigned: If true, unassigned code points will be included in
  ///     the enumeration. The default value is false.
  ///   - block: A block that will be called for each contiguous range of code
  ///     points that share the same general category. It takes three arguments:
  ///     the `GeneralCategory`, the `ClosedRange<UnicodeScalar>` of code
  ///     points, and an `inout Bool` that should be set to `true` to stop
  ///     enumeration.
  public static func enumerateScalarRanges(
    includeUnassigned: Bool = false,
    block: EnumerateScalarRangesCallback
  ) {
    enumerateCodePointRanges { category, codePointRange, stop in
      guard category != .surrogate else {
        return
      }
      guard includeUnassigned || category != nil else {
        return
      }
      let startScalar = UnicodeScalar(codePointRange.lowerBound)!
      let endScalar = UnicodeScalar(codePointRange.upperBound - 1)!
      block(category, startScalar...endScalar, &stop)
    }
  }

  /// Enumerates the named Unicode scalars in the range `[start, end)`, calling
  /// a function for each one.
  ///
  /// Only *valid, defined* scalars are enumerated; unassigned code points and
  /// other non-valid scalars (such as surrogates) are skipped. The desired name
  /// type also affects the set of scalars that are enumerated; for example,
  /// control characters U+0000-U+001F will be enumerated if
  /// `nameType == .extended` but not if `nameType == .unicode`.
  ///
  /// - Parameters:
  ///   - start: The numeric value of the first code point to enumerate
  ///     (inclusive).
  ///   - end: The numeric value of the code point where enumeration should end
  ///     (exclusive).
  ///   - nameKind: The kind of name that should be passed to each call to the
  ///     block (which also, in some cases, controls the code points that are
  ///     enumerated).
  ///   - block: A block that will be called for each Unicode scalar that is
  ///     enumerate. It takes three arguments: a `UnicodeScalar`, a `String`
  ///     containing the name of the code point, and an `inout Bool` that should
  ///     be set to `true` to stop enumeration.
  public static func enumerateScalars(
    from start: Int,
    to end: Int,
    nameKind: Unicode.NameKind = .unicode,
    block: EnumerateScalarsCallback
  ) {
    withoutActuallyEscaping(block) { block in
      CInterop.withPointer(wrapping: block) { blockPointer in
        var error = UErrorCode()
        u_enumCharNames(
          Int32(truncatingIfNeeded: start),
          Int32(truncatingIfNeeded: end),
          enumerateScalarsCCallback,
          blockPointer,
          nameKind.cValue,
          &error
        )
      }
    }
  }
}

/// Function passed to ICU's `u_enumCharTypes` C function, which delegates to
/// the Swift block passed in via the `context` argument.
///
/// - Parameters:
///   - context: The Swift block to invoke, wrapped in an opaque pointer.
///   - start: The first code point in the range.
///   - limit: The code point after the last one in the range.
///   - type: The `UCharCategory` of the code points in the range.
/// - Returns: 0 if enumeration should be stopped, or 1 if it should continue.
private func enumerateCodePointRangesCCallback(
  context: UnsafeRawPointer?,
  start: UChar32,
  limit: UChar32,
  type: UCharCategory
) -> UBool {
  let category = Unicode.GeneralCategory(cValue: type)
  let block: UnicodeScalar.EnumerateCodePointRangesCallback =
    CInterop.unwrappedValue(from: context!)

  var stop = false
  block(category, Int(start)..<Int(limit), &stop)
  return stop ? 0 : 1
}

/// Function passed to ICU's `u_enumCharNames` C function, which delegates to
/// the Swift block passed in via the `context` argument.
///
/// - Parameters:
///   - context: The Swift block to invoke, wrapped in an opaque pointer.
///   - value: The integer value of the current code point in the enumeration.
///   - nameChoice: The `UCharNameChoice` value indicating which kind of name
///     was requested.
///   - buffer: A pointer to a null-terminated C string denoting the name of the
///     code point.
///   - length: The number of ASCII characters in `buffer`.
/// - Returns: 0 if enumeration should be stopped, or 1 if it should continue.
private func enumerateScalarsCCallback(
  context: UnsafeMutableRawPointer?,
  value: UChar32,
  nameChoice: UCharNameChoice,
  buffer: UnsafePointer<Int8>?,
  length: Int32
) -> UBool {
  let scalar = UnicodeScalar(uchar32Value: value)!
  let block: UnicodeScalar.EnumerateScalarsCallback =
    CInterop.unwrappedValue(from: context!)

  var stop = false
  block(scalar, String(cString: buffer!), &stop)
  return stop ? 0 : 1
}
