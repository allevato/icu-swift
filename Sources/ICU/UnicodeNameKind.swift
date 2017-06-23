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

/// Indicates which name for a `UnicodeScalar` should be returned by
/// `UnicodeScalar.name(kind:)` or provided in enumerations.
public enum UnicodeNameKind {
  
  /// The "modern" name of a Unicode scalar (defined by its "Name" property).
  case unicode
  
  /// The "extended" (standard or synthetic) name of a Unicode scalar, which is
  /// unique for each scalar.
  case extended
  
  /// The corrected name of a Unicode scalar from NameAliases.txt.
  case alias
  
  /// The C API value of type `UCharNameChoice` that corresponds to the
  /// receiving enum case.
  var cValue: UCharNameChoice {
    switch self {
    case .unicode: return U_UNICODE_CHAR_NAME
    case .extended: return U_EXTENDED_CHAR_NAME
    case .alias: return U_CHAR_NAME_ALIAS
    }
  }
}
