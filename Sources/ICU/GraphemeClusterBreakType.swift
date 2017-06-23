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

  /// Denotes the grapheme cluster break type property of a scalar.
  ///
  /// The values in this enum can be used in an algorithm as described by
  /// http://www.unicode.org/reports/tr29/ to determine grapheme cluster
  /// boundaries within a sequence of scalars.
  public enum GraphemeClusterBreakType: ConvertibleFromUnicodeIntProperty {

    case other
    case control
    case cr
    case extend
    case l
    case lf
    case lv
    case lvt
    case t
    case v
    case spacingMark
    case prepend
    case regionalIndicator
    case eBase
    case eBaseGaz
    case eModifier
    case glueAfterZWJ
    case zwj

    /// The C API value of type `UGraphemeClusterBreak` that corresponds to the
    /// receiving enum case.
    var cValue: UGraphemeClusterBreak {
      switch self {
      case .other: return U_GCB_OTHER
      case .control: return U_GCB_CONTROL
      case .cr: return U_GCB_CR
      case .extend: return U_GCB_EXTEND
      case .l: return U_GCB_L
      case .lf: return U_GCB_LF
      case .lv: return U_GCB_LV
      case .lvt: return U_GCB_LVT
      case .t: return U_GCB_T
      case .v: return U_GCB_V
      case .spacingMark: return U_GCB_SPACING_MARK
      case .prepend: return U_GCB_PREPEND
      case .regionalIndicator: return U_GCB_REGIONAL_INDICATOR
      case .eBase: return U_GCB_E_BASE
      case .eBaseGaz: return U_GCB_E_BASE_GAZ
      case .eModifier: return U_GCB_E_MODIFIER
      case .glueAfterZWJ: return U_GCB_GLUE_AFTER_ZWJ
      case .zwj: return U_GCB_ZWJ
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UGraphemeClusterBreak) {
      switch cValue {
      case U_GCB_OTHER: self = .other
      case U_GCB_CONTROL: self = .control
      case U_GCB_CR: self = .cr
      case U_GCB_EXTEND: self = .extend
      case U_GCB_L: self = .l
      case U_GCB_LF: self = .lf
      case U_GCB_LV: self = .lv
      case U_GCB_LVT: self = .lvt
      case U_GCB_T: self = .t
      case U_GCB_V: self = .v
      case U_GCB_SPACING_MARK: self = .spacingMark
      case U_GCB_PREPEND: self = .prepend
      case U_GCB_REGIONAL_INDICATOR: self = .regionalIndicator
      case U_GCB_E_BASE: self = .eBase
      case U_GCB_E_BASE_GAZ: self = .eBaseGaz
      case U_GCB_E_MODIFIER: self = .eModifier
      case U_GCB_GLUE_AFTER_ZWJ: self = .glueAfterZWJ
      case U_GCB_ZWJ: self = .zwj
      default: fatalError("Invalid UGraphemeClusterBreak value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The grapheme cluster break property of the receiver.
  public var graphemeClusterBreakType: Unicode.GraphemeClusterBreakType {
    return value(of: UCHAR_GRAPHEME_CLUSTER_BREAK)
  }
}
