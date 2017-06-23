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

  /// Enumerated property `Decomposition_Type`.
  ///
  /// If this value is anything other than `canonical`, then it represents a
  /// compatibility decomposition that indicates the type of information that
  /// would be lost if the character was converted to that decomposition.
  public enum DecompositionType: ConvertibleFromUnicodeIntProperty {

    /// A canonical decomposition, which is either a single Unicode scalar or
    /// two Unicode scalars where the first may itself recursively have a
    /// canonical decomposition.
    case canonical

    /// A compatibility decomposition that does not match one of the other
    /// categories.
    case compat

    /// A composite that is equivalent to its decomposition with a circle drawn
    /// around it.
    case circle

    /// Arabic final presentation form.
    case final

    /// A composite that is equal to its decomposition with additional font or
    /// styling information (such as a black-letter equivalent).
    case font

    /// Vulgar fractions.
    case fraction

    /// Arabic initial presentation form.
    case initial

    /// Arabic isolated presentation form.
    case isolated

    /// Arabic medial presentation form.
    case medial

    /// Half-width forms of Japanese characters used in abbreviations.
    case narrow

    /// A variant of a space or hyphen that prevents line breaks. (Equivalent to
    /// its decomposition preceded and followed by U+2060 WORD JOINER.)
    case noBreak

    /// Small variants of ASCII punctuation and symbols often used in Chinese
    /// text.
    case small

    /// A character that is equivalent to its decomposition but arranged in a
    /// square East Asian display cell.
    case square

    /// Equivalent to its decomposition but in subscript position.
    case sub

    /// Equivalent to its decomposition but in superscript position.
    case `super`

    /// Presentation forms for East Asian punctuation when rendered vertically.
    case vertical

    /// Full-width forms of Latin characters in East Asian text.
    case wide

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UDecompositionType) {
      switch cValue {
      case U_DT_NONE: return nil
      case U_DT_CANONICAL: self = .canonical
      case U_DT_COMPAT: self = .compat
      case U_DT_CIRCLE: self = .circle
      case U_DT_FINAL: self = .final
      case U_DT_FONT: self = .font
      case U_DT_FRACTION: self = .fraction
      case U_DT_INITIAL: self = .initial
      case U_DT_ISOLATED: self = .isolated
      case U_DT_MEDIAL: self = .medial
      case U_DT_NARROW: self = .narrow
      case U_DT_NOBREAK: self = .noBreak
      case U_DT_SMALL: self = .small
      case U_DT_SQUARE: self = .square
      case U_DT_SUB: self = .sub
      case U_DT_SUPER: self = .super
      case U_DT_VERTICAL: self = .vertical
      case U_DT_WIDE: self = .wide
      default: fatalError("Invalid UDecompositionType value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The decomposition type of the receiver.
  public var decompositionType: Unicode.DecompositionType? {
    return value(of: UCHAR_DECOMPOSITION_TYPE)
  }
}
