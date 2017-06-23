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

  /// A contiguous range of scalars that is uniquely named and does not overlap
  /// with any other block.
  public enum Block: ConvertibleFromUnicodeIntProperty {

    case basicLatin
    case latin1Supplement
    case latinExtendedA
    case latinExtendedB
    case ipaExtensions
    case spacingModifierLetters
    case combiningDiacriticalMarks
    case greek
    case cyrillic
    case armenian
    case hebrew
    case arabic
    case syriac
    case thaana
    case devanagari
    case bengali
    case gurmukhi
    case gujarati
    case oriya
    case tamil
    case telugu
    case kannada
    case malayalam
    case sinhala
    case thai
    case lao
    case tibetan
    case myanmar
    case georgian
    case hangulJamo
    case ethiopic
    case cherokee
    case unifiedCanadianAboriginalSyllabics
    case ogham
    case runic
    case khmer
    case mongolian
    case latinExtendedAdditional
    case greekExtended
    case generalPunctuation
    case superscriptsAndSubscripts
    case currencySymbols
    case combiningMarksForSymbols
    case letterlikeSymbols
    case numberForms
    case arrows
    case mathematicalOperators
    case miscellaneousTechnical
    case controlPictures
    case opticalCharacterRecognition
    case enclosedAlphanumerics
    case boxDrawing
    case blockElements
    case geometricShapes
    case miscellaneousSymbols
    case dingbats
    case braillePatterns
    case cjkRadicalsSupplement
    case kangxiRadicals
    case ideographicDescriptionCharacters
    case cjkSymbolsAndPunctuation
    case hiragana
    case katakana
    case bopomofo
    case hangulCompatibilityJamo
    case kanbun
    case bopomofoExtended
    case enclosedCjkLettersAndMonths
    case cjkCompatibility
    case cjkUnifiedIdeographsExtensionA
    case cjkUnifiedIdeographs
    case yiSyllables
    case yiRadicals
    case hangulSyllables
    case highSurrogates
    case highPrivateUseSurrogates
    case lowSurrogates
    case privateUseArea
    case privateUse
    case cjkCompatibilityIdeographs
    case alphabeticPresentationForms
    case arabicPresentationFormsA
    case combiningHalfMarks
    case cjkCompatibilityForms
    case smallFormVariants
    case arabicPresentationFormsB
    case specials
    case halfwidthAndFullwidthForms
    case oldItalic
    case gothic
    case deseret
    case byzantineMusicalSymbols
    case musicalSymbols
    case mathematicalAlphanumericSymbols
    case cjkUnifiedIdeographsExtensionB
    case cjkCompatibilityIdeographsSupplement
    case tags
    case cyrillicSupplement
    case cyrillicSupplementary
    case tagalog
    case hanunoo
    case buhid
    case tagbanwa
    case miscellaneousMathematicalSymbolsA
    case supplementalArrowsA
    case supplementalArrowsB
    case miscellaneousMathematicalSymbolsB
    case supplementalMathematicalOperators
    case katakanaPhoneticExtensions
    case variationSelectors
    case supplementaryPrivateUseAreaA
    case supplementaryPrivateUseAreaB
    case limbu
    case taiLe
    case khmerSymbols
    case phoneticExtensions
    case miscellaneousSymbolsAndArrows
    case yijingHexagramSymbols
    case linearBSyllabary
    case linearBIdeograms
    case aegeanNumbers
    case ugaritic
    case shavian
    case osmanya
    case cypriotSyllabary
    case taiXuanJingSymbols
    case variationSelectorsSupplement
    case ancientGreekMusicalNotation
    case ancientGreekNumbers
    case arabicSupplement
    case buginese
    case cjkStrokes
    case combiningDiacriticalMarksSupplement
    case coptic
    case ethiopicExtended
    case ethiopicSupplement
    case georgianSupplement
    case glagolitic
    case kharoshthi
    case modifierToneLetters
    case newTaiLue
    case oldPersian
    case phoneticExtensionsSupplement
    case supplementalPunctuation
    case sylotiNagri
    case tifinagh
    case verticalForms
    case nko
    case balinese
    case latinExtendedC
    case latinExtendedD
    case phagsPa
    case phoenician
    case cuneiform
    case cuneiformNumbersAndPunctuation
    case countingRodNumerals
    case sundanese
    case lepcha
    case olChiki
    case cyrillicExtendedA
    case vai
    case cyrillicExtendedB
    case saurashtra
    case kayahLi
    case rejang
    case cham
    case ancientSymbols
    case phaistosDisc
    case lycian
    case carian
    case lydian
    case mahjongTiles
    case dominoTiles
    case samaritan
    case unifiedCanadianAboriginalSyllabicsExtended
    case taiTham
    case vedicExtensions
    case lisu
    case bamum
    case commonIndicNumberForms
    case devanagariExtended
    case hangulJamoExtendedA
    case javanese
    case myanmarExtendedA
    case taiViet
    case meeteiMayek
    case hangulJamoExtendedB
    case imperialAramaic
    case oldSouthArabian
    case avestan
    case inscriptionalParthian
    case inscriptionalPahlavi
    case oldTurkic
    case rumiNumeralSymbols
    case kaithi
    case egyptianHieroglyphs
    case enclosedAlphanumericSupplement
    case enclosedIdeographicSupplement
    case cjkUnifiedIdeographsExtensionC
    case mandaic
    case batak
    case ethiopicExtendedA
    case brahmi
    case bamumSupplement
    case kanaSupplement
    case playingCards
    case miscellaneousSymbolsAndPictographs
    case emoticons
    case transportAndMapSymbols
    case alchemicalSymbols
    case cjkUnifiedIdeographsExtensionD
    case arabicExtendedA
    case arabicMathematicalAlphabeticSymbols
    case chakma
    case meeteiMayekExtensions
    case meroiticCursive
    case meroiticHieroglyphs
    case miao
    case sharada
    case soraSompeng
    case sundaneseSupplement
    case takri
    case bassaVah
    case caucasianAlbanian
    case copticEpactNumbers
    case combiningDiacriticalMarksExtended
    case duployan
    case elbasan
    case geometricShapesExtended
    case grantha
    case khojki
    case khudawadi
    case latinExtendedE
    case linearA
    case mahajani
    case manichaean
    case mendeKikakui
    case modi
    case mro
    case myanmarExtendedB
    case nabataean
    case oldNorthArabian
    case oldPermic
    case ornamentalDingbats
    case pahawhHmong
    case palmyrene
    case pauCinHau
    case psalterPahlavi
    case shorthandFormatControls
    case siddham
    case sinhalaArchaicNumbers
    case supplementalArrowsC
    case tirhuta
    case warangCiti
    case ahom
    case anatolianHieroglyphs
    case cherokeeSupplement
    case cjkUnifiedIdeographsExtensionE
    case earlyDynasticCuneiform
    case hatran
    case multani
    case oldHungarian
    case supplementalSymbolsAndPictographs
    case suttonSignwriting
    case adlam
    case bhaiksuki
    case cyrillicExtendedC
    case glagoliticSupplement
    case ideographicSymbolsAndPunctuation
    case marchen
    case mongolianSupplement
    case newa
    case osage
    case tangut
    case tangutComponents

    /// The C ICU value that corresponds to the receiving block.
    var cValue: UBlockCode {
      switch self {
      case .basicLatin: return UBLOCK_BASIC_LATIN
      case .latin1Supplement: return UBLOCK_LATIN_1_SUPPLEMENT
      case .latinExtendedA: return UBLOCK_LATIN_EXTENDED_A
      case .latinExtendedB: return UBLOCK_LATIN_EXTENDED_B
      case .ipaExtensions: return UBLOCK_IPA_EXTENSIONS
      case .spacingModifierLetters: return UBLOCK_SPACING_MODIFIER_LETTERS
      case .combiningDiacriticalMarks: return UBLOCK_COMBINING_DIACRITICAL_MARKS
      case .greek: return UBLOCK_GREEK
      case .cyrillic: return UBLOCK_CYRILLIC
      case .armenian: return UBLOCK_ARMENIAN
      case .hebrew: return UBLOCK_HEBREW
      case .arabic: return UBLOCK_ARABIC
      case .syriac: return UBLOCK_SYRIAC
      case .thaana: return UBLOCK_THAANA
      case .devanagari: return UBLOCK_DEVANAGARI
      case .bengali: return UBLOCK_BENGALI
      case .gurmukhi: return UBLOCK_GURMUKHI
      case .gujarati: return UBLOCK_GUJARATI
      case .oriya: return UBLOCK_ORIYA
      case .tamil: return UBLOCK_TAMIL
      case .telugu: return UBLOCK_TELUGU
      case .kannada: return UBLOCK_KANNADA
      case .malayalam: return UBLOCK_MALAYALAM
      case .sinhala: return UBLOCK_SINHALA
      case .thai: return UBLOCK_THAI
      case .lao: return UBLOCK_LAO
      case .tibetan: return UBLOCK_TIBETAN
      case .myanmar: return UBLOCK_MYANMAR
      case .georgian: return UBLOCK_GEORGIAN
      case .hangulJamo: return UBLOCK_HANGUL_JAMO
      case .ethiopic: return UBLOCK_ETHIOPIC
      case .cherokee: return UBLOCK_CHEROKEE
      case .unifiedCanadianAboriginalSyllabics:
        return UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS
      case .ogham: return UBLOCK_OGHAM
      case .runic: return UBLOCK_RUNIC
      case .khmer: return UBLOCK_KHMER
      case .mongolian: return UBLOCK_MONGOLIAN
      case .latinExtendedAdditional: return UBLOCK_LATIN_EXTENDED_ADDITIONAL
      case .greekExtended: return UBLOCK_GREEK_EXTENDED
      case .generalPunctuation: return UBLOCK_GENERAL_PUNCTUATION
      case .superscriptsAndSubscripts: return UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS
      case .currencySymbols: return UBLOCK_CURRENCY_SYMBOLS
      case .combiningMarksForSymbols: return UBLOCK_COMBINING_MARKS_FOR_SYMBOLS
      case .letterlikeSymbols: return UBLOCK_LETTERLIKE_SYMBOLS
      case .numberForms: return UBLOCK_NUMBER_FORMS
      case .arrows: return UBLOCK_ARROWS
      case .mathematicalOperators: return UBLOCK_MATHEMATICAL_OPERATORS
      case .miscellaneousTechnical: return UBLOCK_MISCELLANEOUS_TECHNICAL
      case .controlPictures: return UBLOCK_CONTROL_PICTURES
      case .opticalCharacterRecognition:
        return UBLOCK_OPTICAL_CHARACTER_RECOGNITION
      case .enclosedAlphanumerics: return UBLOCK_ENCLOSED_ALPHANUMERICS
      case .boxDrawing: return UBLOCK_BOX_DRAWING
      case .blockElements: return UBLOCK_BLOCK_ELEMENTS
      case .geometricShapes: return UBLOCK_GEOMETRIC_SHAPES
      case .miscellaneousSymbols: return UBLOCK_MISCELLANEOUS_SYMBOLS
      case .dingbats: return UBLOCK_DINGBATS
      case .braillePatterns: return UBLOCK_BRAILLE_PATTERNS
      case .cjkRadicalsSupplement: return UBLOCK_CJK_RADICALS_SUPPLEMENT
      case .kangxiRadicals: return UBLOCK_KANGXI_RADICALS
      case .ideographicDescriptionCharacters:
        return UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS
      case .cjkSymbolsAndPunctuation: return UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION
      case .hiragana: return UBLOCK_HIRAGANA
      case .katakana: return UBLOCK_KATAKANA
      case .bopomofo: return UBLOCK_BOPOMOFO
      case .hangulCompatibilityJamo: return UBLOCK_HANGUL_COMPATIBILITY_JAMO
      case .kanbun: return UBLOCK_KANBUN
      case .bopomofoExtended: return UBLOCK_BOPOMOFO_EXTENDED
      case .enclosedCjkLettersAndMonths:
        return UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS
      case .cjkCompatibility: return UBLOCK_CJK_COMPATIBILITY
      case .cjkUnifiedIdeographsExtensionA:
        return UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
      case .cjkUnifiedIdeographs: return UBLOCK_CJK_UNIFIED_IDEOGRAPHS
      case .yiSyllables: return UBLOCK_YI_SYLLABLES
      case .yiRadicals: return UBLOCK_YI_RADICALS
      case .hangulSyllables: return UBLOCK_HANGUL_SYLLABLES
      case .highSurrogates: return UBLOCK_HIGH_SURROGATES
      case .highPrivateUseSurrogates: return UBLOCK_HIGH_PRIVATE_USE_SURROGATES
      case .lowSurrogates: return UBLOCK_LOW_SURROGATES
      case .privateUseArea: return UBLOCK_PRIVATE_USE_AREA
      case .privateUse: return UBLOCK_PRIVATE_USE
      case .cjkCompatibilityIdeographs:
        return UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS
      case .alphabeticPresentationForms:
        return UBLOCK_ALPHABETIC_PRESENTATION_FORMS
      case .arabicPresentationFormsA: return UBLOCK_ARABIC_PRESENTATION_FORMS_A
      case .combiningHalfMarks: return UBLOCK_COMBINING_HALF_MARKS
      case .cjkCompatibilityForms: return UBLOCK_CJK_COMPATIBILITY_FORMS
      case .smallFormVariants: return UBLOCK_SMALL_FORM_VARIANTS
      case .arabicPresentationFormsB: return UBLOCK_ARABIC_PRESENTATION_FORMS_B
      case .specials: return UBLOCK_SPECIALS
      case .halfwidthAndFullwidthForms:
        return UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS
      case .oldItalic: return UBLOCK_OLD_ITALIC
      case .gothic: return UBLOCK_GOTHIC
      case .deseret: return UBLOCK_DESERET
      case .byzantineMusicalSymbols: return UBLOCK_BYZANTINE_MUSICAL_SYMBOLS
      case .musicalSymbols: return UBLOCK_MUSICAL_SYMBOLS
      case .mathematicalAlphanumericSymbols:
        return UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS
      case .cjkUnifiedIdeographsExtensionB:
        return UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B
      case .cjkCompatibilityIdeographsSupplement:
        return UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT
      case .tags: return UBLOCK_TAGS
      case .cyrillicSupplement: return UBLOCK_CYRILLIC_SUPPLEMENT
      case .cyrillicSupplementary: return UBLOCK_CYRILLIC_SUPPLEMENTARY
      case .tagalog: return UBLOCK_TAGALOG
      case .hanunoo: return UBLOCK_HANUNOO
      case .buhid: return UBLOCK_BUHID
      case .tagbanwa: return UBLOCK_TAGBANWA
      case .miscellaneousMathematicalSymbolsA:
        return UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A
      case .supplementalArrowsA: return UBLOCK_SUPPLEMENTAL_ARROWS_A
      case .supplementalArrowsB: return UBLOCK_SUPPLEMENTAL_ARROWS_B
      case .miscellaneousMathematicalSymbolsB:
        return UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B
      case .supplementalMathematicalOperators:
        return UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS
      case .katakanaPhoneticExtensions:
        return UBLOCK_KATAKANA_PHONETIC_EXTENSIONS
      case .variationSelectors: return UBLOCK_VARIATION_SELECTORS
      case .supplementaryPrivateUseAreaA:
        return UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A
      case .supplementaryPrivateUseAreaB:
        return UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B
      case .limbu: return UBLOCK_LIMBU
      case .taiLe: return UBLOCK_TAI_LE
      case .khmerSymbols: return UBLOCK_KHMER_SYMBOLS
      case .phoneticExtensions: return UBLOCK_PHONETIC_EXTENSIONS
      case .miscellaneousSymbolsAndArrows:
        return UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS
      case .yijingHexagramSymbols: return UBLOCK_YIJING_HEXAGRAM_SYMBOLS
      case .linearBSyllabary: return UBLOCK_LINEAR_B_SYLLABARY
      case .linearBIdeograms: return UBLOCK_LINEAR_B_IDEOGRAMS
      case .aegeanNumbers: return UBLOCK_AEGEAN_NUMBERS
      case .ugaritic: return UBLOCK_UGARITIC
      case .shavian: return UBLOCK_SHAVIAN
      case .osmanya: return UBLOCK_OSMANYA
      case .cypriotSyllabary: return UBLOCK_CYPRIOT_SYLLABARY
      case .taiXuanJingSymbols: return UBLOCK_TAI_XUAN_JING_SYMBOLS
      case .variationSelectorsSupplement:
        return UBLOCK_VARIATION_SELECTORS_SUPPLEMENT
      case .ancientGreekMusicalNotation:
        return UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION
      case .ancientGreekNumbers: return UBLOCK_ANCIENT_GREEK_NUMBERS
      case .arabicSupplement: return UBLOCK_ARABIC_SUPPLEMENT
      case .buginese: return UBLOCK_BUGINESE
      case .cjkStrokes: return UBLOCK_CJK_STROKES
      case .combiningDiacriticalMarksSupplement:
        return UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT
      case .coptic: return UBLOCK_COPTIC
      case .ethiopicExtended: return UBLOCK_ETHIOPIC_EXTENDED
      case .ethiopicSupplement: return UBLOCK_ETHIOPIC_SUPPLEMENT
      case .georgianSupplement: return UBLOCK_GEORGIAN_SUPPLEMENT
      case .glagolitic: return UBLOCK_GLAGOLITIC
      case .kharoshthi: return UBLOCK_KHAROSHTHI
      case .modifierToneLetters: return UBLOCK_MODIFIER_TONE_LETTERS
      case .newTaiLue: return UBLOCK_NEW_TAI_LUE
      case .oldPersian: return UBLOCK_OLD_PERSIAN
      case .phoneticExtensionsSupplement:
        return UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT
      case .supplementalPunctuation: return UBLOCK_SUPPLEMENTAL_PUNCTUATION
      case .sylotiNagri: return UBLOCK_SYLOTI_NAGRI
      case .tifinagh: return UBLOCK_TIFINAGH
      case .verticalForms: return UBLOCK_VERTICAL_FORMS
      case .nko: return UBLOCK_NKO
      case .balinese: return UBLOCK_BALINESE
      case .latinExtendedC: return UBLOCK_LATIN_EXTENDED_C
      case .latinExtendedD: return UBLOCK_LATIN_EXTENDED_D
      case .phagsPa: return UBLOCK_PHAGS_PA
      case .phoenician: return UBLOCK_PHOENICIAN
      case .cuneiform: return UBLOCK_CUNEIFORM
      case .cuneiformNumbersAndPunctuation:
        return UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION
      case .countingRodNumerals: return UBLOCK_COUNTING_ROD_NUMERALS
      case .sundanese: return UBLOCK_SUNDANESE
      case .lepcha: return UBLOCK_LEPCHA
      case .olChiki: return UBLOCK_OL_CHIKI
      case .cyrillicExtendedA: return UBLOCK_CYRILLIC_EXTENDED_A
      case .vai: return UBLOCK_VAI
      case .cyrillicExtendedB: return UBLOCK_CYRILLIC_EXTENDED_B
      case .saurashtra: return UBLOCK_SAURASHTRA
      case .kayahLi: return UBLOCK_KAYAH_LI
      case .rejang: return UBLOCK_REJANG
      case .cham: return UBLOCK_CHAM
      case .ancientSymbols: return UBLOCK_ANCIENT_SYMBOLS
      case .phaistosDisc: return UBLOCK_PHAISTOS_DISC
      case .lycian: return UBLOCK_LYCIAN
      case .carian: return UBLOCK_CARIAN
      case .lydian: return UBLOCK_LYDIAN
      case .mahjongTiles: return UBLOCK_MAHJONG_TILES
      case .dominoTiles: return UBLOCK_DOMINO_TILES
      case .samaritan: return UBLOCK_SAMARITAN
      case .unifiedCanadianAboriginalSyllabicsExtended:
        return UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED
      case .taiTham: return UBLOCK_TAI_THAM
      case .vedicExtensions: return UBLOCK_VEDIC_EXTENSIONS
      case .lisu: return UBLOCK_LISU
      case .bamum: return UBLOCK_BAMUM
      case .commonIndicNumberForms: return UBLOCK_COMMON_INDIC_NUMBER_FORMS
      case .devanagariExtended: return UBLOCK_DEVANAGARI_EXTENDED
      case .hangulJamoExtendedA: return UBLOCK_HANGUL_JAMO_EXTENDED_A
      case .javanese: return UBLOCK_JAVANESE
      case .myanmarExtendedA: return UBLOCK_MYANMAR_EXTENDED_A
      case .taiViet: return UBLOCK_TAI_VIET
      case .meeteiMayek: return UBLOCK_MEETEI_MAYEK
      case .hangulJamoExtendedB: return UBLOCK_HANGUL_JAMO_EXTENDED_B
      case .imperialAramaic: return UBLOCK_IMPERIAL_ARAMAIC
      case .oldSouthArabian: return UBLOCK_OLD_SOUTH_ARABIAN
      case .avestan: return UBLOCK_AVESTAN
      case .inscriptionalParthian: return UBLOCK_INSCRIPTIONAL_PARTHIAN
      case .inscriptionalPahlavi: return UBLOCK_INSCRIPTIONAL_PAHLAVI
      case .oldTurkic: return UBLOCK_OLD_TURKIC
      case .rumiNumeralSymbols: return UBLOCK_RUMI_NUMERAL_SYMBOLS
      case .kaithi: return UBLOCK_KAITHI
      case .egyptianHieroglyphs: return UBLOCK_EGYPTIAN_HIEROGLYPHS
      case .enclosedAlphanumericSupplement:
        return UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT
      case .enclosedIdeographicSupplement:
        return UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT
      case .cjkUnifiedIdeographsExtensionC:
        return UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C
      case .mandaic: return UBLOCK_MANDAIC
      case .batak: return UBLOCK_BATAK
      case .ethiopicExtendedA: return UBLOCK_ETHIOPIC_EXTENDED_A
      case .brahmi: return UBLOCK_BRAHMI
      case .bamumSupplement: return UBLOCK_BAMUM_SUPPLEMENT
      case .kanaSupplement: return UBLOCK_KANA_SUPPLEMENT
      case .playingCards: return UBLOCK_PLAYING_CARDS
      case .miscellaneousSymbolsAndPictographs:
        return UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS
      case .emoticons: return UBLOCK_EMOTICONS
      case .transportAndMapSymbols: return UBLOCK_TRANSPORT_AND_MAP_SYMBOLS
      case .alchemicalSymbols: return UBLOCK_ALCHEMICAL_SYMBOLS
      case .cjkUnifiedIdeographsExtensionD:
        return UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D
      case .arabicExtendedA: return UBLOCK_ARABIC_EXTENDED_A
      case .arabicMathematicalAlphabeticSymbols:
        return UBLOCK_ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS
      case .chakma: return UBLOCK_CHAKMA
      case .meeteiMayekExtensions: return UBLOCK_MEETEI_MAYEK_EXTENSIONS
      case .meroiticCursive: return UBLOCK_MEROITIC_CURSIVE
      case .meroiticHieroglyphs: return UBLOCK_MEROITIC_HIEROGLYPHS
      case .miao: return UBLOCK_MIAO
      case .sharada: return UBLOCK_SHARADA
      case .soraSompeng: return UBLOCK_SORA_SOMPENG
      case .sundaneseSupplement: return UBLOCK_SUNDANESE_SUPPLEMENT
      case .takri: return UBLOCK_TAKRI
      case .bassaVah: return UBLOCK_BASSA_VAH
      case .caucasianAlbanian: return UBLOCK_CAUCASIAN_ALBANIAN
      case .copticEpactNumbers: return UBLOCK_COPTIC_EPACT_NUMBERS
      case .combiningDiacriticalMarksExtended:
        return UBLOCK_COMBINING_DIACRITICAL_MARKS_EXTENDED
      case .duployan: return UBLOCK_DUPLOYAN
      case .elbasan: return UBLOCK_ELBASAN
      case .geometricShapesExtended: return UBLOCK_GEOMETRIC_SHAPES_EXTENDED
      case .grantha: return UBLOCK_GRANTHA
      case .khojki: return UBLOCK_KHOJKI
      case .khudawadi: return UBLOCK_KHUDAWADI
      case .latinExtendedE: return UBLOCK_LATIN_EXTENDED_E
      case .linearA: return UBLOCK_LINEAR_A
      case .mahajani: return UBLOCK_MAHAJANI
      case .manichaean: return UBLOCK_MANICHAEAN
      case .mendeKikakui: return UBLOCK_MENDE_KIKAKUI
      case .modi: return UBLOCK_MODI
      case .mro: return UBLOCK_MRO
      case .myanmarExtendedB: return UBLOCK_MYANMAR_EXTENDED_B
      case .nabataean: return UBLOCK_NABATAEAN
      case .oldNorthArabian: return UBLOCK_OLD_NORTH_ARABIAN
      case .oldPermic: return UBLOCK_OLD_PERMIC
      case .ornamentalDingbats: return UBLOCK_ORNAMENTAL_DINGBATS
      case .pahawhHmong: return UBLOCK_PAHAWH_HMONG
      case .palmyrene: return UBLOCK_PALMYRENE
      case .pauCinHau: return UBLOCK_PAU_CIN_HAU
      case .psalterPahlavi: return UBLOCK_PSALTER_PAHLAVI
      case .shorthandFormatControls: return UBLOCK_SHORTHAND_FORMAT_CONTROLS
      case .siddham: return UBLOCK_SIDDHAM
      case .sinhalaArchaicNumbers: return UBLOCK_SINHALA_ARCHAIC_NUMBERS
      case .supplementalArrowsC: return UBLOCK_SUPPLEMENTAL_ARROWS_C
      case .tirhuta: return UBLOCK_TIRHUTA
      case .warangCiti: return UBLOCK_WARANG_CITI
      case .ahom: return UBLOCK_AHOM
      case .anatolianHieroglyphs: return UBLOCK_ANATOLIAN_HIEROGLYPHS
      case .cherokeeSupplement: return UBLOCK_CHEROKEE_SUPPLEMENT
      case .cjkUnifiedIdeographsExtensionE:
        return UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E
      case .earlyDynasticCuneiform: return UBLOCK_EARLY_DYNASTIC_CUNEIFORM
      case .hatran: return UBLOCK_HATRAN
      case .multani: return UBLOCK_MULTANI
      case .oldHungarian: return UBLOCK_OLD_HUNGARIAN
      case .supplementalSymbolsAndPictographs:
        return UBLOCK_SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS
      case .suttonSignwriting: return UBLOCK_SUTTON_SIGNWRITING
      case .adlam: return UBLOCK_ADLAM
      case .bhaiksuki: return UBLOCK_BHAIKSUKI
      case .cyrillicExtendedC: return UBLOCK_CYRILLIC_EXTENDED_C
      case .glagoliticSupplement: return UBLOCK_GLAGOLITIC_SUPPLEMENT
      case .ideographicSymbolsAndPunctuation:
        return UBLOCK_IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION
      case .marchen: return UBLOCK_MARCHEN
      case .mongolianSupplement: return UBLOCK_MONGOLIAN_SUPPLEMENT
      case .newa: return UBLOCK_NEWA
      case .osage: return UBLOCK_OSAGE
      case .tangut: return UBLOCK_TANGUT
      case .tangutComponents: return UBLOCK_TANGUT_COMPONENTS
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UBlockCode) {
      switch cValue {
      case UBLOCK_NO_BLOCK: return nil
      case UBLOCK_BASIC_LATIN: self = .basicLatin
      case UBLOCK_LATIN_1_SUPPLEMENT: self = .latin1Supplement
      case UBLOCK_LATIN_EXTENDED_A: self = .latinExtendedA
      case UBLOCK_LATIN_EXTENDED_B: self = .latinExtendedB
      case UBLOCK_IPA_EXTENSIONS: self = .ipaExtensions
      case UBLOCK_SPACING_MODIFIER_LETTERS: self = .spacingModifierLetters
      case UBLOCK_COMBINING_DIACRITICAL_MARKS: self = .combiningDiacriticalMarks
      case UBLOCK_GREEK: self = .greek
      case UBLOCK_CYRILLIC: self = .cyrillic
      case UBLOCK_ARMENIAN: self = .armenian
      case UBLOCK_HEBREW: self = .hebrew
      case UBLOCK_ARABIC: self = .arabic
      case UBLOCK_SYRIAC: self = .syriac
      case UBLOCK_THAANA: self = .thaana
      case UBLOCK_DEVANAGARI: self = .devanagari
      case UBLOCK_BENGALI: self = .bengali
      case UBLOCK_GURMUKHI: self = .gurmukhi
      case UBLOCK_GUJARATI: self = .gujarati
      case UBLOCK_ORIYA: self = .oriya
      case UBLOCK_TAMIL: self = .tamil
      case UBLOCK_TELUGU: self = .telugu
      case UBLOCK_KANNADA: self = .kannada
      case UBLOCK_MALAYALAM: self = .malayalam
      case UBLOCK_SINHALA: self = .sinhala
      case UBLOCK_THAI: self = .thai
      case UBLOCK_LAO: self = .lao
      case UBLOCK_TIBETAN: self = .tibetan
      case UBLOCK_MYANMAR: self = .myanmar
      case UBLOCK_GEORGIAN: self = .georgian
      case UBLOCK_HANGUL_JAMO: self = .hangulJamo
      case UBLOCK_ETHIOPIC: self = .ethiopic
      case UBLOCK_CHEROKEE: self = .cherokee
      case UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS:
        self = .unifiedCanadianAboriginalSyllabics
      case UBLOCK_OGHAM: self = .ogham
      case UBLOCK_RUNIC: self = .runic
      case UBLOCK_KHMER: self = .khmer
      case UBLOCK_MONGOLIAN: self = .mongolian
      case UBLOCK_LATIN_EXTENDED_ADDITIONAL: self = .latinExtendedAdditional
      case UBLOCK_GREEK_EXTENDED: self = .greekExtended
      case UBLOCK_GENERAL_PUNCTUATION: self = .generalPunctuation
      case UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS: self = .superscriptsAndSubscripts
      case UBLOCK_CURRENCY_SYMBOLS: self = .currencySymbols
      case UBLOCK_COMBINING_MARKS_FOR_SYMBOLS: self = .combiningMarksForSymbols
      case UBLOCK_LETTERLIKE_SYMBOLS: self = .letterlikeSymbols
      case UBLOCK_NUMBER_FORMS: self = .numberForms
      case UBLOCK_ARROWS: self = .arrows
      case UBLOCK_MATHEMATICAL_OPERATORS: self = .mathematicalOperators
      case UBLOCK_MISCELLANEOUS_TECHNICAL: self = .miscellaneousTechnical
      case UBLOCK_CONTROL_PICTURES: self = .controlPictures
      case UBLOCK_OPTICAL_CHARACTER_RECOGNITION:
        self = .opticalCharacterRecognition
      case UBLOCK_ENCLOSED_ALPHANUMERICS: self = .enclosedAlphanumerics
      case UBLOCK_BOX_DRAWING: self = .boxDrawing
      case UBLOCK_BLOCK_ELEMENTS: self = .blockElements
      case UBLOCK_GEOMETRIC_SHAPES: self = .geometricShapes
      case UBLOCK_MISCELLANEOUS_SYMBOLS: self = .miscellaneousSymbols
      case UBLOCK_DINGBATS: self = .dingbats
      case UBLOCK_BRAILLE_PATTERNS: self = .braillePatterns
      case UBLOCK_CJK_RADICALS_SUPPLEMENT: self = .cjkRadicalsSupplement
      case UBLOCK_KANGXI_RADICALS: self = .kangxiRadicals
      case UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS:
        self = .ideographicDescriptionCharacters
      case UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION: self = .cjkSymbolsAndPunctuation
      case UBLOCK_HIRAGANA: self = .hiragana
      case UBLOCK_KATAKANA: self = .katakana
      case UBLOCK_BOPOMOFO: self = .bopomofo
      case UBLOCK_HANGUL_COMPATIBILITY_JAMO: self = .hangulCompatibilityJamo
      case UBLOCK_KANBUN: self = .kanbun
      case UBLOCK_BOPOMOFO_EXTENDED: self = .bopomofoExtended
      case UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS:
        self = .enclosedCjkLettersAndMonths
      case UBLOCK_CJK_COMPATIBILITY: self = .cjkCompatibility
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A:
        self = .cjkUnifiedIdeographsExtensionA
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS: self = .cjkUnifiedIdeographs
      case UBLOCK_YI_SYLLABLES: self = .yiSyllables
      case UBLOCK_YI_RADICALS: self = .yiRadicals
      case UBLOCK_HANGUL_SYLLABLES: self = .hangulSyllables
      case UBLOCK_HIGH_SURROGATES: self = .highSurrogates
      case UBLOCK_HIGH_PRIVATE_USE_SURROGATES: self = .highPrivateUseSurrogates
      case UBLOCK_LOW_SURROGATES: self = .lowSurrogates
      case UBLOCK_PRIVATE_USE_AREA: self = .privateUseArea
      case UBLOCK_PRIVATE_USE: self = .privateUse
      case UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS:
        self = .cjkCompatibilityIdeographs
      case UBLOCK_ALPHABETIC_PRESENTATION_FORMS:
        self = .alphabeticPresentationForms
      case UBLOCK_ARABIC_PRESENTATION_FORMS_A: self = .arabicPresentationFormsA
      case UBLOCK_COMBINING_HALF_MARKS: self = .combiningHalfMarks
      case UBLOCK_CJK_COMPATIBILITY_FORMS: self = .cjkCompatibilityForms
      case UBLOCK_SMALL_FORM_VARIANTS: self = .smallFormVariants
      case UBLOCK_ARABIC_PRESENTATION_FORMS_B: self = .arabicPresentationFormsB
      case UBLOCK_SPECIALS: self = .specials
      case UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS:
        self = .halfwidthAndFullwidthForms
      case UBLOCK_OLD_ITALIC: self = .oldItalic
      case UBLOCK_GOTHIC: self = .gothic
      case UBLOCK_DESERET: self = .deseret
      case UBLOCK_BYZANTINE_MUSICAL_SYMBOLS: self = .byzantineMusicalSymbols
      case UBLOCK_MUSICAL_SYMBOLS: self = .musicalSymbols
      case UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS:
        self = .mathematicalAlphanumericSymbols
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B:
        self = .cjkUnifiedIdeographsExtensionB
      case UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT:
        self = .cjkCompatibilityIdeographsSupplement
      case UBLOCK_TAGS: self = .tags
      case UBLOCK_CYRILLIC_SUPPLEMENT: self = .cyrillicSupplement
      case UBLOCK_CYRILLIC_SUPPLEMENTARY: self = .cyrillicSupplementary
      case UBLOCK_TAGALOG: self = .tagalog
      case UBLOCK_HANUNOO: self = .hanunoo
      case UBLOCK_BUHID: self = .buhid
      case UBLOCK_TAGBANWA: self = .tagbanwa
      case UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A:
        self = .miscellaneousMathematicalSymbolsA
      case UBLOCK_SUPPLEMENTAL_ARROWS_A: self = .supplementalArrowsA
      case UBLOCK_SUPPLEMENTAL_ARROWS_B: self = .supplementalArrowsB
      case UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B:
        self = .miscellaneousMathematicalSymbolsB
      case UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS:
        self = .supplementalMathematicalOperators
      case UBLOCK_KATAKANA_PHONETIC_EXTENSIONS: self = .katakanaPhoneticExtensions
      case UBLOCK_VARIATION_SELECTORS: self = .variationSelectors
      case UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A:
        self = .supplementaryPrivateUseAreaA
      case UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B:
        self = .supplementaryPrivateUseAreaB
      case UBLOCK_LIMBU: self = .limbu
      case UBLOCK_TAI_LE: self = .taiLe
      case UBLOCK_KHMER_SYMBOLS: self = .khmerSymbols
      case UBLOCK_PHONETIC_EXTENSIONS: self = .phoneticExtensions
      case UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS:
        self = .miscellaneousSymbolsAndArrows
      case UBLOCK_YIJING_HEXAGRAM_SYMBOLS: self = .yijingHexagramSymbols
      case UBLOCK_LINEAR_B_SYLLABARY: self = .linearBSyllabary
      case UBLOCK_LINEAR_B_IDEOGRAMS: self = .linearBIdeograms
      case UBLOCK_AEGEAN_NUMBERS: self = .aegeanNumbers
      case UBLOCK_UGARITIC: self = .ugaritic
      case UBLOCK_SHAVIAN: self = .shavian
      case UBLOCK_OSMANYA: self = .osmanya
      case UBLOCK_CYPRIOT_SYLLABARY: self = .cypriotSyllabary
      case UBLOCK_TAI_XUAN_JING_SYMBOLS: self = .taiXuanJingSymbols
      case UBLOCK_VARIATION_SELECTORS_SUPPLEMENT:
        self = .variationSelectorsSupplement
      case UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION:
        self = .ancientGreekMusicalNotation
      case UBLOCK_ANCIENT_GREEK_NUMBERS: self = .ancientGreekNumbers
      case UBLOCK_ARABIC_SUPPLEMENT: self = .arabicSupplement
      case UBLOCK_BUGINESE: self = .buginese
      case UBLOCK_CJK_STROKES: self = .cjkStrokes
      case UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT:
        self = .combiningDiacriticalMarksSupplement
      case UBLOCK_COPTIC: self = .coptic
      case UBLOCK_ETHIOPIC_EXTENDED: self = .ethiopicExtended
      case UBLOCK_ETHIOPIC_SUPPLEMENT: self = .ethiopicSupplement
      case UBLOCK_GEORGIAN_SUPPLEMENT: self = .georgianSupplement
      case UBLOCK_GLAGOLITIC: self = .glagolitic
      case UBLOCK_KHAROSHTHI: self = .kharoshthi
      case UBLOCK_MODIFIER_TONE_LETTERS: self = .modifierToneLetters
      case UBLOCK_NEW_TAI_LUE: self = .newTaiLue
      case UBLOCK_OLD_PERSIAN: self = .oldPersian
      case UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT:
        self = .phoneticExtensionsSupplement
      case UBLOCK_SUPPLEMENTAL_PUNCTUATION: self = .supplementalPunctuation
      case UBLOCK_SYLOTI_NAGRI: self = .sylotiNagri
      case UBLOCK_TIFINAGH: self = .tifinagh
      case UBLOCK_VERTICAL_FORMS: self = .verticalForms
      case UBLOCK_NKO: self = .nko
      case UBLOCK_BALINESE: self = .balinese
      case UBLOCK_LATIN_EXTENDED_C: self = .latinExtendedC
      case UBLOCK_LATIN_EXTENDED_D: self = .latinExtendedD
      case UBLOCK_PHAGS_PA: self = .phagsPa
      case UBLOCK_PHOENICIAN: self = .phoenician
      case UBLOCK_CUNEIFORM: self = .cuneiform
      case UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION:
        self = .cuneiformNumbersAndPunctuation
      case UBLOCK_COUNTING_ROD_NUMERALS: self = .countingRodNumerals
      case UBLOCK_SUNDANESE: self = .sundanese
      case UBLOCK_LEPCHA: self = .lepcha
      case UBLOCK_OL_CHIKI: self = .olChiki
      case UBLOCK_CYRILLIC_EXTENDED_A: self = .cyrillicExtendedA
      case UBLOCK_VAI: self = .vai
      case UBLOCK_CYRILLIC_EXTENDED_B: self = .cyrillicExtendedB
      case UBLOCK_SAURASHTRA: self = .saurashtra
      case UBLOCK_KAYAH_LI: self = .kayahLi
      case UBLOCK_REJANG: self = .rejang
      case UBLOCK_CHAM: self = .cham
      case UBLOCK_ANCIENT_SYMBOLS: self = .ancientSymbols
      case UBLOCK_PHAISTOS_DISC: self = .phaistosDisc
      case UBLOCK_LYCIAN: self = .lycian
      case UBLOCK_CARIAN: self = .carian
      case UBLOCK_LYDIAN: self = .lydian
      case UBLOCK_MAHJONG_TILES: self = .mahjongTiles
      case UBLOCK_DOMINO_TILES: self = .dominoTiles
      case UBLOCK_SAMARITAN: self = .samaritan
      case UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED:
        self = .unifiedCanadianAboriginalSyllabicsExtended
      case UBLOCK_TAI_THAM: self = .taiTham
      case UBLOCK_VEDIC_EXTENSIONS: self = .vedicExtensions
      case UBLOCK_LISU: self = .lisu
      case UBLOCK_BAMUM: self = .bamum
      case UBLOCK_COMMON_INDIC_NUMBER_FORMS: self = .commonIndicNumberForms
      case UBLOCK_DEVANAGARI_EXTENDED: self = .devanagariExtended
      case UBLOCK_HANGUL_JAMO_EXTENDED_A: self = .hangulJamoExtendedA
      case UBLOCK_JAVANESE: self = .javanese
      case UBLOCK_MYANMAR_EXTENDED_A: self = .myanmarExtendedA
      case UBLOCK_TAI_VIET: self = .taiViet
      case UBLOCK_MEETEI_MAYEK: self = .meeteiMayek
      case UBLOCK_HANGUL_JAMO_EXTENDED_B: self = .hangulJamoExtendedB
      case UBLOCK_IMPERIAL_ARAMAIC: self = .imperialAramaic
      case UBLOCK_OLD_SOUTH_ARABIAN: self = .oldSouthArabian
      case UBLOCK_AVESTAN: self = .avestan
      case UBLOCK_INSCRIPTIONAL_PARTHIAN: self = .inscriptionalParthian
      case UBLOCK_INSCRIPTIONAL_PAHLAVI: self = .inscriptionalPahlavi
      case UBLOCK_OLD_TURKIC: self = .oldTurkic
      case UBLOCK_RUMI_NUMERAL_SYMBOLS: self = .rumiNumeralSymbols
      case UBLOCK_KAITHI: self = .kaithi
      case UBLOCK_EGYPTIAN_HIEROGLYPHS: self = .egyptianHieroglyphs
      case UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT:
        self = .enclosedAlphanumericSupplement
      case UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT:
        self = .enclosedIdeographicSupplement
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C:
        self = .cjkUnifiedIdeographsExtensionC
      case UBLOCK_MANDAIC: self = .mandaic
      case UBLOCK_BATAK: self = .batak
      case UBLOCK_ETHIOPIC_EXTENDED_A: self = .ethiopicExtendedA
      case UBLOCK_BRAHMI: self = .brahmi
      case UBLOCK_BAMUM_SUPPLEMENT: self = .bamumSupplement
      case UBLOCK_KANA_SUPPLEMENT: self = .kanaSupplement
      case UBLOCK_PLAYING_CARDS: self = .playingCards
      case UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS:
        self = .miscellaneousSymbolsAndPictographs
      case UBLOCK_EMOTICONS: self = .emoticons
      case UBLOCK_TRANSPORT_AND_MAP_SYMBOLS: self = .transportAndMapSymbols
      case UBLOCK_ALCHEMICAL_SYMBOLS: self = .alchemicalSymbols
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D:
        self = .cjkUnifiedIdeographsExtensionD
      case UBLOCK_ARABIC_EXTENDED_A: self = .arabicExtendedA
      case UBLOCK_ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS:
        self = .arabicMathematicalAlphabeticSymbols
      case UBLOCK_CHAKMA: self = .chakma
      case UBLOCK_MEETEI_MAYEK_EXTENSIONS: self = .meeteiMayekExtensions
      case UBLOCK_MEROITIC_CURSIVE: self = .meroiticCursive
      case UBLOCK_MEROITIC_HIEROGLYPHS: self = .meroiticHieroglyphs
      case UBLOCK_MIAO: self = .miao
      case UBLOCK_SHARADA: self = .sharada
      case UBLOCK_SORA_SOMPENG: self = .soraSompeng
      case UBLOCK_SUNDANESE_SUPPLEMENT: self = .sundaneseSupplement
      case UBLOCK_TAKRI: self = .takri
      case UBLOCK_BASSA_VAH: self = .bassaVah
      case UBLOCK_CAUCASIAN_ALBANIAN: self = .caucasianAlbanian
      case UBLOCK_COPTIC_EPACT_NUMBERS: self = .copticEpactNumbers
      case UBLOCK_COMBINING_DIACRITICAL_MARKS_EXTENDED:
        self = .combiningDiacriticalMarksExtended
      case UBLOCK_DUPLOYAN: self = .duployan
      case UBLOCK_ELBASAN: self = .elbasan
      case UBLOCK_GEOMETRIC_SHAPES_EXTENDED: self = .geometricShapesExtended
      case UBLOCK_GRANTHA: self = .grantha
      case UBLOCK_KHOJKI: self = .khojki
      case UBLOCK_KHUDAWADI: self = .khudawadi
      case UBLOCK_LATIN_EXTENDED_E: self = .latinExtendedE
      case UBLOCK_LINEAR_A: self = .linearA
      case UBLOCK_MAHAJANI: self = .mahajani
      case UBLOCK_MANICHAEAN: self = .manichaean
      case UBLOCK_MENDE_KIKAKUI: self = .mendeKikakui
      case UBLOCK_MODI: self = .modi
      case UBLOCK_MRO: self = .mro
      case UBLOCK_MYANMAR_EXTENDED_B: self = .myanmarExtendedB
      case UBLOCK_NABATAEAN: self = .nabataean
      case UBLOCK_OLD_NORTH_ARABIAN: self = .oldNorthArabian
      case UBLOCK_OLD_PERMIC: self = .oldPermic
      case UBLOCK_ORNAMENTAL_DINGBATS: self = .ornamentalDingbats
      case UBLOCK_PAHAWH_HMONG: self = .pahawhHmong
      case UBLOCK_PALMYRENE: self = .palmyrene
      case UBLOCK_PAU_CIN_HAU: self = .pauCinHau
      case UBLOCK_PSALTER_PAHLAVI: self = .psalterPahlavi
      case UBLOCK_SHORTHAND_FORMAT_CONTROLS: self = .shorthandFormatControls
      case UBLOCK_SIDDHAM: self = .siddham
      case UBLOCK_SINHALA_ARCHAIC_NUMBERS: self = .sinhalaArchaicNumbers
      case UBLOCK_SUPPLEMENTAL_ARROWS_C: self = .supplementalArrowsC
      case UBLOCK_TIRHUTA: self = .tirhuta
      case UBLOCK_WARANG_CITI: self = .warangCiti
      case UBLOCK_AHOM: self = .ahom
      case UBLOCK_ANATOLIAN_HIEROGLYPHS: self = .anatolianHieroglyphs
      case UBLOCK_CHEROKEE_SUPPLEMENT: self = .cherokeeSupplement
      case UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E:
        self = .cjkUnifiedIdeographsExtensionE
      case UBLOCK_EARLY_DYNASTIC_CUNEIFORM: self = .earlyDynasticCuneiform
      case UBLOCK_HATRAN: self = .hatran
      case UBLOCK_MULTANI: self = .multani
      case UBLOCK_OLD_HUNGARIAN: self = .oldHungarian
      case UBLOCK_SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS:
        self = .supplementalSymbolsAndPictographs
      case UBLOCK_SUTTON_SIGNWRITING: self = .suttonSignwriting
      case UBLOCK_ADLAM: self = .adlam
      case UBLOCK_BHAIKSUKI: self = .bhaiksuki
      case UBLOCK_CYRILLIC_EXTENDED_C: self = .cyrillicExtendedC
      case UBLOCK_GLAGOLITIC_SUPPLEMENT: self = .glagoliticSupplement
      case UBLOCK_IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION:
        self = .ideographicSymbolsAndPunctuation
      case UBLOCK_MARCHEN: self = .marchen
      case UBLOCK_MONGOLIAN_SUPPLEMENT: self = .mongolianSupplement
      case UBLOCK_NEWA: self = .newa
      case UBLOCK_OSAGE: self = .osage
      case UBLOCK_TANGUT: self = .tangut
      case UBLOCK_TANGUT_COMPONENTS: self = .tangutComponents
      default: fatalError("Invalid UBlockCode value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The Unicode block that contains the receiving scalar.
  public var block: Unicode.Block? {
    return value(of: UCHAR_BLOCK)
  }
}
