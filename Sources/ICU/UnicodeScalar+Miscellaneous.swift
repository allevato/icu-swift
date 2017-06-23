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

public extension UnicodeScalar {

  /// The canonical combining class of the receiving scalar.
  public var canonicalCombiningClass: Int {
    let cValue =
      u_getIntPropertyValue(uchar32Value, UCHAR_CANONICAL_COMBINING_CLASS)
    return Int(cValue)
  }

  /// An ICU-specific property denoting the canonical combining class of the
  /// first code point of the decomposition.
  ///
  /// In other words, `lccc(c) = ccc(NFD(c)[0])`. This is useful for checking
  /// for canonically ordered text.
  public var leadingCanonicalCombiningClass: Int {
    let cValue =
      u_getIntPropertyValue(uchar32Value, UCHAR_LEAD_CANONICAL_COMBINING_CLASS)
    return Int(cValue)
  }

  /// An ICU-specific property denoting the canonical combining class of the
  /// last code point of the decomposition.
  ///
  /// In other words, `tccc(c) = ccc(NFD(c)[last])`. This is useful for checking
  /// for canonically ordered text.
  public var trailingCanonicalCombiningClass: Int {
    let cValue =
      u_getIntPropertyValue(uchar32Value, UCHAR_TRAIL_CANONICAL_COMBINING_CLASS)
    return Int(cValue)
  }
}
