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

/// Implemented internally by Swift types that map to ICU C types representing
/// Unicode integer-vaued or enumerated properties to support a chain of uniform
/// conversions from raw integer values to ICU C types to native Swift types.
protocol ConvertibleFromUnicodeIntProperty {

  /// The ICU C type of the property.
  associatedtype CICUType: RawRepresentable

  /// Creates a new instance of the value by converting the given ICU C value.
  ///
  /// This initializer can "fail" and return nil for zero-values that should be
  /// represented as `Optional<Self>.none`.
  ///
  /// - Parameter cValue: The ICU C value to convert.
  init?(cValue: CICUType)
}

extension ConvertibleFromUnicodeIntProperty where CICUType.RawValue == Int32 {

  /// Creates a new instance of the value by converting the given `Int32` value.
  ///
  /// - Parameter unicodeIntPropertyValue: The integer value of the property.
  init?(unicodeIntPropertyValue: Int32) {
    guard let cValue = CICUType.init(rawValue: unicodeIntPropertyValue) else {
      fatalError("Unknown integer value \(unicodeIntPropertyValue) for " +
        "property \(CICUType.self)")
    }
    self.init(cValue: cValue)
  }
}

extension ConvertibleFromUnicodeIntProperty where CICUType.RawValue == UInt32 {

  /// Creates a new instance of the value by converting the given `UInt32`
  /// value.
  ///
  /// - Parameter unicodeIntPropertyValue: The integer value of the property.
  init?(unicodeIntPropertyValue: Int32) {
    let rawValue = UInt32(bitPattern: unicodeIntPropertyValue)
    guard let cValue = CICUType.init(rawValue: rawValue) else {
      fatalError("Unknown integer value \(unicodeIntPropertyValue) for " +
        "property \(CICUType.self)")
    }
    self.init(cValue: cValue)
  }
}
