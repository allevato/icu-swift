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

  /// Denotes the line break type property of a scalar.
  ///
  /// The values in this enum can be used in an algorithm as described by
  /// http://www.unicode.org/reports/tr14/ to determine line boundaries within
  /// text.
  public enum LineBreakType: ConvertibleFromUnicodeIntProperty {

    case unknown
    case ambiguous
    case alphabetic
    case breakBoth
    case breakAfter
    case breakBefore
    case mandatoryBreak
    case contingentBreak
    case closePunctuation
    case combiningMark
    case carriageReturn
    case exclamation
    case glue
    case hyphen
    case ideographic
    case inseparable
    case inseperable
    case infixNumeric
    case lineFeed
    case nonstarter
    case numeric
    case openPunctuation
    case postfixNumeric
    case prefixNumeric
    case quotation
    case complexContext
    case surrogate
    case space
    case breakSymbols
    case zwspace
    case nextLine
    case wordJoiner
    case h2
    case h3
    case jl
    case jt
    case jv
    case closeParenthesis
    case conditionalJapaneseStarter
    case hebrewLetter
    case regionalIndicator
    case eBase
    case eModifier
    case zwj

    /// The C API value of type `ULineBreak` that corresponds to the
    /// receiving enum case.
    var cValue: ULineBreak {
      switch self {
      case .unknown: return U_LB_UNKNOWN
      case .ambiguous: return U_LB_AMBIGUOUS
      case .alphabetic: return U_LB_ALPHABETIC
      case .breakBoth: return U_LB_BREAK_BOTH
      case .breakAfter: return U_LB_BREAK_AFTER
      case .breakBefore: return U_LB_BREAK_BEFORE
      case .mandatoryBreak: return U_LB_MANDATORY_BREAK
      case .contingentBreak: return U_LB_CONTINGENT_BREAK
      case .closePunctuation: return U_LB_CLOSE_PUNCTUATION
      case .combiningMark: return U_LB_COMBINING_MARK
      case .carriageReturn: return U_LB_CARRIAGE_RETURN
      case .exclamation: return U_LB_EXCLAMATION
      case .glue: return U_LB_GLUE
      case .hyphen: return U_LB_HYPHEN
      case .ideographic: return U_LB_IDEOGRAPHIC
      case .inseparable: return U_LB_INSEPARABLE
      case .inseperable: return U_LB_INSEPERABLE
      case .infixNumeric: return U_LB_INFIX_NUMERIC
      case .lineFeed: return U_LB_LINE_FEED
      case .nonstarter: return U_LB_NONSTARTER
      case .numeric: return U_LB_NUMERIC
      case .openPunctuation: return U_LB_OPEN_PUNCTUATION
      case .postfixNumeric: return U_LB_POSTFIX_NUMERIC
      case .prefixNumeric: return U_LB_PREFIX_NUMERIC
      case .quotation: return U_LB_QUOTATION
      case .complexContext: return U_LB_COMPLEX_CONTEXT
      case .surrogate: return U_LB_SURROGATE
      case .space: return U_LB_SPACE
      case .breakSymbols: return U_LB_BREAK_SYMBOLS
      case .zwspace: return U_LB_ZWSPACE
      case .nextLine: return U_LB_NEXT_LINE
      case .wordJoiner: return U_LB_WORD_JOINER
      case .h2: return U_LB_H2
      case .h3: return U_LB_H3
      case .jl: return U_LB_JL
      case .jt: return U_LB_JT
      case .jv: return U_LB_JV
      case .closeParenthesis: return U_LB_CLOSE_PARENTHESIS
      case .conditionalJapaneseStarter: return U_LB_CONDITIONAL_JAPANESE_STARTER
      case .hebrewLetter: return U_LB_HEBREW_LETTER
      case .regionalIndicator: return U_LB_REGIONAL_INDICATOR
      case .eBase: return U_LB_E_BASE
      case .eModifier: return U_LB_E_MODIFIER
      case .zwj: return U_LB_ZWJ
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: ULineBreak) {
      switch cValue {
      case U_LB_UNKNOWN: self = .unknown
      case U_LB_AMBIGUOUS: self = .ambiguous
      case U_LB_ALPHABETIC: self = .alphabetic
      case U_LB_BREAK_BOTH: self = .breakBoth
      case U_LB_BREAK_AFTER: self = .breakAfter
      case U_LB_BREAK_BEFORE: self = .breakBefore
      case U_LB_MANDATORY_BREAK: self = .mandatoryBreak
      case U_LB_CONTINGENT_BREAK: self = .contingentBreak
      case U_LB_CLOSE_PUNCTUATION: self = .closePunctuation
      case U_LB_COMBINING_MARK: self = .combiningMark
      case U_LB_CARRIAGE_RETURN: self = .carriageReturn
      case U_LB_EXCLAMATION: self = .exclamation
      case U_LB_GLUE: self = .glue
      case U_LB_HYPHEN: self = .hyphen
      case U_LB_IDEOGRAPHIC: self = .ideographic
      case U_LB_INSEPARABLE: self = .inseparable
      case U_LB_INSEPERABLE: self = .inseperable
      case U_LB_INFIX_NUMERIC: self = .infixNumeric
      case U_LB_LINE_FEED: self = .lineFeed
      case U_LB_NONSTARTER: self = .nonstarter
      case U_LB_NUMERIC: self = .numeric
      case U_LB_OPEN_PUNCTUATION: self = .openPunctuation
      case U_LB_POSTFIX_NUMERIC: self = .postfixNumeric
      case U_LB_PREFIX_NUMERIC: self = .prefixNumeric
      case U_LB_QUOTATION: self = .quotation
      case U_LB_COMPLEX_CONTEXT: self = .complexContext
      case U_LB_SURROGATE: self = .surrogate
      case U_LB_SPACE: self = .space
      case U_LB_BREAK_SYMBOLS: self = .breakSymbols
      case U_LB_ZWSPACE: self = .zwspace
      case U_LB_NEXT_LINE: self = .nextLine
      case U_LB_WORD_JOINER: self = .wordJoiner
      case U_LB_H2: self = .h2
      case U_LB_H3: self = .h3
      case U_LB_JL: self = .jl
      case U_LB_JT: self = .jt
      case U_LB_JV: self = .jv
      case U_LB_CLOSE_PARENTHESIS: self = .closeParenthesis
      case U_LB_CONDITIONAL_JAPANESE_STARTER: self = .conditionalJapaneseStarter
      case U_LB_HEBREW_LETTER: self = .hebrewLetter
      case U_LB_REGIONAL_INDICATOR: self = .regionalIndicator
      case U_LB_E_BASE: self = .eBase
      case U_LB_E_MODIFIER: self = .eModifier
      case U_LB_ZWJ: self = .zwj
      default: fatalError("Invalid ULineBreak value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The line break type of the receiver.
  public var lineBreakType: Unicode.LineBreakType {
    return value(of: UCHAR_LINE_BREAK)
  }
}
