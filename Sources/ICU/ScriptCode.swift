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

  /// ISO 15924 script codes.
  ///
  /// The current set of script code constants supports at least all scripts
  /// that are encoded in the version of Unicode that ICU currently supports.
  /// The names of the constants are usually derived from the Unicode script
  /// property value aliases. See UAX #24 Unicode Script Property
  /// (http://www.unicode.org/reports/tr24/) and
  /// http://www.unicode.org/Public/UCD/latest/ucd/PropertyValueAliases.txt .
  ///
  /// In addition, constants for many ISO 15924 script codes are included, for
  /// use with language tags, CLDR data, and similar. Some of those codes are
  /// not used in the Unicode Character Database (UCD). For example, there are
  /// no characters that have a UCD script property value of "Hans" or "Hant".
  /// All Han ideographs have the "Hani" script property value in Unicode.
  ///
  /// Private-use codes "Qaaa"..."Qabx" are not included, except as used in the
  /// UCD or in CLDR.
  ///
  /// Starting with ICU 55, script codes are only added when their scripts have
  /// been or will certainly be encoded in Unicode, and have been assigned
  /// Unicode script property value aliases, to ensure that their script names
  /// are stable and match the names of the constants. Script codes like "Latf"
  /// and "Aran" that are not subject to separate encoding may be added at any
  /// time.
  public enum ScriptCode: ConvertibleFromUnicodeIntProperty {

    /// ISO script code "Zyyy".
    case common

    /// ISO script code "Zinh".
    ///
    /// Code for inherited script, for non-spacing combining marks; also Qaai.
    case inherited

    /// ISO script code "Arab".
    case arabic

    /// ISO script code "Armn".
    case armenian

    /// ISO script code "Beng".
    case bengali

    /// ISO script code "Bopo".
    case bopomofo

    /// ISO script code "Cher".
    case cherokee

    /// ISO script code "Copt".
    case coptic

    /// ISO script code "Cyrl".
    case cyrillic

    /// ISO script code "Dsrt".
    case deseret

    /// ISO script code "Deva".
    case devanagari

    /// ISO script code "Ethi".
    case ethiopic

    /// ISO script code "Geor".
    case georgian

    /// ISO script code "Goth".
    case gothic

    /// ISO script code "Grek".
    case greek

    /// ISO script code "Gujr".
    case gujarati

    /// ISO script code "Guru".
    case gurmukhi

    /// ISO script code "Hani".
    case han

    /// ISO script code "Hang".
    case hangul

    /// ISO script code "Hira".
    case hiragana

    /// ISO script code "Knda".
    case kannada

    /// ISO script code "Kana".
    case katakana

    /// ISO script code "Khmr".
    case khmer

    /// ISO script code "Laoo".
    case lao

    /// ISO script code "Latn".
    case latin

    /// ISO script code "Mlym".
    case malayalam

    /// ISO script code "Mong".
    case mongolian

    /// ISO script code "Mymr".
    case myanmar

    /// ISO script code "Ogam".
    case ogham

    /// ISO script code "Ital".
    case oldItalic

    /// ISO script code "Orya".
    case oriya

    /// ISO script code "Runr".
    case runic

    /// ISO script code "Sinh".
    case sinhala

    /// ISO script code "Syrc".
    case syriac

    /// ISO script code "Taml".
    case tamil

    /// ISO script code "Telu".
    case telugu

    /// ISO script code "Thaa".
    case thaana

    /// ISO script code "Thai".
    case thai

    /// ISO script code "Tibt".
    case tibetan

    /// ISO script code "Cans".
    case canadianAboriginal

    /// ISO script code "Yiii".
    case yi

    /// ISO script code "Tglg".
    case tagalog

    /// ISO script code "Hano".
    case hanunoo

    /// ISO script code "Buhd".
    case buhid

    /// ISO script code "Tagb".
    case tagbanwa

    /// ISO script code "Brai".
    case braille

    /// ISO script code "Cprt".
    case cypriot

    /// ISO script code "Limb".
    case limbu

    /// ISO script code "Linb".
    case linearB

    /// ISO script code "Osma".
    case osmanya

    /// ISO script code "Shaw".
    case shavian

    /// ISO script code "Tale".
    case taiLe

    /// ISO script code "Ugar".
    case ugaritic

    /// ISO script code "Hrkt".
    case katakanaOrHiragana

    /// ISO script code "Bugi".
    case buginese

    /// ISO script code "Glag".
    case glagolitic

    /// ISO script code "Khar".
    case kharoshthi

    /// ISO script code "Sylo".
    case sylotiNagri

    /// ISO script code "Talu".
    case newTaiLue

    /// ISO script code "Tfng".
    case tifinagh

    /// ISO script code "Xpeo".
    case oldPersian

    /// ISO script code "Bali".
    case balinese

    /// ISO script code "Batk".
    case batak

    /// ISO script code "Blis".
    case blissymbols

    /// ISO script code "Brah".
    case brahmi

    /// ISO script code "Cham".
    case cham

    /// ISO script code "Cirt".
    case cirth

    /// ISO script code "Cyrs".
    case oldChurchSlavonicCyrillic

    /// ISO script code "Egyd".
    case demoticEgyptian

    /// ISO script code "Egyh".
    case hieraticEgyptian

    /// ISO script code "Egyp".
    case egyptianHieroglyphs

    /// ISO script code "Geok".
    case khutsuri

    /// ISO script code "Hans".
    case simplifiedHan

    /// ISO script code "Hant".
    case traditionalHan

    /// ISO script code "Hmng".
    case pahawhHmong

    /// ISO script code "Hung".
    case oldHungarian

    /// ISO script code "Inds".
    case harappanIndus

    /// ISO script code "Java".
    case javanese

    /// ISO script code "Kali".
    case kayahLi

    /// ISO script code "Latf".
    case latinFraktur

    /// ISO script code "Latg".
    case latinGaelic

    /// ISO script code "Lepc".
    case lepcha

    /// ISO script code "Lina".
    case linearA

    /// ISO script code "Mand".
    case mandaic

    /// ISO script code "Maya".
    case mayanHieroglyphs

    /// ISO script code "Mero".
    case meroiticHieroglyphs

    /// ISO script code "Nkoo".
    case nko

    /// ISO script code "Orkh".
    case orkhon

    /// ISO script code "Perm".
    case oldPermic

    /// ISO script code "Phag".
    case phagsPa

    /// ISO script code "Phnx".
    case phoenician

    /// ISO script code "Plrd".
    case miao

    /// ISO script code "Roro".
    case rongorongo

    /// ISO script code "Sara".
    case sarati

    /// ISO script code "Syre".
    case estrangeloSyriac

    /// ISO script code "Syrj".
    case westernSyriac

    /// ISO script code "Syrn".
    case easternSyriac

    /// ISO script code "Teng".
    case tengwar

    /// ISO script code "Vaii".
    case vai

    /// ISO script code "Visp".
    case visibleSpeech

    /// ISO script code "Xsux".
    case cuneiform

    /// ISO script code "Zxxx".
    case unwrittenLanguages

    /// ISO script code "Zzzz".
    ///
    /// Code for uncoded script, for unassigned code points.
    case unknown

    /// ISO script code "Cari".
    case carian

    /// ISO script code "Jpan".
    case japanese

    /// ISO script code "Lana".
    case lanna

    /// ISO script code "Lyci".
    case lycian

    /// ISO script code "Lydi".
    case lydian

    /// ISO script code "Olck".
    case olChiki

    /// ISO script code "Rjng".
    case rejang

    /// ISO script code "Saur".
    case saurashtra

    /// ISO script code "Sgnw".
    case signWriting

    /// ISO script code "Sund".
    case sundanese

    /// ISO script code "Moon".
    case moon

    /// ISO script code "Mtei".
    case meiteiMayek

    /// ISO script code "Armi".
    case imperialAramaic

    /// ISO script code "Avst".
    case avestan

    /// ISO script code "Cakm".
    case chakma

    /// ISO script code "Kore".
    case korean

    /// ISO script code "Kthi".
    case kaithi

    /// ISO script code "Mani".
    case manichaean

    /// ISO script code "Phli".
    case inscriptionalPahlavi

    /// ISO script code "Phlp".
    case psalterPahlavi

    /// ISO script code "Phlv".
    case bookPahlavi

    /// ISO script code "Prti".
    case inscriptionalParthian

    /// ISO script code "Samr".
    case samaritan

    /// ISO script code "Tavt".
    case taiViet

    /// ISO script code "Zmth".
    case mathematicalNotation

    /// ISO script code "Zsym".
    case symbols

    /// ISO script code "Bamu".
    case bamum

    /// ISO script code "Lisu".
    case lisu

    /// ISO script code "Nkgb".
    case nakhiGeba

    /// ISO script code "Sarb".
    case oldSouthArabian

    /// ISO script code "Bass".
    case bassaVah

    /// ISO script code "Dupl".
    case duployan

    /// ISO script code "Elba".
    case elbasan

    /// ISO script code "Gran".
    case grantha

    /// ISO script code "Kpel".
    case kpelle

    /// ISO script code "Loma".
    case loma

    /// ISO script code "Mend".
    case mende

    /// ISO script code "Merc".
    case meroiticCursive

    /// ISO script code "Narb".
    case oldNorthArabian

    /// ISO script code "Nbat".
    case nabataean

    /// ISO script code "Palm".
    case palmyrene

    /// ISO script code "Sind".
    case khudawadi

    /// ISO script code "Wara".
    case warangCiti

    /// ISO script code "Afak".
    case afaka

    /// ISO script code "Jurc".
    case jurchen

    /// ISO script code "Mroo".
    case mro

    /// ISO script code "Nshu".
    case nushu

    /// ISO script code "Shrd".
    case sharada

    /// ISO script code "Sora".
    case soraSompeng

    /// ISO script code "Takr".
    case takri

    /// ISO script code "Tang".
    case tangut

    /// ISO script code "Wole".
    case woleai

    /// ISO script code "Hluw".
    case anatolianHieroglyphs

    /// ISO script code "Khoj".
    case khojki

    /// ISO script code "Tirh".
    case tirhuta

    /// ISO script code "Aghb".
    case caucasianAlbanian

    /// ISO script code "Mahj".
    case mahajani

    /// ISO script code "Ahom".
    case ahom

    /// ISO script code "Hatr".
    case hatran

    /// ISO script code "Modi".
    case modi

    /// ISO script code "Mult".
    case multani

    /// ISO script code "Pauc".
    case pauCinHau

    /// ISO script code "Sidd".
    case siddham

    /// ISO script code "Adlm".
    case adlam

    /// ISO script code "Bhks".
    case bhaiksuki

    /// ISO script code "Marc".
    case marchen

    /// ISO script code "Newa".
    case newa

    /// ISO script code "Osge".
    case osage

    /// ISO script code "Hanb".
    case hanWithBopomofo

    /// ISO script code "Jamo".
    case jamo

    /// ISO script code "Zsye".
    case symbolsEmoji

    /// The C API value of type `UScriptCode` that corresponds to the receiving
    /// enum case.
    var cValue: UScriptCode {
      switch self {
      case .common: return USCRIPT_COMMON
      case .inherited: return USCRIPT_INHERITED
      case .arabic: return USCRIPT_ARABIC
      case .armenian: return USCRIPT_ARMENIAN
      case .bengali: return USCRIPT_BENGALI
      case .bopomofo: return USCRIPT_BOPOMOFO
      case .cherokee: return USCRIPT_CHEROKEE
      case .coptic: return USCRIPT_COPTIC
      case .cyrillic: return USCRIPT_CYRILLIC
      case .deseret: return USCRIPT_DESERET
      case .devanagari: return USCRIPT_DEVANAGARI
      case .ethiopic: return USCRIPT_ETHIOPIC
      case .georgian: return USCRIPT_GEORGIAN
      case .gothic: return USCRIPT_GOTHIC
      case .greek: return USCRIPT_GREEK
      case .gujarati: return USCRIPT_GUJARATI
      case .gurmukhi: return USCRIPT_GURMUKHI
      case .han: return USCRIPT_HAN
      case .hangul: return USCRIPT_HANGUL
      case .hiragana: return USCRIPT_HIRAGANA
      case .kannada: return USCRIPT_KANNADA
      case .katakana: return USCRIPT_KATAKANA
      case .khmer: return USCRIPT_KHMER
      case .lao: return USCRIPT_LAO
      case .latin: return USCRIPT_LATIN
      case .malayalam: return USCRIPT_MALAYALAM
      case .mongolian: return USCRIPT_MONGOLIAN
      case .myanmar: return USCRIPT_MYANMAR
      case .ogham: return USCRIPT_OGHAM
      case .oldItalic: return USCRIPT_OLD_ITALIC
      case .oriya: return USCRIPT_ORIYA
      case .runic: return USCRIPT_RUNIC
      case .sinhala: return USCRIPT_SINHALA
      case .syriac: return USCRIPT_SYRIAC
      case .tamil: return USCRIPT_TAMIL
      case .telugu: return USCRIPT_TELUGU
      case .thaana: return USCRIPT_THAANA
      case .thai: return USCRIPT_THAI
      case .tibetan: return USCRIPT_TIBETAN
      case .canadianAboriginal: return USCRIPT_CANADIAN_ABORIGINAL
      case .yi: return USCRIPT_YI
      case .tagalog: return USCRIPT_TAGALOG
      case .hanunoo: return USCRIPT_HANUNOO
      case .buhid: return USCRIPT_BUHID
      case .tagbanwa: return USCRIPT_TAGBANWA
      case .braille: return USCRIPT_BRAILLE
      case .cypriot: return USCRIPT_CYPRIOT
      case .limbu: return USCRIPT_LIMBU
      case .linearB: return USCRIPT_LINEAR_B
      case .osmanya: return USCRIPT_OSMANYA
      case .shavian: return USCRIPT_SHAVIAN
      case .taiLe: return USCRIPT_TAI_LE
      case .ugaritic: return USCRIPT_UGARITIC
      case .katakanaOrHiragana: return USCRIPT_KATAKANA_OR_HIRAGANA
      case .buginese: return USCRIPT_BUGINESE
      case .glagolitic: return USCRIPT_GLAGOLITIC
      case .kharoshthi: return USCRIPT_KHAROSHTHI
      case .sylotiNagri: return USCRIPT_SYLOTI_NAGRI
      case .newTaiLue: return USCRIPT_NEW_TAI_LUE
      case .tifinagh: return USCRIPT_TIFINAGH
      case .oldPersian: return USCRIPT_OLD_PERSIAN
      case .balinese: return USCRIPT_BALINESE
      case .batak: return USCRIPT_BATAK
      case .blissymbols: return USCRIPT_BLISSYMBOLS
      case .brahmi: return USCRIPT_BRAHMI
      case .cham: return USCRIPT_CHAM
      case .cirth: return USCRIPT_CIRTH
      case .oldChurchSlavonicCyrillic:
        return USCRIPT_OLD_CHURCH_SLAVONIC_CYRILLIC
      case .demoticEgyptian: return USCRIPT_DEMOTIC_EGYPTIAN
      case .hieraticEgyptian: return USCRIPT_HIERATIC_EGYPTIAN
      case .egyptianHieroglyphs: return USCRIPT_EGYPTIAN_HIEROGLYPHS
      case .khutsuri: return USCRIPT_KHUTSURI
      case .simplifiedHan: return USCRIPT_SIMPLIFIED_HAN
      case .traditionalHan: return USCRIPT_TRADITIONAL_HAN
      case .pahawhHmong: return USCRIPT_PAHAWH_HMONG
      case .oldHungarian: return USCRIPT_OLD_HUNGARIAN
      case .harappanIndus: return USCRIPT_HARAPPAN_INDUS
      case .javanese: return USCRIPT_JAVANESE
      case .kayahLi: return USCRIPT_KAYAH_LI
      case .latinFraktur: return USCRIPT_LATIN_FRAKTUR
      case .latinGaelic: return USCRIPT_LATIN_GAELIC
      case .lepcha: return USCRIPT_LEPCHA
      case .linearA: return USCRIPT_LINEAR_A
      case .mandaic: return USCRIPT_MANDAIC
      case .mayanHieroglyphs: return USCRIPT_MAYAN_HIEROGLYPHS
      case .meroiticHieroglyphs: return USCRIPT_MEROITIC_HIEROGLYPHS
      case .nko: return USCRIPT_NKO
      case .orkhon: return USCRIPT_ORKHON
      case .oldPermic: return USCRIPT_OLD_PERMIC
      case .phagsPa: return USCRIPT_PHAGS_PA
      case .phoenician: return USCRIPT_PHOENICIAN
      case .miao: return USCRIPT_MIAO
      case .rongorongo: return USCRIPT_RONGORONGO
      case .sarati: return USCRIPT_SARATI
      case .estrangeloSyriac: return USCRIPT_ESTRANGELO_SYRIAC
      case .westernSyriac: return USCRIPT_WESTERN_SYRIAC
      case .easternSyriac: return USCRIPT_EASTERN_SYRIAC
      case .tengwar: return USCRIPT_TENGWAR
      case .vai: return USCRIPT_VAI
      case .visibleSpeech: return USCRIPT_VISIBLE_SPEECH
      case .cuneiform: return USCRIPT_CUNEIFORM
      case .unwrittenLanguages: return USCRIPT_UNWRITTEN_LANGUAGES
      case .unknown: return USCRIPT_UNKNOWN
      case .carian: return USCRIPT_CARIAN
      case .japanese: return USCRIPT_JAPANESE
      case .lanna: return USCRIPT_LANNA
      case .lycian: return USCRIPT_LYCIAN
      case .lydian: return USCRIPT_LYDIAN
      case .olChiki: return USCRIPT_OL_CHIKI
      case .rejang: return USCRIPT_REJANG
      case .saurashtra: return USCRIPT_SAURASHTRA
      case .signWriting: return USCRIPT_SIGN_WRITING
      case .sundanese: return USCRIPT_SUNDANESE
      case .moon: return USCRIPT_MOON
      case .meiteiMayek: return USCRIPT_MEITEI_MAYEK
      case .imperialAramaic: return USCRIPT_IMPERIAL_ARAMAIC
      case .avestan: return USCRIPT_AVESTAN
      case .chakma: return USCRIPT_CHAKMA
      case .korean: return USCRIPT_KOREAN
      case .kaithi: return USCRIPT_KAITHI
      case .manichaean: return USCRIPT_MANICHAEAN
      case .inscriptionalPahlavi: return USCRIPT_INSCRIPTIONAL_PAHLAVI
      case .psalterPahlavi: return USCRIPT_PSALTER_PAHLAVI
      case .bookPahlavi: return USCRIPT_BOOK_PAHLAVI
      case .inscriptionalParthian: return USCRIPT_INSCRIPTIONAL_PARTHIAN
      case .samaritan: return USCRIPT_SAMARITAN
      case .taiViet: return USCRIPT_TAI_VIET
      case .mathematicalNotation: return USCRIPT_MATHEMATICAL_NOTATION
      case .symbols: return USCRIPT_SYMBOLS
      case .bamum: return USCRIPT_BAMUM
      case .lisu: return USCRIPT_LISU
      case .nakhiGeba: return USCRIPT_NAKHI_GEBA
      case .oldSouthArabian: return USCRIPT_OLD_SOUTH_ARABIAN
      case .bassaVah: return USCRIPT_BASSA_VAH
      case .duployan: return USCRIPT_DUPLOYAN
      case .elbasan: return USCRIPT_ELBASAN
      case .grantha: return USCRIPT_GRANTHA
      case .kpelle: return USCRIPT_KPELLE
      case .loma: return USCRIPT_LOMA
      case .mende: return USCRIPT_MENDE
      case .meroiticCursive: return USCRIPT_MEROITIC_CURSIVE
      case .oldNorthArabian: return USCRIPT_OLD_NORTH_ARABIAN
      case .nabataean: return USCRIPT_NABATAEAN
      case .palmyrene: return USCRIPT_PALMYRENE
      case .khudawadi: return USCRIPT_KHUDAWADI
      case .warangCiti: return USCRIPT_WARANG_CITI
      case .afaka: return USCRIPT_AFAKA
      case .jurchen: return USCRIPT_JURCHEN
      case .mro: return USCRIPT_MRO
      case .nushu: return USCRIPT_NUSHU
      case .sharada: return USCRIPT_SHARADA
      case .soraSompeng: return USCRIPT_SORA_SOMPENG
      case .takri: return USCRIPT_TAKRI
      case .tangut: return USCRIPT_TANGUT
      case .woleai: return USCRIPT_WOLEAI
      case .anatolianHieroglyphs: return USCRIPT_ANATOLIAN_HIEROGLYPHS
      case .khojki: return USCRIPT_KHOJKI
      case .tirhuta: return USCRIPT_TIRHUTA
      case .caucasianAlbanian: return USCRIPT_CAUCASIAN_ALBANIAN
      case .mahajani: return USCRIPT_MAHAJANI
      case .ahom: return USCRIPT_AHOM
      case .hatran: return USCRIPT_HATRAN
      case .modi: return USCRIPT_MODI
      case .multani: return USCRIPT_MULTANI
      case .pauCinHau: return USCRIPT_PAU_CIN_HAU
      case .siddham: return USCRIPT_SIDDHAM
      case .adlam: return USCRIPT_ADLAM
      case .bhaiksuki: return USCRIPT_BHAIKSUKI
      case .marchen: return USCRIPT_MARCHEN
      case .newa: return USCRIPT_NEWA
      case .osage: return USCRIPT_OSAGE
      case .hanWithBopomofo: return USCRIPT_HAN_WITH_BOPOMOFO
      case .jamo: return USCRIPT_JAMO
      case .symbolsEmoji: return USCRIPT_SYMBOLS_EMOJI
      }
    }

    /// Indicates whether the script allows line breaks between letters.
    ///
    /// Such a script typically requires dictionary-based line breaking (for
    /// example, `.han` or `.thai`).
    public var allowsLineBreaksBetweenLetters: Bool {
      return uscript_breaksBetweenLetters(cValue) != 0
    }

    /// Indicates how Unicode recommends the script be used with respect to
    /// programming identifiers.
    public var identifierUsage: ScriptIdentifierUsage {
      return ScriptIdentifierUsage(cValue: uscript_getUsage(cValue))
    }

    /// Indicates whether case distinctions are customary in modern (or the most
    /// recent) usage of the script.
    ///
    /// Examples include `.latin` and `.cyrillic`.
    public var isCased: Bool {
      return uscript_isCased(cValue) != 0
    }

    /// Indicates whether the script is written right-to-left.
    ///
    /// Examples include `.arabic` and `.hebrew`.
    public var isRightToLeft: Bool {
      return uscript_isRightToLeft(cValue) != 0
    }

    /// The long Unicode script name, if there is one, or the 4-letter ISO 15924
    /// script code otherwise.
    ///
    /// For example, the name of `.malayalam` is "Malayam".
    public var name: String {
      return String(cString: uscript_getName(cValue))
    }

    /// A sample string representative of the receiving script.
    public var sampleString: String {
      var error = UErrorCode()
      var buffer = UnsafeMutablePointer<UChar>.allocate(
        capacity: sampleStringBufferLength)
      defer { buffer.deallocate(capacity: sampleStringBufferLength) }

      let length = uscript_getSampleString(
        cValue,
        buffer,
        Int32(extendingOrTruncating: sampleStringBufferLength),
        &error)
      guard error.isSuccess else {
        // FIXME: Do something that makes sense here.
        return "ERROR: \(error)"
      }

      return length != 0 ? String(decodingCString: buffer, as: UTF16.self) : ""
    }

    /// The 4-letter ISO 15924 script code.
    ///
    /// This script code is the same as the short Unicode script name if Unicode
    /// has names for the script. For example, the short name of `.malayalam` is
    /// "Mlym".
    public var shortName: String {
      return String(cString: uscript_getShortName(cValue))
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UScriptCode) {
      switch cValue {
      case USCRIPT_COMMON: self = .common
      case USCRIPT_INHERITED: self = .inherited
      case USCRIPT_ARABIC: self = .arabic
      case USCRIPT_ARMENIAN: self = .armenian
      case USCRIPT_BENGALI: self = .bengali
      case USCRIPT_BOPOMOFO: self = .bopomofo
      case USCRIPT_CHEROKEE: self = .cherokee
      case USCRIPT_COPTIC: self = .coptic
      case USCRIPT_CYRILLIC: self = .cyrillic
      case USCRIPT_DESERET: self = .deseret
      case USCRIPT_DEVANAGARI: self = .devanagari
      case USCRIPT_ETHIOPIC: self = .ethiopic
      case USCRIPT_GEORGIAN: self = .georgian
      case USCRIPT_GOTHIC: self = .gothic
      case USCRIPT_GREEK: self = .greek
      case USCRIPT_GUJARATI: self = .gujarati
      case USCRIPT_GURMUKHI: self = .gurmukhi
      case USCRIPT_HAN: self = .han
      case USCRIPT_HANGUL: self = .hangul
      case USCRIPT_HIRAGANA: self = .hiragana
      case USCRIPT_KANNADA: self = .kannada
      case USCRIPT_KATAKANA: self = .katakana
      case USCRIPT_KHMER: self = .khmer
      case USCRIPT_LAO: self = .lao
      case USCRIPT_LATIN: self = .latin
      case USCRIPT_MALAYALAM: self = .malayalam
      case USCRIPT_MONGOLIAN: self = .mongolian
      case USCRIPT_MYANMAR: self = .myanmar
      case USCRIPT_OGHAM: self = .ogham
      case USCRIPT_OLD_ITALIC: self = .oldItalic
      case USCRIPT_ORIYA: self = .oriya
      case USCRIPT_RUNIC: self = .runic
      case USCRIPT_SINHALA: self = .sinhala
      case USCRIPT_SYRIAC: self = .syriac
      case USCRIPT_TAMIL: self = .tamil
      case USCRIPT_TELUGU: self = .telugu
      case USCRIPT_THAANA: self = .thaana
      case USCRIPT_THAI: self = .thai
      case USCRIPT_TIBETAN: self = .tibetan
      case USCRIPT_CANADIAN_ABORIGINAL: self = .canadianAboriginal
      case USCRIPT_YI: self = .yi
      case USCRIPT_TAGALOG: self = .tagalog
      case USCRIPT_HANUNOO: self = .hanunoo
      case USCRIPT_BUHID: self = .buhid
      case USCRIPT_TAGBANWA: self = .tagbanwa
      case USCRIPT_BRAILLE: self = .braille
      case USCRIPT_CYPRIOT: self = .cypriot
      case USCRIPT_LIMBU: self = .limbu
      case USCRIPT_LINEAR_B: self = .linearB
      case USCRIPT_OSMANYA: self = .osmanya
      case USCRIPT_SHAVIAN: self = .shavian
      case USCRIPT_TAI_LE: self = .taiLe
      case USCRIPT_UGARITIC: self = .ugaritic
      case USCRIPT_KATAKANA_OR_HIRAGANA: self = .katakanaOrHiragana
      case USCRIPT_BUGINESE: self = .buginese
      case USCRIPT_GLAGOLITIC: self = .glagolitic
      case USCRIPT_KHAROSHTHI: self = .kharoshthi
      case USCRIPT_SYLOTI_NAGRI: self = .sylotiNagri
      case USCRIPT_NEW_TAI_LUE: self = .newTaiLue
      case USCRIPT_TIFINAGH: self = .tifinagh
      case USCRIPT_OLD_PERSIAN: self = .oldPersian
      case USCRIPT_BALINESE: self = .balinese
      case USCRIPT_BATAK: self = .batak
      case USCRIPT_BLISSYMBOLS: self = .blissymbols
      case USCRIPT_BRAHMI: self = .brahmi
      case USCRIPT_CHAM: self = .cham
      case USCRIPT_CIRTH: self = .cirth
      case USCRIPT_OLD_CHURCH_SLAVONIC_CYRILLIC:
        self = .oldChurchSlavonicCyrillic
      case USCRIPT_DEMOTIC_EGYPTIAN: self = .demoticEgyptian
      case USCRIPT_HIERATIC_EGYPTIAN: self = .hieraticEgyptian
      case USCRIPT_EGYPTIAN_HIEROGLYPHS: self = .egyptianHieroglyphs
      case USCRIPT_KHUTSURI: self = .khutsuri
      case USCRIPT_SIMPLIFIED_HAN: self = .simplifiedHan
      case USCRIPT_TRADITIONAL_HAN: self = .traditionalHan
      case USCRIPT_PAHAWH_HMONG: self = .pahawhHmong
      case USCRIPT_OLD_HUNGARIAN: self = .oldHungarian
      case USCRIPT_HARAPPAN_INDUS: self = .harappanIndus
      case USCRIPT_JAVANESE: self = .javanese
      case USCRIPT_KAYAH_LI: self = .kayahLi
      case USCRIPT_LATIN_FRAKTUR: self = .latinFraktur
      case USCRIPT_LATIN_GAELIC: self = .latinGaelic
      case USCRIPT_LEPCHA: self = .lepcha
      case USCRIPT_LINEAR_A: self = .linearA
      case USCRIPT_MANDAIC: self = .mandaic
      case USCRIPT_MAYAN_HIEROGLYPHS: self = .mayanHieroglyphs
      case USCRIPT_MEROITIC_HIEROGLYPHS: self = .meroiticHieroglyphs
      case USCRIPT_NKO: self = .nko
      case USCRIPT_ORKHON: self = .orkhon
      case USCRIPT_OLD_PERMIC: self = .oldPermic
      case USCRIPT_PHAGS_PA: self = .phagsPa
      case USCRIPT_PHOENICIAN: self = .phoenician
      case USCRIPT_MIAO: self = .miao
      case USCRIPT_RONGORONGO: self = .rongorongo
      case USCRIPT_SARATI: self = .sarati
      case USCRIPT_ESTRANGELO_SYRIAC: self = .estrangeloSyriac
      case USCRIPT_WESTERN_SYRIAC: self = .westernSyriac
      case USCRIPT_EASTERN_SYRIAC: self = .easternSyriac
      case USCRIPT_TENGWAR: self = .tengwar
      case USCRIPT_VAI: self = .vai
      case USCRIPT_VISIBLE_SPEECH: self = .visibleSpeech
      case USCRIPT_CUNEIFORM: self = .cuneiform
      case USCRIPT_UNWRITTEN_LANGUAGES: self = .unwrittenLanguages
      case USCRIPT_UNKNOWN: self = .unknown
      case USCRIPT_CARIAN: self = .carian
      case USCRIPT_JAPANESE: self = .japanese
      case USCRIPT_LANNA: self = .lanna
      case USCRIPT_LYCIAN: self = .lycian
      case USCRIPT_LYDIAN: self = .lydian
      case USCRIPT_OL_CHIKI: self = .olChiki
      case USCRIPT_REJANG: self = .rejang
      case USCRIPT_SAURASHTRA: self = .saurashtra
      case USCRIPT_SIGN_WRITING: self = .signWriting
      case USCRIPT_SUNDANESE: self = .sundanese
      case USCRIPT_MOON: self = .moon
      case USCRIPT_MEITEI_MAYEK: self = .meiteiMayek
      case USCRIPT_IMPERIAL_ARAMAIC: self = .imperialAramaic
      case USCRIPT_AVESTAN: self = .avestan
      case USCRIPT_CHAKMA: self = .chakma
      case USCRIPT_KOREAN: self = .korean
      case USCRIPT_KAITHI: self = .kaithi
      case USCRIPT_MANICHAEAN: self = .manichaean
      case USCRIPT_INSCRIPTIONAL_PAHLAVI: self = .inscriptionalPahlavi
      case USCRIPT_PSALTER_PAHLAVI: self = .psalterPahlavi
      case USCRIPT_BOOK_PAHLAVI: self = .bookPahlavi
      case USCRIPT_INSCRIPTIONAL_PARTHIAN: self = .inscriptionalParthian
      case USCRIPT_SAMARITAN: self = .samaritan
      case USCRIPT_TAI_VIET: self = .taiViet
      case USCRIPT_MATHEMATICAL_NOTATION: self = .mathematicalNotation
      case USCRIPT_SYMBOLS: self = .symbols
      case USCRIPT_BAMUM: self = .bamum
      case USCRIPT_LISU: self = .lisu
      case USCRIPT_NAKHI_GEBA: self = .nakhiGeba
      case USCRIPT_OLD_SOUTH_ARABIAN: self = .oldSouthArabian
      case USCRIPT_BASSA_VAH: self = .bassaVah
      case USCRIPT_DUPLOYAN: self = .duployan
      case USCRIPT_ELBASAN: self = .elbasan
      case USCRIPT_GRANTHA: self = .grantha
      case USCRIPT_KPELLE: self = .kpelle
      case USCRIPT_LOMA: self = .loma
      case USCRIPT_MENDE: self = .mende
      case USCRIPT_MEROITIC_CURSIVE: self = .meroiticCursive
      case USCRIPT_OLD_NORTH_ARABIAN: self = .oldNorthArabian
      case USCRIPT_NABATAEAN: self = .nabataean
      case USCRIPT_PALMYRENE: self = .palmyrene
      case USCRIPT_KHUDAWADI: self = .khudawadi
      case USCRIPT_WARANG_CITI: self = .warangCiti
      case USCRIPT_AFAKA: self = .afaka
      case USCRIPT_JURCHEN: self = .jurchen
      case USCRIPT_MRO: self = .mro
      case USCRIPT_NUSHU: self = .nushu
      case USCRIPT_SHARADA: self = .sharada
      case USCRIPT_SORA_SOMPENG: self = .soraSompeng
      case USCRIPT_TAKRI: self = .takri
      case USCRIPT_TANGUT: self = .tangut
      case USCRIPT_WOLEAI: self = .woleai
      case USCRIPT_ANATOLIAN_HIEROGLYPHS: self = .anatolianHieroglyphs
      case USCRIPT_KHOJKI: self = .khojki
      case USCRIPT_TIRHUTA: self = .tirhuta
      case USCRIPT_CAUCASIAN_ALBANIAN: self = .caucasianAlbanian
      case USCRIPT_MAHAJANI: self = .mahajani
      case USCRIPT_AHOM: self = .ahom
      case USCRIPT_HATRAN: self = .hatran
      case USCRIPT_MODI: self = .modi
      case USCRIPT_MULTANI: self = .multani
      case USCRIPT_PAU_CIN_HAU: self = .pauCinHau
      case USCRIPT_SIDDHAM: self = .siddham
      case USCRIPT_ADLAM: self = .adlam
      case USCRIPT_BHAIKSUKI: self = .bhaiksuki
      case USCRIPT_MARCHEN: self = .marchen
      case USCRIPT_NEWA: self = .newa
      case USCRIPT_OSAGE: self = .osage
      case USCRIPT_HAN_WITH_BOPOMOFO: self = .hanWithBopomofo
      case USCRIPT_JAMO: self = .jamo
      case USCRIPT_SYMBOLS_EMOJI: self = .symbolsEmoji
      default: fatalError("Invalid UScriptCode value: \(cValue)")
      }
    }
  }

  /// Represents the categorization of a script with respect to its recommended
  /// usage in programming language identifiers.
  public enum ScriptIdentifierUsage {

    /// The script usage is not encoded in Unicode.
    case notEncoded

    /// The script usage is unknown.
    case unknown

    /// The script is a candidate for exclusion from identifiers.
    ///
    /// Such scripts are typically historical and obsolete, are used mostly
    /// liturgically, or are regional scripts used only in very small
    /// communities or with very limited usage. Thus, implementations may want
    /// to exclude them from identifiers.
    case excluded

    /// The script is a modern script in limited use, which some implementations
    /// may wish to disallow in identifiers for security reasons.
    case limitedUse

    /// Deprecated; as of Unicode 10.0, all aspirational use scripts have been
    /// categorized as limited use.
    case aspirational

    /// The script is recommended for use in identifiers.
    case recommended

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UScriptUsage) {
      switch cValue {
      case USCRIPT_USAGE_NOT_ENCODED: self = .notEncoded
      case USCRIPT_USAGE_UNKNOWN: self = .unknown
      case USCRIPT_USAGE_EXCLUDED: self = .excluded
      case USCRIPT_USAGE_LIMITED_USE: self = .limitedUse
      case USCRIPT_USAGE_ASPIRATIONAL: self = .aspirational
      case USCRIPT_USAGE_RECOMMENDED: self = .recommended
      default: fatalError("Invalid UScriptUsage value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The script code associated with the receiving scalar.
  public var scriptCode: Unicode.ScriptCode {
    return value(of: UCHAR_SCRIPT)
  }

  /// The set of script codes that use the receiving scalar, based on the
  /// Unicode `Script_Extensions` property.
  ///
  /// If the receiving scalar does not have `Script_Extensions`, then this set
  /// contains a single element equal to the `scriptCode` property. If the
  /// scalar does have `Script_Extensions`, then the value of the `scriptCode`
  /// property (which is typically `.common` or `.inherited`) is *not* included
  /// in the returned set.
  ///
  /// If the receiving scalar is not a valid code point, the returned set
  /// contains a single element, `.unknown`.
  public var scriptExtensions: Set<Unicode.ScriptCode> {
    var error = UErrorCode()
    var buffer = UnsafeMutablePointer<UScriptCode>.allocate(
      capacity: scriptExtensionsBufferLength)
    defer { buffer.deallocate(capacity: scriptExtensionsBufferLength) }

    let length = uscript_getScriptExtensions(
      uchar32Value,
      buffer,
      Int32(extendingOrTruncating: scriptExtensionsBufferLength),
      &error)
    guard error.isSuccess else {
      fatalError("uscript_getScriptExtensions failed with error code \(error)")
    }

    let collection = UnsafeMutableBufferPointer<UScriptCode>(
      start: buffer,
      count: scriptExtensionsBufferLength).prefix(Int(length))
    return Set<Unicode.ScriptCode>(
      collection.map(Unicode.ScriptCode.init(cValue:)))
  }

  /// Returns a value indicating whether the receiving scalar's script
  /// extensions contain the given script code.
  ///
  /// If the scalar does not have any extensions, then this returns true if its
  /// `scriptCode` property is equal to the given one.
  ///
  /// - Parameter scriptCode: The script code to test.
  /// - Returns: True if the scalar's script extensions contain the given
  ///   script code, or if the scalar has no script extensions and its script
  ///   code is equal to the given one.
  public func hasScriptCode(_ scriptCode: Unicode.ScriptCode) -> Bool {
    return uscript_hasScript(uchar32Value, scriptCode.cValue) != 0
  }
}

/// The length of the buffer used to store script sample text.
private let sampleStringBufferLength = 8

/// The length of the buffer used to store script extensions.
private let scriptExtensionsBufferLength = 16

