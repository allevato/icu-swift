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

  /// Denotes the sentence break type property of a scalar.
  ///
  /// The values in this enum can be used in an algorithm as described by
  /// http://www.unicode.org/reports/tr29/ to determine sentence boundaries
  /// within text.
  public enum SentenceBreakType: ConvertibleFromUnicodeIntProperty {

    case other
    case aterm
    case close
    case format
    case lower
    case numeric
    case oletter
    case sep
    case sp
    case sterm
    case upper
    case cr
    case extend
    case lf
    case scontinue

    /// The C API value of type `USentenceBreak` that corresponds to the
    /// receiving enum case.
    var cValue: USentenceBreak {
      switch self {
      case .other: return U_SB_OTHER
      case .aterm: return U_SB_ATERM
      case .close: return U_SB_CLOSE
      case .format: return U_SB_FORMAT
      case .lower: return U_SB_LOWER
      case .numeric: return U_SB_NUMERIC
      case .oletter: return U_SB_OLETTER
      case .sep: return U_SB_SEP
      case .sp: return U_SB_SP
      case .sterm: return U_SB_STERM
      case .upper: return U_SB_UPPER
      case .cr: return U_SB_CR
      case .extend: return U_SB_EXTEND
      case .lf: return U_SB_LF
      case .scontinue: return U_SB_SCONTINUE
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: USentenceBreak) {
      switch cValue {
      case U_SB_OTHER: self = .other
      case U_SB_ATERM: self = .aterm
      case U_SB_CLOSE: self = .close
      case U_SB_FORMAT: self = .format
      case U_SB_LOWER: self = .lower
      case U_SB_NUMERIC: self = .numeric
      case U_SB_OLETTER: self = .oletter
      case U_SB_SEP: self = .sep
      case U_SB_SP: self = .sp
      case U_SB_STERM: self = .sterm
      case U_SB_UPPER: self = .upper
      case U_SB_CR: self = .cr
      case U_SB_EXTEND: self = .extend
      case U_SB_LF: self = .lf
      case U_SB_SCONTINUE: self = .scontinue
      default: fatalError("Invalid USentenceBreak value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The sentence break type of the receiver.
  public var sentenceBreakType: Unicode.SentenceBreakType {
    return value(of: UCHAR_SENTENCE_BREAK)
  }
}
