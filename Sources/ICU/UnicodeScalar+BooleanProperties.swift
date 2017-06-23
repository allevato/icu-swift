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

  /// Indicates whether the scalar is alphabetic.
  ///
  /// Corresponds to Unicode binary property `Alphabetic`.
  public var isAlphabetic: Bool {
    return value(of: UCHAR_ALPHABETIC)
  }

  /// Indicates whether the scalar is an ASCII code unit that can represent a
  /// hexadecimal digit; that is, 0-9, a-f, or A-F.
  ///
  /// Corresponds to Unicode binary property `ASCII_Hex_Digit`.
  public var isASCIIHexDigit: Bool {
    return value(of: UCHAR_ASCII_HEX_DIGIT)
  }

  /// Indicates whether the scalar is a formatting control for bidi algorithms.
  ///
  /// Corresponds to Unicode binary property `Bidi_Control`.
  public var isBidiControl: Bool {
    return value(of: UCHAR_BIDI_CONTROL)
  }

  /// Indicates whether the scalar may change appearance in RTL text.
  ///
  /// Corresponds to Unicode binary property `Bidi_Mirrored`.
  public var isBidiMirrored: Bool {
    return value(of: UCHAR_BIDI_MIRRORED)
  }

  /// Indicates whether the scalar is a variation of a dash.
  ///
  /// Corresponds to Unicode binary property `Dash`.
  public var isDash: Bool {
    return value(of: UCHAR_DASH)
  }

  /// Indicates whether the scalar can be ignored in most text processing.
  /// This covers the ranges 2060...206F + FFF0...FFFB + E0000...E0FFF +
  /// Other_Default_Ignorable_Code_Point + (Cf+Cc+Cs-White_Space).
  ///
  /// Corresponds to Unicode binary property `Default_Ignorable_Code_Point`.
  public var isDefaultIgnorableCodePoint: Bool {
    return value(of: UCHAR_DEFAULT_IGNORABLE_CODE_POINT)
  }

  /// Indicates whether the scalar is deprecated. The use of deprecated scalars
  /// is discouraged.
  ///
  /// Corresponds to Unicode binary property `Deprecated`.
  public var isDeprecated: Bool {
    return value(of: UCHAR_DEPRECATED)
  }

  /// Indicates whether the scalar is one that linguistically modifies the
  /// meaning of another scalar to which it applies.
  ///
  /// Corresponds to Unicode binary property `Diacritic`.
  public var isDiacritic: Bool {
    return value(of: UCHAR_DIACRITIC)
  }

  /// Indicates whether the scalar extends the value or shape of a preceding
  /// alphabetic scalar, such as a length or iteration mark.
  ///
  /// Corresponds to Unicode binary property `Extender`.
  public var isExtender: Bool {
    return value(of: UCHAR_EXTENDER)
  }

  /// Indicates whether the scalar is a composition exclusion, has a singleton
  /// decomposition, or has a non-starter decomposition.
  ///
  /// Corresponds to Unicode binary property `Full_Composition_Exclusion`.
  public var isFullCompositionExclusion: Bool {
    return value(of: UCHAR_FULL_COMPOSITION_EXCLUSION)
  }

  /// Indicates whether the scalar can be a grapheme cluster by itself or the
  /// base of a grapheme cluster that includes characters following it.
  ///
  /// Corresponds to Unicode binary property `Grapheme_Base`.
  public var isGraphemeBase: Bool {
    return value(of: UCHAR_GRAPHEME_BASE)
  }

  /// Indicates whether the scalar belongs to the same grapheme cluster as the
  /// scalar that precedes it.
  ///
  /// Corresponds to Unicode binary property `Grapheme_Extend`.
  public var isGraphemeExtend: Bool {
    return value(of: UCHAR_GRAPHEME_EXTEND)
  }

  /// Indicates whether the scalar causes the scalar preceding and following it
  /// to be part of the same grapheme cluster.
  ///
  /// Corresponds to Unicode binary property `Grapheme_Link`.
  public var isGraphemeLink: Bool {
    return value(of: UCHAR_GRAPHEME_LINK)
  }

  /// Indicates whether the scalar is a character commonly used for the
  /// representation of hexadecimal numbers, including their compatibility
  /// equivalents.
  ///
  /// Corresponds to Unicode binary property `Hex_Digit`.
  public var isHexDigit: Bool {
    return value(of: UCHAR_HEX_DIGIT)
  }

  /// Indicates whether the scalar is a dash used to mark connections between
  /// pieces of words, plus the katakana middle dot (which is shaped like a dot
  /// instead of a dash but functions as a hyphen).
  ///
  /// Corresponds to Unicode binary property `Hyphen`. It has been deprecated as
  /// of Unicode 6.0.0; use the `lineBreakType` property instead.
  public var isHyphen: Bool {
    return value(of: UCHAR_HYPHEN)
  }

  /// Indicates whether the scalar is a valid continuation scalar (that is, it
  /// can appear in non-initial positions) in a programming identifier.
  ///
  /// Corresponds to Unicode binary property `ID_Continue`.
  public var isIdentifierContinue: Bool {
    return value(of: UCHAR_ID_CONTINUE)
  }

  /// Indicates whether the scalar is a valid scalar for starting a programming
  /// identifier.
  ///
  /// Corresponds to Unicode binary property `ID_Start`.
  public var isIdentifierStart: Bool {
    return value(of: UCHAR_ID_START)
  }

  /// Indicates whether the scalar is considered to be CJKV (Chinese, Japanese,
  /// Korean, and Vietnamese) or other siniform (Chinese writing-related)
  /// ideographs.
  ///
  /// This property roughly defines the class of "Chinese characters" and does
  /// not include characters of other logographic scripts such as Cuneiform or
  /// Egyptian Hieroglyphs.
  ///
  /// Corresponds to Unicode binary property `Ideographic`.
  public var isIdeographic: Bool {
    return value(of: UCHAR_IDEOGRAPHIC)
  }

  /// Indicates whether the scalar is an ideographic description scalar that
  /// takes two operands.
  ///
  /// Corresponds to Unicode binary property `IDS_Binary_Operator`.
  public var isIdeographicDescriptionSequenceBinaryOperator: Bool {
    return value(of: UCHAR_IDS_BINARY_OPERATOR)
  }

  /// Indicates whether the scalar is an ideographic description scalar that
  /// takes three operands.
  ///
  /// Corresponds to Unicode binary property `IDS_Trinary_Operator`.
  public var isIdeographicDescriptionSequenceTrinaryOperator: Bool {
    return value(of: UCHAR_IDS_TRINARY_OPERATOR)
  }

  /// Indicates whether the scalar is an invisible formatting scalar that
  /// controls cursive joining and ligature formation.
  ///
  /// Corresponds to Unicode binary property `Join_Control`.
  public var isJoinControl: Bool {
    return value(of: UCHAR_JOIN_CONTROL)
  }

  /// Indicates whether the scalar requires special handling during searching
  /// and sorting. This applies to a small number of spacing vowel letters in
  /// certain Southeast Asian scripts such as Thai and Lao, which use a visual
  /// order display model; such letters are stored in text ahead of
  /// syllable-initial consonants.
  ///
  /// Corresponds to Unicode binary property `Logical_Order_Exception`.
  public var isLogicalOrderException: Bool {
    return value(of: UCHAR_LOGICAL_ORDER_EXCEPTION)
  }

  /// Indicates whether the scalar is lowercase.
  ///
  /// Corresponds to Unicode binary property `Lowercase`.
  public var isLowercase: Bool {
    return value(of: UCHAR_LOWERCASE)
  }

  /// Indicates whether the scalar is a mathematical character.
  ///
  /// Corresponds to Unicode binary property `Math`.
  public var isMath: Bool {
    return value(of: UCHAR_MATH)
  }

  /// Indicates whether the scalar is permanently reserved for internal use.
  ///
  /// Corresponds to Unicode binary property `Noncharacter_Code_Point`.
  public var isNoncharacterCodePoint: Bool {
    return value(of: UCHAR_NONCHARACTER_CODE_POINT)
  }

  /// Indicates whether the scalar is a punctuation character that functions as
  /// a quotation mark.
  ///
  /// Corresponds to Unicode binary property `Quotation_Mark`.
  public var isQuotationMark: Bool {
    return value(of: UCHAR_QUOTATION_MARK)
  }

  /// Indicates whether the scalar is a radical for the purposes of defining
  /// ideographic description sequences.
  ///
  /// Corresponds to Unicode binary property `Radical`.
  public var isRadical: Bool {
    return value(of: UCHAR_RADICAL)
  }

  /// Indicates whether the scalar has a "soft dot" that disappears when an
  /// accent mark is applied to it, such as "i" or "j".
  ///
  /// Corresponds to Unicode binary property `Soft_Dotted`.
  public var isSoftDotted: Bool {
    return value(of: UCHAR_SOFT_DOTTED)
  }

  /// Indicates whether the scalar is punctuation that generally marks the end
  /// of a textual unit.
  ///
  /// Corresponds to Unicode binary property `Terminal_Punctuation`.
  public var isTerminalPunctuation: Bool {
    return value(of: UCHAR_TERMINAL_PUNCTUATION)
  }

  /// Indicates whether the scalar is a unified CJK ideograph, meaning that it
  /// is not a compatibility ideograph or a scalar from the CJK Symbols and
  /// Punctuation block.
  ///
  /// Corresponds to Unicode binary property `Unified_Ideograph`.
  public var isUnifiedIdeograph: Bool {
    return value(of: UCHAR_UNIFIED_IDEOGRAPH)
  }

  /// Indicates whether the scalar is uppercase.
  ///
  /// Corresponds to Unicode binary property `Uppercase`.
  public var isUppercase: Bool {
    return value(of: UCHAR_UPPERCASE)
  }

  /// Indicates whether the scalar is a space, separator, or other control
  /// character that should be treated by programming languages as "whitespace"
  /// for the purpose of parsing elements.
  ///
  /// Corresponds to Unicode binary property `White_Space`.
  public var isWhitespace: Bool {
    return value(of: UCHAR_WHITE_SPACE)
  }

  /// Similar to `isIdentifierContinue`, but taking into consideration the
  /// ideosyncrasies of a small number of scalars when they are involved in
  /// NFKC folding.
  ///
  /// Corresponds to Unicode binary property `XID_Continue`.
  public var isXIdentifierContinue: Bool {
    return value(of: UCHAR_XID_CONTINUE)
  }

  /// Similar to `isIdentifierStart`, but taking into consideration the
  /// ideosyncrasies of a small number of scalars when they are involved in
  /// NFKC folding.
  ///
  /// Corresponds to Unicode binary property `XID_Start`.
  public var isXIdentifierStart: Bool {
    return value(of: UCHAR_XID_START)
  }

  /// Indicates whether the scalar is either the source of a case mapping or it
  /// is in the target of a case mapping.
  ///
  /// Corresponds to Unicode binary property `Case_Sensitive`.
  public var isCaseSensitive: Bool {
    return value(of: UCHAR_CASE_SENSITIVE)
  }

  /// Indicates whether the scalar is a punctuation character that generally
  /// marks the end of a sentence.
  ///
  /// Corresponds to Unicode binary property `Sentence_Terminal`.
  public var isSentenceTerminal: Bool {
    return value(of: UCHAR_S_TERM)
  }

  /// Indicates whether the scalar is a variation selector.
  ///
  /// Corresponds to Unicode binary property `Variation_Selector`.
  public var isVariationSelector: Bool {
    return value(of: UCHAR_VARIATION_SELECTOR)
  }

  /// An ICU-specific property that indicates whether the scalar is inert (that
  /// is, it does not interact with adjacent scalars) under NFD.
  public var isNFDInert: Bool {
    return value(of: UCHAR_NFD_INERT)
  }

  /// An ICU-specific property that indicates whether the scalar is inert (that
  /// is, it does not interact with adjacent scalars) under NFKD.
  public var isNFKDInert: Bool {
    return value(of: UCHAR_NFKD_INERT)
  }

  /// An ICU-specific property that indicates whether the scalar is inert (that
  /// is, it does not interact with adjacent scalars) under NFC.
  public var isNFCInert: Bool {
    return value(of: UCHAR_NFC_INERT)
  }

  /// An ICU-specific property that indicates whether the scalar is inert (that
  /// is, it does not interact with adjacent scalars) under NFKC.
  public var isNFKCInert: Bool {
    return value(of: UCHAR_NFKC_INERT)
  }

  /// An ICU-specific property that indicates that a scalar is a starter in
  /// terms of Unicode normalization and combining scalar sequences.
  ///
  /// Such scalars have a canonical combining class of zero and do not occur in
  /// non-initial position of the canonical decomposition of any character (like
  /// "ä" in NFD and a Jamo T in an `NFD(Hangul LVT))`.
  ///
  /// ICU uses this property for segmenting a string for generating a set of
  /// canonically equivalent strings; e.g., for canonical closure while
  /// processing collation tailoring rules.
  public var isSegmentStarter: Bool {
    return value(of: UCHAR_SEGMENT_STARTER)
  }

  /// Indicates whether the scalar is recommended to have syntactic meaning in a
  /// pattern (such as an expression) in a programming language parser.
  ///
  /// Corresponds to Unicode binary property `Pattern_Syntax`.
  public var isPatternSyntax: Bool {
    return value(of: UCHAR_PATTERN_SYNTAX)
  }

  /// Indicates whether the scalar is recommended to be treated as whitespace
  /// (separating tokens) in a pattern in a programming language parser.
  ///
  /// Corresponds to Unicode binary property `Pattern_White_Space`.
  public var isPatternWhitespace: Bool {
    return value(of: UCHAR_PATTERN_WHITE_SPACE)
  }

  /// Indicates whether the scalar is a member of the POSIX `alnum` character
  /// set.
  public var isPOSIXAlphanumeric: Bool {
    return value(of: UCHAR_POSIX_ALNUM)
  }

  /// Indicates whether the scalar is a member of the POSIX `blank` character
  /// set.
  public var isPOSIXBlank: Bool {
    return value(of: UCHAR_POSIX_BLANK)
  }

  /// Indicates whether the scalar is a member of the POSIX `graph` character
  /// set.
  public var isPOSIXGraphic: Bool {
    return value(of: UCHAR_POSIX_GRAPH)
  }

  /// Indicates whether the scalar is a member of the POSIX `print` character
  /// set.
  public var isPOSIXPrintable: Bool {
    return value(of: UCHAR_POSIX_PRINT)
  }

  /// Indicates whether the scalar is a member of the POSIX `xdigit` character
  /// set.
  public var isPOSIXHexDigit: Bool {
    return value(of: UCHAR_POSIX_XDIGIT)
  }

  /// Indicates whether the scalar is considered to be either an uppercase,
  /// lowercase, or titlecase character.
  ///
  /// Corresponds to Unicode binary property `Cased`.
  public var isCased: Bool {
    return value(of: UCHAR_CASED)
  }

  /// Indicates whether the scalar is ignored for casing purposes.
  ///
  /// Corresponds to Unicode binary property `Case_Ignorable`.
  public var isCaseIgnorable: Bool {
    return value(of: UCHAR_CASE_IGNORABLE)
  }

  /// Indicates whether the scalar's normalized form is not stable under a
  /// `lowercased` mapping.
  ///
  /// Corresponds to Unicode binary property `Changes_When_Lowercased`.
  public var changesWhenLowercased: Bool {
    return value(of: UCHAR_CHANGES_WHEN_LOWERCASED)
  }

  /// Indicates whether the scalar's normalized form is not stable under a
  /// `uppercased` mapping.
  ///
  /// Corresponds to Unicode binary property `Changes_When_Uppercased`.
  public var changesWhenUppercased: Bool {
    return value(of: UCHAR_CHANGES_WHEN_UPPERCASED)
  }

  /// Indicates whether the scalar's normalized form is not stable under a
  /// `titlecased` mapping.
  ///
  /// Corresponds to Unicode binary property `Changes_When_Titlecased`.
  public var changesWhenTitlecased: Bool {
    return value(of: UCHAR_CHANGES_WHEN_TITLECASED)
  }

  /// Indicates whether the scalar's normalized form is not stable under case
  /// folding.
  ///
  /// Corresponds to Unicode binary property `Changes_When_Casefolded`.
  public var changesWhenCaseFolded: Bool {
    return value(of: UCHAR_CHANGES_WHEN_CASEFOLDED)
  }

  /// Indicates whether the scalar may change when it undergoes case mapping.
  ///
  /// Corresponds to Unicode binary property `Changes_When_Casemapped`.
  public var changesWhenCaseMapped: Bool {
    return value(of: UCHAR_CHANGES_WHEN_CASEMAPPED)
  }

  /// Indicates whether the scalar is not identical to its `NKFC_Casefold`
  /// mapping.
  ///
  /// Corresponds to Unicode binary property `Changes_When_NFKC_Casefolded`.
  public var changesWhenNFKCCaseFolded: Bool {
    return value(of: UCHAR_CHANGES_WHEN_NFKC_CASEFOLDED)
  }

  /// Indicates whether the scalar is recommended to be used as emoji.
  ///
  /// Corresponds to Unicode binary property `Emoji`.
  public var isEmoji: Bool {
    return value(of: UCHAR_EMOJI)
  }

  /// Indicates whether the scalar is rendered by default using an emoji
  /// presentation rather than a text presentation.
  ///
  /// Corresponds to Unicode binary property `Emoji_Presentation`.
  public var isEmojiPresentation: Bool {
    return value(of: UCHAR_EMOJI_PRESENTATION)
  }

  /// Indicates whether the scalar can be used to modify the appearance of a
  /// preceding emoji, such as a skin tone modifier.
  ///
  /// Corresponds to Unicode binary property `Emoji_Modifier`.
  public var isEmojiModifier: Bool {
    return value(of: UCHAR_EMOJI_MODIFIER)
  }

  /// Indicates whether the scalar is one whose appearance can be modified by a
  /// subsequent emoji modifier.
  ///
  /// Corresponds to Unicode binary property `Emoji_Modifier_Base`.
  public var isEmojiModifierBase: Bool {
    return value(of: UCHAR_EMOJI_MODIFIER_BASE)
  }
}

