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

  /// Enumerated property `Bidi_Paired_Bracket_Type` (new in Unicode 6.3).
  ///
  /// Used in UAX #9: Unicode Bidirectional Algorithm
  /// <http://www.unicode.org/reports/tr9/>.
  public enum BidiPairedBracketType: ConvertibleFromUnicodeIntProperty {

    /// Open paired bracket.
    case open

    /// Closed paired bracket.
    case close

    /// The C API value of type `UBidiPairedBracketType` that corresponds to the
    /// receiving enum case.
    var cValue: UBidiPairedBracketType {
      switch self {
      case .open: return U_BPT_OPEN
      case .close: return U_BPT_CLOSE
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UBidiPairedBracketType) {
      switch cValue {
      case U_BPT_NONE: return nil
      case U_BPT_OPEN: self = .open
      case U_BPT_CLOSE: self = .close
      default: fatalError("Invalid UBidiPairedBracketType value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The bidirectional paired bracket type of the receiver.
  public var bidiPairedBracketType: Unicode.BidiPairedBracketType? {
    return value(of: UCHAR_BIDI_PAIRED_BRACKET_TYPE)
  }
}
