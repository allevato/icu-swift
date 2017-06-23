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

  /// Enumerated property `East_Asian_Width`.
  ///
  /// Described by [http://www.unicode.org/reports/tr11/](http://www.unicode.org/reports/tr11/).
  public enum EastAsianWidth: ConvertibleFromUnicodeIntProperty {

    /// Any character that does not appear in East Asian typography.
    case neutral

    /// A character that can be sometimes narrow or sometimes wide, requiring
    /// additional contextual information not in the character itself to determine
    /// the correct width.
    case ambiguous

    /// A character with a decomposition of type of `narrow` to other characters
    /// that are implicitly wide but unmarked, as well as U+20A9 WON SIGN.
    case halfWidth

    /// A character with a decomposition of type of `wide` to other characters
    /// that are implicitly narrow but unmarked.
    case fullWidth

    /// A character that is always narrow and has an explicit full-width or wide
    /// counterpart.
    case narrow

    /// A character that is always wide, occurring only in the context of East
    /// Asian typography. This also includes all characters that have explicit
    /// half-width counterparts and all characters with emoji presentation except
    /// for U+1F1E6...U+1F1FF (REGIONAL INDICATOR SYMBOL LETTER A...REGIONAL
    /// INDICATOR SYMBOL LETTER Z).
    case wide

    /// Creates a new East Asian width value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UEastAsianWidth) {
      switch cValue {
      case U_EA_NEUTRAL: self = .neutral
      case U_EA_AMBIGUOUS: self = .ambiguous
      case U_EA_HALFWIDTH: self = .halfWidth
      case U_EA_FULLWIDTH: self = .fullWidth
      case U_EA_NARROW: self = .narrow
      case U_EA_WIDE: self = .wide
      default: fatalError("Invalid UEastAsianWidth value: \(cValue)")
      }
    }

    /// The C API value of type `UEastAsianWidth` that corresponds to the
    /// receiving enum case.
    var cValue: UEastAsianWidth {
      switch self {
      case .neutral: return U_EA_NEUTRAL
      case .ambiguous: return U_EA_AMBIGUOUS
      case .halfWidth: return U_EA_HALFWIDTH
      case .fullWidth: return U_EA_FULLWIDTH
      case .narrow: return U_EA_NARROW
      case .wide: return U_EA_WIDE
      }
    }
  }
}

extension UnicodeScalar {

  /// The East Asian width property of the receiver.
  public var eastAsianWidth: Unicode.EastAsianWidth {
    return value(of: UCHAR_EAST_ASIAN_WIDTH)
  }
}
