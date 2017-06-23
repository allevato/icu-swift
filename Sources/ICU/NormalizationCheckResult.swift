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

  /// The result of any of the "quick check" properties that provide optimizations
  /// for implementations of Unicode normalization.
  public enum NormalizationCheckResult: ConvertibleFromUnicodeIntProperty {

    /// The scalar cannot ever occur in the checked normalization form.
    case no

    /// The scalar may occur in the checked normalization, depending on context.
    /// This result only occurs for NFC and NFKC checks, not for NFD and NFKD.
    case maybe

    /// Any other character not covered by the `no` or `maybe` cases.
    case yes

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UNormalizationCheckResult) {
      switch cValue {
      case UNORM_NO: self = .no
      case UNORM_MAYBE: self = .maybe
      case UNORM_YES: self = .yes
      default: fatalError("Invalid UNormalizationCheckResult value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// Indicates whether or not the receiving scalar can occur in NFD form.
  public var nfdQuickCheck: Unicode.NormalizationCheckResult {
    return value(of: UCHAR_NFD_QUICK_CHECK)
  }

  /// Indicates whether or not the receiving scalar can occur in NFKD form.
  public var nfkdQuickCheck: Unicode.NormalizationCheckResult {
    return value(of: UCHAR_NFKD_QUICK_CHECK)
  }

  /// Indicates whether or not the receiving scalar can occur in NFC form.
  public var nfcQuickCheck: Unicode.NormalizationCheckResult {
    return value(of: UCHAR_NFC_QUICK_CHECK)
  }

  /// Indicates whether or not the receiving scalar can occur in NFKC form.
  public var nfkcQuickCheck: Unicode.NormalizationCheckResult {
    return value(of: UCHAR_NFKC_QUICK_CHECK)
  }
}

