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

  /// Indicates which name for a `UnicodeScalar` should be returned by
  /// `UnicodeScalar.name(kind:)` or provided in enumerations.
  public enum NameKind {

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
}

public extension UnicodeScalar {

  /// Creates a new Unicode scalar with the given name.
  ///
  /// The name passed into this initializer must match exactly. Unicode names
  /// (`nameKind == .unicode`) are all uppercase. Extended names
  /// (`nameKind == .extended`) are lowercase followed by an uppercase
  /// hexadecimal number, all enclosed by angled brackets.
  ///
  /// This initializer returns nil if no code point exists with the given name.
  ///
  /// - Parameters:
  ///   - name: The name of the code point.
  ///   - nameKind: The kind of the name specified by `name`.
  public init?(named name: String, nameKind: Unicode.NameKind = .unicode) {
    var error = UErrorCode()
    let value = u_charFromName(nameKind.cValue, name, &error)
    guard error.isSuccess else {
      return nil
    }

    self.init(uchar32Value: value)
  }

  /// Returns the Unicode name, or a variant, for the receiving scalar.
  ///
  /// - Parameters:
  ///   - kind: A value from `UnicodeNameKind` indicating which name should be
  ///     returned. If not provided, the default is `.unicode`.
  /// - Returns: The name of the scalar, or `nil` if the name does not exist.
  public func name(kind: Unicode.NameKind = .unicode) -> String? {
    var error = UErrorCode()
    var buffer = UnsafeMutablePointer<Int8>.allocate(
      capacity: charNameBufferLength)
    defer { buffer.deallocate(capacity: charNameBufferLength) }

    let length = u_charName(
      uchar32Value,
      kind.cValue,
      buffer,
      Int32(truncatingIfNeeded: charNameBufferLength),
      &error)
    guard error.isSuccess else {
      // FIXME: Do something that makes sense here.
      return "ERROR: \(error)"
    }

    return length != 0 ? String(cString: buffer) : nil
  }
}

/// The length of the C-string buffer that should be passed to `u_charName`.
private let charNameBufferLength = 256
