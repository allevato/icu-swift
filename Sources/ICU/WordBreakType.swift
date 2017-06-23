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

  /// Denotes the word break type property of a scalar.
  ///
  /// The values in this enum can be used in an algorithm as described by
  /// http://www.unicode.org/reports/tr29/ to determine word boundaries within
  /// text.
  public enum WordBreakType: ConvertibleFromUnicodeIntProperty {

    case other
    case aletter
    case format
    case katakana
    case midletter
    case midnum
    case numeric
    case extendnumlet
    case cr
    case extend
    case lf
    case midnumlet
    case newline
    case regionalIndicator
    case hebrewLetter
    case singleQuote
    case doubleQuote
    case eBase
    case eBaseGaz
    case eModifier
    case glueAfterZWJ
    case zwj

    /// The C API value of type `UWordBreakValues` that corresponds to the
    /// receiving enum case.
    var cValue: UWordBreakValues {
      switch self {
      case .other: return U_WB_OTHER
      case .aletter: return U_WB_ALETTER
      case .format: return U_WB_FORMAT
      case .katakana: return U_WB_KATAKANA
      case .midletter: return U_WB_MIDLETTER
      case .midnum: return U_WB_MIDNUM
      case .numeric: return U_WB_NUMERIC
      case .extendnumlet: return U_WB_EXTENDNUMLET
      case .cr: return U_WB_CR
      case .extend: return U_WB_EXTEND
      case .lf: return U_WB_LF
      case .midnumlet: return U_WB_MIDNUMLET
      case .newline: return U_WB_NEWLINE
      case .regionalIndicator: return U_WB_REGIONAL_INDICATOR
      case .hebrewLetter: return U_WB_HEBREW_LETTER
      case .singleQuote: return U_WB_SINGLE_QUOTE
      case .doubleQuote: return U_WB_DOUBLE_QUOTE
      case .eBase: return U_WB_E_BASE
      case .eBaseGaz: return U_WB_E_BASE_GAZ
      case .eModifier: return U_WB_E_MODIFIER
      case .glueAfterZWJ: return U_WB_GLUE_AFTER_ZWJ
      case .zwj: return U_WB_ZWJ
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UWordBreakValues) {
      switch cValue {
      case U_WB_OTHER: self = .other
      case U_WB_ALETTER: self = .aletter
      case U_WB_FORMAT: self = .format
      case U_WB_KATAKANA: self = .katakana
      case U_WB_MIDLETTER: self = .midletter
      case U_WB_MIDNUM: self = .midnum
      case U_WB_NUMERIC: self = .numeric
      case U_WB_EXTENDNUMLET: self = .extendnumlet
      case U_WB_CR: self = .cr
      case U_WB_EXTEND: self = .extend
      case U_WB_LF: self = .lf
      case U_WB_MIDNUMLET: self = .midnumlet
      case U_WB_NEWLINE: self = .newline
      case U_WB_REGIONAL_INDICATOR: self = .regionalIndicator
      case U_WB_HEBREW_LETTER: self = .hebrewLetter
      case U_WB_SINGLE_QUOTE: self = .singleQuote
      case U_WB_DOUBLE_QUOTE: self = .doubleQuote
      case U_WB_E_BASE: self = .eBase
      case U_WB_E_BASE_GAZ: self = .eBaseGaz
      case U_WB_E_MODIFIER: self = .eModifier
      case U_WB_GLUE_AFTER_ZWJ: self = .glueAfterZWJ
      case U_WB_ZWJ: self = .zwj
      default: fatalError("Invalid UWordBreakValues value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The word break type of the receiver.
  public var wordBreakType: Unicode.WordBreakType {
    return value(of: UCHAR_WORD_BREAK)
  }
}
