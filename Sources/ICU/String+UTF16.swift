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

extension String {

  /// Creates a new `String` from the given pointer to a buffer containing
  /// null-terminated UTF-16 code units.
  ///
  /// - Parameter pointer: A pointer to a buffer containing null-terminated
  ///   UTF-16 code units.
  internal init(unsafeUTF16CodeUnits pointer: UnsafePointer<UChar>) {
    var codec = UTF16()
    var result = ""

    var iteratingPointer = pointer
    var iterator = AnyIterator<UChar> {
      let uchar = iteratingPointer.pointee
      if uchar == 0 {
        return nil
      }
      iteratingPointer = iteratingPointer.advanced(by: 1)
      return uchar
    }

    decode: while true {
      switch codec.decode(&iterator) {
      case .scalarValue(let scalar): result.unicodeScalars.append(scalar)
      case .emptyInput: break decode
      case .error:
        print("Decoding error")
        break decode
      }
    }

    self = result
  }

  /// Returns a buffer pointer to a copy of the UTF-16 code units of the
  /// receiver.
  ///
  /// The code units are not zero-terminated. It is the responsibility of the
  /// caller to deallocate the pointer returned by this method.
  ///
  /// - Returns: An `UnsafeMutableBufferPointer` containing a copy of the UTF-16
  ///   code units of the receiver.
  internal func unsafeUTF16CodeUnits() -> UnsafeMutableBufferPointer<UChar> {
    let length = utf16.count
    let pointer = UnsafeMutablePointer<UChar>.allocate(capacity: length)
    let bufferPointer = UnsafeMutableBufferPointer(start: pointer, count: length)
    _ = bufferPointer.initialize(from: utf16)
    return bufferPointer
  }
}
