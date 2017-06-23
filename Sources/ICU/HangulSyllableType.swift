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

  /// Represents the Hangul syllable type of a scalar.
  public enum HangulSyllableType: ConvertibleFromUnicodeIntProperty {

    /// A leading consonant.
    case leadingJamo

    /// A vowel.
    case vowelJamo

    /// A trailing consonant.
    case trailingJamo

    /// A syllable composed of a leading consonant and a vowel.
    case lvSyllable

    /// A syllable composed of a leading consonant, a vowel, and a trailing
    /// consonant.
    case lvtSyllable

    /// The C API value of type `UHangulSyllableType` that corresponds to the
    /// receiving enum case.
    var cValue: UHangulSyllableType {
      switch self {
      case .leadingJamo: return U_HST_LEADING_JAMO
      case .vowelJamo: return U_HST_VOWEL_JAMO
      case .trailingJamo: return U_HST_TRAILING_JAMO
      case .lvSyllable: return U_HST_LV_SYLLABLE
      case .lvtSyllable: return U_HST_LVT_SYLLABLE
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UHangulSyllableType) {
      switch cValue {
      case U_HST_NOT_APPLICABLE: return nil
      case U_HST_LEADING_JAMO: self = .leadingJamo
      case U_HST_VOWEL_JAMO: self = .vowelJamo
      case U_HST_TRAILING_JAMO: self = .trailingJamo
      case U_HST_LV_SYLLABLE: self = .lvSyllable
      case U_HST_LVT_SYLLABLE: self = .lvtSyllable
      default: fatalError("Invalid UHangulSyllableType value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The Hangul syllable type of the receiver.
  public var hangulSyllableType: Unicode.HangulSyllableType? {
    return value(of: UCHAR_HANGUL_SYLLABLE_TYPE)
  }
}
