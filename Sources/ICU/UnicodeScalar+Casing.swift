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

public extension UnicodeScalar {

  /// Returns the lowercase equivalent of the receiving scalar, or the scalar
  /// itself if it has no lowercase equivalent.
  ///
  /// - Returns: The lowercase equivalent of the receiving scalar.
  public func lowercased() -> UnicodeScalar {
    return UnicodeScalar(uchar32Value: u_tolower(uchar32Value))!
  }

  /// Returns the mirror-image of the receiving scalar, or the scalar itself if
  /// it has no mirror-image equivalent (via the `Bidi_Mirrored` Unicode
  /// property).
  ///
  /// - Returns: The mirror-image equivalent of the receiving scalar.
  public func mirrored() -> UnicodeScalar {
    return UnicodeScalar(uchar32Value: u_charMirror(uchar32Value))!
  }

  /// Returns the titlecase equivalent of the receiving scalar, or the scalar
  /// itself if it has no titlecase equivalent.
  ///
  /// Titlecase differs from uppercase in a small number of cases; particularly,
  /// those that represent digraphs. For example, U+01C6 (LATIN SMALL LETTER DZ
  /// WITH CARON) has a titlecase equivalent of U+01C5 (LATIN CAPITAL LETTER D
  /// WITH SMALL LETTER Z WITH CARON), whereas its uppercase equivalent is
  /// U+01C4 (LATIN CAPITAL LETTER DZ WITH CARON).
  ///
  /// - Returns: The titlecase equivalent of the receiving scalar.
  public func titlecased() -> UnicodeScalar {
    return UnicodeScalar(uchar32Value: u_totitle(uchar32Value))!
  }

  /// Returns the uppercase equivalent of the receiving scalar, or the scalar
  /// itself if it has no uppercase equivalent.
  ///
  /// - Returns: The uppercase equivalent of the receiving scalar.
  public func uppercased() -> UnicodeScalar {
    return UnicodeScalar(uchar32Value: u_toupper(uchar32Value))!
  }
}
