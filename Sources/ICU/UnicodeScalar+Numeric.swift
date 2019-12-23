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

  /// Returns the decimal digit value of the receiving scalar in the given
  /// radix.
  ///
  /// - Precondition: `radix` must be between 2 and 36 (inclusive).
  ///
  /// - Parameter radix: The radix, between 2 and 36.
  /// - Returns: The decimal digit value of the scalar, or nil if it was not a
  ///   numeric scalar.
  public func digitValue(withRadix radix: Int = 10) -> Int? {
    precondition((2...36).contains(radix), "Radix must be between 2 and 36")
    let result = u_digit(uchar32Value, Int8(truncatingIfNeeded: radix))
    return result != -1 ? Int(result) : nil
  }
}
