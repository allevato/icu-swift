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

  /// The bidirectional class property of a scalar.
  public enum BidiClass: ConvertibleFromUnicodeIntProperty {

    /// Any strong left-to-right character (abbreviated L).
    case leftToRight

    /// Any strong right-to-left (non-Arabic-type) character (abbreviated R).
    case rightToLeft

    /// Any strong right-to-left (Arabic-type) character (abbreviated AL).
    case arabicLetter

    /// Any ASCII digit or Eastern Arabic-Indic digit (abbreviated EN).
    case europeanNumber

    /// A plus or minus sign (abbreviated ES).
    case europeanNumberSeparator

    /// A terminator found in a numeric format context, including currency signs
    /// (abbreviated ET).
    case europeanNumberTerminator

    /// Any Arabic-Indic digit (abbreviated AN).
    case arabicNumber

    /// A comma, colon, or slash (abbreviated CS).
    case commonNumberSeparator

    /// Any nonspacing mark (abbreviated NSM).
    case nonspacingMark

    /// Most format characters, control codes, or noncharacters (abbreviated
    /// BN).
    case boundaryNeutral

    /// Various newline characters (abbreviated B).
    case paragraphSeparator

    /// Various segment-related control codes (abbreviated S).
    case segmentSeparator

    /// A space (abbreviated WS).
    case whitespace

    /// Most other symbols and punctuation marks (abbreviated ON).
    case otherNeutral

    /// U+202A, the LR embedding control (abbreviated LRE).
    case leftToRightEmbedding

    /// U+202D, the LR override control (abbreviated LRO).
    case leftToRightOverride

    /// U+202B, the RL embedding control (abbreviated RLE).
    case rightToLeftEmbedding

    /// U+202E, the RL override control (abbreviated RLO).
    case rightToLeftOverride

    /// U+202C, which terminates an embedding or overriding control (abbreviated
    /// PDF).
    case popDirectionalFormat

    /// U+2066, the LR isolate control (abbreviated LRI).
    case leftToRightIsolate

    /// U+2067, the RL isolate control (abbreviated RLI).
    case rightToLeftIsolate

    /// U+2068, the first strong isolate control (abbreviated FSI).
    case firstStrongIsolate

    /// U+2069, which terminates an isolate control (abbreviated PSI).
    case popDirectionalIsolate

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UCharDirection) {
      switch cValue {
      case U_LEFT_TO_RIGHT: self = .leftToRight
      case U_RIGHT_TO_LEFT: self = .rightToLeft
      case U_EUROPEAN_NUMBER: self = .europeanNumber
      case U_EUROPEAN_NUMBER_SEPARATOR: self = .europeanNumberSeparator
      case U_EUROPEAN_NUMBER_TERMINATOR: self = .europeanNumberTerminator
      case U_ARABIC_NUMBER: self = .arabicNumber
      case U_COMMON_NUMBER_SEPARATOR: self = .commonNumberSeparator
      case U_BLOCK_SEPARATOR: self = .paragraphSeparator
      case U_SEGMENT_SEPARATOR: self = .segmentSeparator
      case U_WHITE_SPACE_NEUTRAL: self = .whitespace
      case U_OTHER_NEUTRAL: self = .otherNeutral
      case U_LEFT_TO_RIGHT_EMBEDDING: self = .leftToRightEmbedding
      case U_LEFT_TO_RIGHT_OVERRIDE: self = .leftToRightOverride
      case U_RIGHT_TO_LEFT_ARABIC: self = .arabicLetter
      case U_RIGHT_TO_LEFT_EMBEDDING: self = .rightToLeftEmbedding
      case U_RIGHT_TO_LEFT_OVERRIDE: self = .rightToLeftOverride
      case U_POP_DIRECTIONAL_FORMAT: self = .popDirectionalFormat
      case U_DIR_NON_SPACING_MARK: self = .nonspacingMark
      case U_BOUNDARY_NEUTRAL: self = .boundaryNeutral
      case U_FIRST_STRONG_ISOLATE: self = .firstStrongIsolate
      case U_LEFT_TO_RIGHT_ISOLATE: self = .leftToRightIsolate
      case U_RIGHT_TO_LEFT_ISOLATE: self = .rightToLeftIsolate
      case U_POP_DIRECTIONAL_ISOLATE: self = .popDirectionalIsolate
      default: fatalError("Invalid UCharDirection value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The bidirectional class of the receiver.
  public var bidiClass: Unicode.BidiClass {
    return value(of: UCHAR_BIDI_CLASS)
  }
}
