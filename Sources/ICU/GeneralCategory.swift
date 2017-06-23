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

  /// The general category types of Unicode scalars.
  public enum GeneralCategory: ConvertibleFromUnicodeIntProperty {

    /// An uppercase letter (abbreviated Lu).
    case uppercaseLetter

    /// A lowercase letter (abbreviated Ll).
    case lowercaseLetter

    /// A digraph character whose first part is uppercase (abbreviated Lt).
    case titlecaseLetter

    /// A modifier letter (abbreviated Lm).
    case modifierLetter

    /// Other letters, including syllables and ideographs (abbreviated Lo).
    case otherLetter

    /// A non-spacing combining mark with zero advance width (abbreviated Mn).
    case nonspacingMark

    /// A spacing combining mark with positive advance width (abbreviated Mc).
    case spacingMark

    /// An enclosing combining mark (abbreviated Me).
    case enclosingMark

    /// A decimal digit (abbreviated Nd).
    case decimalNumber

    /// A letter-like numeric character (abbreviated Nl).
    case letterNumber

    /// A numeric character of another type (abbreviated No).
    case otherNumber

    /// A connecting punctuation mark like a tie (abbreviated Pc).
    case connectorPunctuation

    /// A dash or hyphen punctuation mark (abbreviated Pd).
    case dashPunctuation

    /// An opening punctuation mark of a pair (abbreviated Ps).
    case openPunctuation

    /// A closing punctuation mark of a pair (abbreviated Pe).
    case closePunctuation

    /// An initial quotation mark (abbreviated Pi).
    case initialPunctuation

    /// A final quotation mark (abbreviated Pf).
    case finalPunctuation

    /// A punctuation mark of another type (abbreviated Po).
    case otherPunctuation

    /// A symbol of mathematical use (abbreviated Sm).
    case mathSymbol

    /// A currency sign (abbreviated Sc).
    case currencySymbol

    /// A non-letterlike modifier symbol (abbreviated Sk).
    case modifierSymbol

    /// A symbol of another type (abbreviated So).
    case otherSymbol

    /// A space character of non-zero width (abbreviated Zs).
    case spaceSeparator

    /// A line separator, which is specifically (and only) U+2028 LINE SEPARATOR
    /// (abbreviated Zl).
    case lineSeparator

    /// A paragraph separator, which is specifically (and only) U+2029 PARAGRAPH
    /// SEPARATOR (abbreviated Zp).
    case paragraphSeparator

    /// A C0 or C1 control code (abbreviated Cc).
    case control

    /// A format control character (abbreviated Cf).
    case format

    /// A surrogate code point (abbreviated Cs).
    case surrogate

    /// A private-use character (abbreviated Co).
    case privateUse

    /// A reserved unassigned code point or a non-character (abbreviated Cn).
    case unassigned

    /// Indicates whether the general category is in the grouping that
    /// represents a cased letter: Lu, Ll, and Lt.
    ///
    /// This grouping is abbreviated LC in the Unicode standard.
    var isCasedLetter: Bool {
      switch self {
      case .uppercaseLetter, .lowercaseLetter, .titlecaseLetter: return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents a letter: Lu, Ll, Lt, Lm, and Lo.
    ///
    /// This grouping is abbreviated L in the Unicode standard.
    var isLetter: Bool {
      switch self {
      case .uppercaseLetter,
           .lowercaseLetter,
           .titlecaseLetter,
           .modifierLetter,
           .otherLetter:
        return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents a mark: Mn, Mc, and Me.
    ///
    /// This grouping is abbreviated M in the Unicode standard.
    var isMark: Bool {
      switch self {
      case .nonspacingMark, .spacingMark, .enclosingMark: return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents a number: Nd, Nl, and No.
    ///
    /// This grouping is abbreviated N in the Unicode standard.
    var isNumber: Bool {
      switch self {
      case .decimalNumber, .letterNumber, .otherNumber: return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents punctuation: Pc, Pd, Ps, Pe, Pi, Pf, and Po.
    ///
    /// This grouping is abbreviated P in the Unicode standard.
    var isPunctuation: Bool {
      switch self {
      case .connectorPunctuation,
           .dashPunctuation,
           .openPunctuation,
           .closePunctuation,
           .initialPunctuation,
           .finalPunctuation,
           .otherPunctuation:
        return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents symbols: Sm, Sc, Sk, and So.
    ///
    /// This grouping is abbreviated S in the Unicode standard.
    var isSymbol: Bool {
      switch self {
      case .mathSymbol,
           .currencySymbol,
           .modifierSymbol,
           .otherSymbol:
        return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents separators: Zs, Zl, and Zp.
    ///
    /// This grouping is abbreviated Z in the Unicode standard.
    var isSeparator: Bool {
      switch self {
      case .spaceSeparator, .lineSeparator, .paragraphSeparator: return true
      default: return false
      }
    }

    /// Indicates whether the general category is in the grouping that
    /// represents control characters: Cc, Cf, Cs, Co, and Cn.
    ///
    /// This grouping is abbreviated C in the Unicode standard.
    var isControl: Bool {
      switch self {
      case .control,
           .format,
           .surrogate,
           .privateUse,
           .unassigned:
        return true
      default: return false
      }
    }

    /// Creates a new general category value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UCharCategory) {
      switch cValue {
      // UNASSIGNED and GENERAL_OTHER_TYPES have the same numeric value (zero)
      // so we can't actually distinguish them even though Swift imports them as
      // distinct values.
      case U_UNASSIGNED, U_GENERAL_OTHER_TYPES: return nil
      case U_UPPERCASE_LETTER: self = .uppercaseLetter
      case U_LOWERCASE_LETTER: self = .lowercaseLetter
      case U_TITLECASE_LETTER: self = .titlecaseLetter
      case U_MODIFIER_LETTER: self = .modifierLetter
      case U_OTHER_LETTER: self = .otherLetter
      case U_NON_SPACING_MARK: self = .nonspacingMark
      case U_ENCLOSING_MARK: self = .enclosingMark
      case U_COMBINING_SPACING_MARK: self = .spacingMark
      case U_DECIMAL_DIGIT_NUMBER: self = .decimalNumber
      case U_LETTER_NUMBER: self = .letterNumber
      case U_OTHER_NUMBER: self = .otherNumber
      case U_SPACE_SEPARATOR: self = .spaceSeparator
      case U_LINE_SEPARATOR: self = .lineSeparator
      case U_PARAGRAPH_SEPARATOR: self = .paragraphSeparator
      case U_CONTROL_CHAR: self = .control
      case U_FORMAT_CHAR: self = .format
      case U_PRIVATE_USE_CHAR: self = .privateUse
      case U_SURROGATE: self = .surrogate
      case U_DASH_PUNCTUATION: self = .dashPunctuation
      case U_START_PUNCTUATION: self = .openPunctuation
      case U_END_PUNCTUATION: self = .closePunctuation
      case U_CONNECTOR_PUNCTUATION: self = .connectorPunctuation
      case U_OTHER_PUNCTUATION: self = .otherPunctuation
      case U_MATH_SYMBOL: self = .mathSymbol
      case U_CURRENCY_SYMBOL: self = .currencySymbol
      case U_MODIFIER_SYMBOL: self = .modifierSymbol
      case U_OTHER_SYMBOL: self = .otherSymbol
      case U_INITIAL_PUNCTUATION: self = .initialPunctuation
      case U_FINAL_PUNCTUATION: self = .finalPunctuation
      default: fatalError("Invalid UCharCategory value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The Unicode general category of the receiving scalar.
  public var generalCategory: Unicode.GeneralCategory? {
    return value(of: UCHAR_GENERAL_CATEGORY)
  }
}
