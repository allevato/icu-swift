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

  /// Shaping group subdivisions of dual-joining and right-joining Arabic
  /// characters based on the behavior of their letter skeletons when shaped in
  /// context.
  public enum JoiningGroup: ConvertibleFromUnicodeIntProperty {

    case ain
    case alaph
    case alef
    case beh
    case beth
    case dal
    case dalathRish
    case e
    case feh
    case finalSemkath
    case gaf
    case gamal
    case hah
    case tehMarbutaGoal
    case hamzaOnHehGoal
    case he
    case heh
    case hehGoal
    case heth
    case kaf
    case kaph
    case knottedHeh
    case lam
    case lamadh
    case meem
    case mim
    case noon
    case nun
    case pe
    case qaf
    case qaph
    case reh
    case reversedPe
    case sad
    case sadhe
    case seen
    case semkath
    case shin
    case swashKaf
    case syriacWaw
    case tah
    case taw
    case tehMarbuta
    case teth
    case waw
    case yeh
    case yehBarree
    case yehWithTail
    case yudh
    case yudhHe
    case zain
    case fe
    case khaph
    case zhain
    case burushaskiYehBarree
    case farsiYeh
    case nya
    case rohingyaYeh
    case manichaeanAleph
    case manichaeanAyin
    case manichaeanBeth
    case manichaeanDaleth
    case manichaeanDhamedh
    case manichaeanFive
    case manichaeanGimel
    case manichaeanHeth
    case manichaeanHundred
    case manichaeanKaph
    case manichaeanLamedh
    case manichaeanMem
    case manichaeanNun
    case manichaeanOne
    case manichaeanPe
    case manichaeanQoph
    case manichaeanResh
    case manichaeanSadhe
    case manichaeanSamekh
    case manichaeanTaw
    case manichaeanTen
    case manichaeanTeth
    case manichaeanThamedh
    case manichaeanTwenty
    case manichaeanWaw
    case manichaeanYodh
    case manichaeanZayin
    case straightWaw
    case africanFeh
    case africanNoon
    case africanQaf

    /// The C API value of type `UJoiningGroup` that corresponds to the
    /// receiving enum case.
    var cValue: UJoiningGroup {
      switch self {
      case .ain: return U_JG_AIN
      case .alaph: return U_JG_ALAPH
      case .alef: return U_JG_ALEF
      case .beh: return U_JG_BEH
      case .beth: return U_JG_BETH
      case .dal: return U_JG_DAL
      case .dalathRish: return U_JG_DALATH_RISH
      case .e: return U_JG_E
      case .feh: return U_JG_FEH
      case .finalSemkath: return U_JG_FINAL_SEMKATH
      case .gaf: return U_JG_GAF
      case .gamal: return U_JG_GAMAL
      case .hah: return U_JG_HAH
      case .tehMarbutaGoal: return U_JG_TEH_MARBUTA_GOAL
      case .hamzaOnHehGoal: return U_JG_HAMZA_ON_HEH_GOAL
      case .he: return U_JG_HE
      case .heh: return U_JG_HEH
      case .hehGoal: return U_JG_HEH_GOAL
      case .heth: return U_JG_HETH
      case .kaf: return U_JG_KAF
      case .kaph: return U_JG_KAPH
      case .knottedHeh: return U_JG_KNOTTED_HEH
      case .lam: return U_JG_LAM
      case .lamadh: return U_JG_LAMADH
      case .meem: return U_JG_MEEM
      case .mim: return U_JG_MIM
      case .noon: return U_JG_NOON
      case .nun: return U_JG_NUN
      case .pe: return U_JG_PE
      case .qaf: return U_JG_QAF
      case .qaph: return U_JG_QAPH
      case .reh: return U_JG_REH
      case .reversedPe: return U_JG_REVERSED_PE
      case .sad: return U_JG_SAD
      case .sadhe: return U_JG_SADHE
      case .seen: return U_JG_SEEN
      case .semkath: return U_JG_SEMKATH
      case .shin: return U_JG_SHIN
      case .swashKaf: return U_JG_SWASH_KAF
      case .syriacWaw: return U_JG_SYRIAC_WAW
      case .tah: return U_JG_TAH
      case .taw: return U_JG_TAW
      case .tehMarbuta: return U_JG_TEH_MARBUTA
      case .teth: return U_JG_TETH
      case .waw: return U_JG_WAW
      case .yeh: return U_JG_YEH
      case .yehBarree: return U_JG_YEH_BARREE
      case .yehWithTail: return U_JG_YEH_WITH_TAIL
      case .yudh: return U_JG_YUDH
      case .yudhHe: return U_JG_YUDH_HE
      case .zain: return U_JG_ZAIN
      case .fe: return U_JG_FE
      case .khaph: return U_JG_KHAPH
      case .zhain: return U_JG_ZHAIN
      case .burushaskiYehBarree: return U_JG_BURUSHASKI_YEH_BARREE
      case .farsiYeh: return U_JG_FARSI_YEH
      case .nya: return U_JG_NYA
      case .rohingyaYeh: return U_JG_ROHINGYA_YEH
      case .manichaeanAleph: return U_JG_MANICHAEAN_ALEPH
      case .manichaeanAyin: return U_JG_MANICHAEAN_AYIN
      case .manichaeanBeth: return U_JG_MANICHAEAN_BETH
      case .manichaeanDaleth: return U_JG_MANICHAEAN_DALETH
      case .manichaeanDhamedh: return U_JG_MANICHAEAN_DHAMEDH
      case .manichaeanFive: return U_JG_MANICHAEAN_FIVE
      case .manichaeanGimel: return U_JG_MANICHAEAN_GIMEL
      case .manichaeanHeth: return U_JG_MANICHAEAN_HETH
      case .manichaeanHundred: return U_JG_MANICHAEAN_HUNDRED
      case .manichaeanKaph: return U_JG_MANICHAEAN_KAPH
      case .manichaeanLamedh: return U_JG_MANICHAEAN_LAMEDH
      case .manichaeanMem: return U_JG_MANICHAEAN_MEM
      case .manichaeanNun: return U_JG_MANICHAEAN_NUN
      case .manichaeanOne: return U_JG_MANICHAEAN_ONE
      case .manichaeanPe: return U_JG_MANICHAEAN_PE
      case .manichaeanQoph: return U_JG_MANICHAEAN_QOPH
      case .manichaeanResh: return U_JG_MANICHAEAN_RESH
      case .manichaeanSadhe: return U_JG_MANICHAEAN_SADHE
      case .manichaeanSamekh: return U_JG_MANICHAEAN_SAMEKH
      case .manichaeanTaw: return U_JG_MANICHAEAN_TAW
      case .manichaeanTen: return U_JG_MANICHAEAN_TEN
      case .manichaeanTeth: return U_JG_MANICHAEAN_TETH
      case .manichaeanThamedh: return U_JG_MANICHAEAN_THAMEDH
      case .manichaeanTwenty: return U_JG_MANICHAEAN_TWENTY
      case .manichaeanWaw: return U_JG_MANICHAEAN_WAW
      case .manichaeanYodh: return U_JG_MANICHAEAN_YODH
      case .manichaeanZayin: return U_JG_MANICHAEAN_ZAYIN
      case .straightWaw: return U_JG_STRAIGHT_WAW
      case .africanFeh: return U_JG_AFRICAN_FEH
      case .africanNoon: return U_JG_AFRICAN_NOON
      case .africanQaf: return U_JG_AFRICAN_QAF
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init?(cValue: UJoiningGroup) {
      switch cValue {
      case U_JG_NO_JOINING_GROUP: return nil
      case U_JG_AIN: self = .ain
      case U_JG_ALAPH: self = .alaph
      case U_JG_ALEF: self = .alef
      case U_JG_BEH: self = .beh
      case U_JG_BETH: self = .beth
      case U_JG_DAL: self = .dal
      case U_JG_DALATH_RISH: self = .dalathRish
      case U_JG_E: self = .e
      case U_JG_FEH: self = .feh
      case U_JG_FINAL_SEMKATH: self = .finalSemkath
      case U_JG_GAF: self = .gaf
      case U_JG_GAMAL: self = .gamal
      case U_JG_HAH: self = .hah
      case U_JG_TEH_MARBUTA_GOAL: self = .tehMarbutaGoal
      case U_JG_HAMZA_ON_HEH_GOAL: self = .hamzaOnHehGoal
      case U_JG_HE: self = .he
      case U_JG_HEH: self = .heh
      case U_JG_HEH_GOAL: self = .hehGoal
      case U_JG_HETH: self = .heth
      case U_JG_KAF: self = .kaf
      case U_JG_KAPH: self = .kaph
      case U_JG_KNOTTED_HEH: self = .knottedHeh
      case U_JG_LAM: self = .lam
      case U_JG_LAMADH: self = .lamadh
      case U_JG_MEEM: self = .meem
      case U_JG_MIM: self = .mim
      case U_JG_NOON: self = .noon
      case U_JG_NUN: self = .nun
      case U_JG_PE: self = .pe
      case U_JG_QAF: self = .qaf
      case U_JG_QAPH: self = .qaph
      case U_JG_REH: self = .reh
      case U_JG_REVERSED_PE: self = .reversedPe
      case U_JG_SAD: self = .sad
      case U_JG_SADHE: self = .sadhe
      case U_JG_SEEN: self = .seen
      case U_JG_SEMKATH: self = .semkath
      case U_JG_SHIN: self = .shin
      case U_JG_SWASH_KAF: self = .swashKaf
      case U_JG_SYRIAC_WAW: self = .syriacWaw
      case U_JG_TAH: self = .tah
      case U_JG_TAW: self = .taw
      case U_JG_TEH_MARBUTA: self = .tehMarbuta
      case U_JG_TETH: self = .teth
      case U_JG_WAW: self = .waw
      case U_JG_YEH: self = .yeh
      case U_JG_YEH_BARREE: self = .yehBarree
      case U_JG_YEH_WITH_TAIL: self = .yehWithTail
      case U_JG_YUDH: self = .yudh
      case U_JG_YUDH_HE: self = .yudhHe
      case U_JG_ZAIN: self = .zain
      case U_JG_FE: self = .fe
      case U_JG_KHAPH: self = .khaph
      case U_JG_ZHAIN: self = .zhain
      case U_JG_BURUSHASKI_YEH_BARREE: self = .burushaskiYehBarree
      case U_JG_FARSI_YEH: self = .farsiYeh
      case U_JG_NYA: self = .nya
      case U_JG_ROHINGYA_YEH: self = .rohingyaYeh
      case U_JG_MANICHAEAN_ALEPH: self = .manichaeanAleph
      case U_JG_MANICHAEAN_AYIN: self = .manichaeanAyin
      case U_JG_MANICHAEAN_BETH: self = .manichaeanBeth
      case U_JG_MANICHAEAN_DALETH: self = .manichaeanDaleth
      case U_JG_MANICHAEAN_DHAMEDH: self = .manichaeanDhamedh
      case U_JG_MANICHAEAN_FIVE: self = .manichaeanFive
      case U_JG_MANICHAEAN_GIMEL: self = .manichaeanGimel
      case U_JG_MANICHAEAN_HETH: self = .manichaeanHeth
      case U_JG_MANICHAEAN_HUNDRED: self = .manichaeanHundred
      case U_JG_MANICHAEAN_KAPH: self = .manichaeanKaph
      case U_JG_MANICHAEAN_LAMEDH: self = .manichaeanLamedh
      case U_JG_MANICHAEAN_MEM: self = .manichaeanMem
      case U_JG_MANICHAEAN_NUN: self = .manichaeanNun
      case U_JG_MANICHAEAN_ONE: self = .manichaeanOne
      case U_JG_MANICHAEAN_PE: self = .manichaeanPe
      case U_JG_MANICHAEAN_QOPH: self = .manichaeanQoph
      case U_JG_MANICHAEAN_RESH: self = .manichaeanResh
      case U_JG_MANICHAEAN_SADHE: self = .manichaeanSadhe
      case U_JG_MANICHAEAN_SAMEKH: self = .manichaeanSamekh
      case U_JG_MANICHAEAN_TAW: self = .manichaeanTaw
      case U_JG_MANICHAEAN_TEN: self = .manichaeanTen
      case U_JG_MANICHAEAN_TETH: self = .manichaeanTeth
      case U_JG_MANICHAEAN_THAMEDH: self = .manichaeanThamedh
      case U_JG_MANICHAEAN_TWENTY: self = .manichaeanTwenty
      case U_JG_MANICHAEAN_WAW: self = .manichaeanWaw
      case U_JG_MANICHAEAN_YODH: self = .manichaeanYodh
      case U_JG_MANICHAEAN_ZAYIN: self = .manichaeanZayin
      case U_JG_STRAIGHT_WAW: self = .straightWaw
      case U_JG_AFRICAN_FEH: self = .africanFeh
      case U_JG_AFRICAN_NOON: self = .africanNoon
      case U_JG_AFRICAN_QAF: self = .africanQaf
      default: fatalError("Invalid UJoiningGroup value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The joining group property of the receiver.
  public var joiningGroup: Unicode.JoiningGroup? {
    return value(of: UCHAR_JOINING_GROUP)
  }
}
