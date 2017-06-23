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

  /// Describes the Arabic cursive joining type of a scalar.
  public enum JoiningType: ConvertibleFromUnicodeIntProperty {

    case nonJoining
    case joinCausing
    case dualJoining
    case leftJoining
    case rightJoining
    case transparent

    /// The C API value of type `UJoiningType` that corresponds to the
    /// receiving enum case.
    var cValue: UJoiningType {
      switch self {
      case .nonJoining: return U_JT_NON_JOINING
      case .joinCausing: return U_JT_JOIN_CAUSING
      case .dualJoining: return U_JT_DUAL_JOINING
      case .leftJoining: return U_JT_LEFT_JOINING
      case .rightJoining: return U_JT_RIGHT_JOINING
      case .transparent: return U_JT_TRANSPARENT
      }
    }

    /// Creates a new value from the given ICU C API value.
    ///
    /// - Parameter cValue: The ICU C API value.
    init(cValue: UJoiningType) {
      switch cValue {
      case U_JT_NON_JOINING: self = .nonJoining
      case U_JT_JOIN_CAUSING: self = .joinCausing
      case U_JT_DUAL_JOINING: self = .dualJoining
      case U_JT_LEFT_JOINING: self = .leftJoining
      case U_JT_RIGHT_JOINING: self = .rightJoining
      case U_JT_TRANSPARENT: self = .transparent
      default: fatalError("Invalid UJoiningType value: \(cValue)")
      }
    }
  }
}

extension UnicodeScalar {

  /// The joining type property of the receiver.
  public var joiningType: Unicode.JoiningType {
    return value(of: UCHAR_JOINING_TYPE)
  }
}
