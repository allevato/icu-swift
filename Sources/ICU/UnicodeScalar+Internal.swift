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

extension UnicodeScalar {

  /// Creates a new Unicode scalar with the given `UChar32` value obtained from
  /// one of the ICU C APIs.
  ///
  /// - Parameter uchar32Value: A `UChar32` value representing the numeric code
  ///   point.
  internal init?(uchar32Value: UChar32) {
    self.init(UInt32(bitPattern: uchar32Value))
  }

  /// Helper property to return the raw value as a `UChar32` that can be easily
  /// consumed by ICU's C APIs.
  internal var uchar32Value: UChar32 {
    return Int32(bitPattern: value)
  }
  
  /// Returns the value of a Boolean Unicode property.
  ///
  /// - Parameter property: The C value representing the property to return.
  /// - Returns: The value of the property (true or false).
  internal func value(of property: UProperty) -> Bool {
    return u_hasBinaryProperty(uchar32Value, property) != 0
  }
  
  /// Returns the value of a Unicode property by converting it from its raw
  /// `Int32` value.
  ///
  /// This version of `value(of:)` supports properties with failable
  /// initializers, which return nil for "none-like" values.
  ///
  /// - Parameter property: The C value representing the property to return.
  /// - Returns: The value of the property, which is a type that conforms to
  ///   `ConvertibleFromUnicodeIntProperty` such that it can be initialized
  ///   using the underlying integer value.
  internal func value<
    Result: ConvertibleFromUnicodeIntProperty
  >(
    of property: UProperty
  ) -> Result? where Result.CICUType.RawValue == Int32 {
    let propertyValue = u_getIntPropertyValue(uchar32Value, property)
    return Result.init(unicodeIntPropertyValue: propertyValue)
  }
  
  /// Returns the value of a Unicode property by converting it from its raw
  /// `Int32` value.
  ///
  /// This version of `value(of:)` supports properties with non-failable
  /// initializers.
  ///
  /// - Parameter property: The C value representing the property to return.
  /// - Returns: The value of the property, which is a type that conforms to
  ///   `ConvertibleFromUnicodeIntProperty` such that it can be initialized
  ///   using the underlying integer value.
  internal func value<
    Result: ConvertibleFromUnicodeIntProperty
  >(
    of property: UProperty
  ) -> Result where Result.CICUType.RawValue == Int32 {
    guard let result: Result = value(of: property) else {
      fatalError("Unexpectedly got nil; did you mean to use the optional " +
        "form of value(of:)?")
    }
    return result
  }
  
  /// Returns the value of a Unicode property by converting it from its raw
  /// `UInt32` value.
  ///
  /// This version of `value(of:)` supports properties with non-failable
  /// initializers.
  ///
  /// - Parameter property: The C value representing the property to return.
  /// - Returns: The value of the property, which is a type that conforms to
  ///   `ConvertibleFromUnicodeIntProperty` such that it can be initialized
  ///   using the underlying integer value.
  internal func value<
    Result: ConvertibleFromUnicodeIntProperty
  >(
    of property: UProperty
  ) -> Result? where Result.CICUType.RawValue == UInt32 {
    let propertyValue = u_getIntPropertyValue(uchar32Value, property)
    return Result.init(unicodeIntPropertyValue: propertyValue)
  }

  /// Returns the value of a Unicode property by converting it from its raw
  /// `UInt32` value.
  ///
  /// This version of `value(of:)` supports properties with non-failable
  /// initializers.
  ///
  /// - Parameter property: The C value representing the property to return.
  /// - Returns: The value of the property, which is a type that conforms to
  ///   `ConvertibleFromUnicodeIntProperty` such that it can be initialized
  ///   using the underlying integer value.
  internal func value<
    Result: ConvertibleFromUnicodeIntProperty
  >(
    of property: UProperty
  ) -> Result where Result.CICUType.RawValue == UInt32 {
    guard let result: Result = value(of: property) else {
      fatalError("Unexpectedly got nil; did you mean to use the optional " +
        "form of value(of:)?")
    }
    return result
  }
}
