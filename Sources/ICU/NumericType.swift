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

extension Unicode {

  /// Denotes the numeric type and value of a scalar, if it has one.
  public enum NumericValue {

    /// Used for scalars whose numeric values are represented with an integer
    /// value in range `0...9`. Such scalars are restricted to digits that can be
    /// used in a decimal radix positional number system and which are encoded in
    /// a contiguous ascending range.
    case decimal(Int)

    /// Used for scalars whose numeric values are represented with an integer
    /// value in the range `0...9`. Unlike `decimal`, this case covers digits that
    /// need special handling, such as compatibility superscripts.
    ///
    /// Starting with Unicode 6.3.0, no newly encoded numeric characters will be
    /// given type `digit` nor will any existing characters with type `numeric` be
    /// changed to `digit`. As such, the distinction between those two types is
    /// not considered useful.
    case digit(Int)

    /// Used for scalars whose numeric values are represented with a positive or
    /// negative integer or rational number, such as "1/5" for U+2155 VULGAR
    /// FRACTION ONE FIFTH.
    case numeric(Double)
  }
}

extension UnicodeScalar {

  /// The numeric value of the receiving scalar, if it has one.
  public var numericValue: Unicode.NumericValue? {
    let cValue = UNumericType(
      UInt32(bitPattern: u_getIntPropertyValue(
        uchar32Value, UCHAR_NUMERIC_TYPE)))
    let numericValue = u_getNumericValue(uchar32Value)

    switch cValue {
    case U_NT_NONE: return nil
    case U_NT_DECIMAL: return .decimal(Int(numericValue))
    case U_NT_DIGIT: return .digit(Int(numericValue))
    case U_NT_NUMERIC: return .numeric(numericValue)
    default: fatalError("Invalid UNumericType value: \(cValue)")
    }
  }
}
