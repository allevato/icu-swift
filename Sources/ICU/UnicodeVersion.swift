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

  /// A four-component version value. These values are used to represent, for
  /// example, the Unicode version at which a code point was introduced.
  ///
  /// Values of this type support comparison (equality and ordering) and can be
  /// converted to/from human-readable strings.
  ///
  /// See also `UnicodeScalar.unicodeAge`.
  public struct Version {

    /// The underlying C value representing the version.
    private(set) var cValue: UVersionInfo

    /// The major component of the version.
    public var major: Int {
      return Int(cValue.0)
    }

    /// The minor component of the version.
    public var minor: Int {
      return Int(cValue.1)
    }

    /// The patch level component of the version.
    public var patchLevel: Int {
      return Int(cValue.2)
    }

    /// The build level component of the version.
    public var buildLevel: Int {
      return Int(cValue.3)
    }

    /// Creates a new Unicode version value with the given components.
    ///
    /// - Precondition: All components must be in the range `0...255`.
    ///
    /// - Parameters:
    ///   - major: The major component.
    ///   - minor: The minor component.
    ///   - patchLevel: The patch level component.
    ///   - buildLevel: The build level component.
    public init(
      major: Int,
      minor: Int = 0,
      patchLevel: Int = 0,
      buildLevel: Int = 0
    ) {
      precondition((0...255).contains(major) &&
                   (0...255).contains(minor) &&
                   (0...255).contains(patchLevel) &&
                   (0...255).contains(buildLevel),
                   "Version components must be in the range 0...255.")
      self.cValue.0 = UInt8(truncatingIfNeeded: major)
      self.cValue.1 = UInt8(truncatingIfNeeded: minor)
      self.cValue.2 = UInt8(truncatingIfNeeded: patchLevel)
      self.cValue.3 = UInt8(truncatingIfNeeded: buildLevel)
    }

    /// Creates a new Unicode version value equivalent to the given C value.
    ///
    /// - Parameter cValue: The C value to be wrapped.
    init(cValue: UVersionInfo) {
      self.cValue = cValue
    }

    /// Invokes the given closure with an immutable `UInt8` pointer to the
    /// underlying C value.
    ///
    /// - Parameter body: A closure that takes an immutable pointer to the
    ///   underlying C value as its sole argument, represented as a pointer to
    ///   `UInt8`.
    /// - Returns: The return value of the `body` closure, if any.
    /// - Throws: The error thrown by the `body` closure, if any.
    func withUnsafeUInt8Pointer<Result>(
      _ body: (UnsafePointer<UInt8>) throws -> Result
    ) rethrows -> Result {
      var valueCopy = cValue
      return try withUnsafePointer(to: &valueCopy) { pointer in
        return try pointer.withMemoryRebound(
          to: UInt8.self,
          capacity: MemoryLayout<UVersionInfo>.size
        ) { pointer in
          return try body(pointer)
        }
      }
    }

    /// Invokes the given closure with a mutable `UInt8` pointer to the
    /// underlying C value.
    ///
    /// - Parameter body: A closure that takes a mutable pointer to the
    ///   underlying C value its sole argument, represented as a pointer to
    ///   `UInt8`.
    /// - Returns: The return value of the `body` closure, if any.
    /// - Throws: The error thrown by the `body` closure, if any.
    mutating func withUnsafeMutableUInt8Pointer<Result>(
      _ body: (UnsafeMutablePointer<UInt8>) throws -> Result
    ) rethrows -> Result {
      return try withUnsafeMutablePointer(to: &cValue) { pointer in
        return try pointer.withMemoryRebound(
          to: UInt8.self,
          capacity: MemoryLayout<UVersionInfo>.size
        ) { pointer in
          return try body(pointer)
        }
      }
    }

    /// Performs a three-way comparison of the receiver with another version.
    ///
    /// - Parameter other: Another version.
    /// - Returns: Zero if the receiver is equal to `other`, a negative number
    ///   if the receiver is ordered before `other`, or a positive number if the
    ///   receiver is ordered after `other`.
    fileprivate func threeWayCompare(to other: Unicode.Version) -> Int {
      var lhsValue = cValue
      var rhsValue = other.cValue

      let result = withUnsafeBytes(of: &lhsValue) { lhsBuffer in
        return withUnsafeBytes(of: &rhsValue) { rhsBuffer in
          return memcmp(lhsBuffer.baseAddress,
                        rhsBuffer.baseAddress,
                        MemoryLayout<UVersionInfo>.size)
        }
      }
      return Int(result)
    }
  }
}

extension Unicode.Version: Comparable {

  /// Returns a value indicating whether the first version is less than the
  /// second version.
  ///
  /// - Parameters:
  ///   - lhs: A version.
  ///   - rhs: A version.
  /// - Returns: True if the first version is less than the second version, or
  ///   false otherwise.
  public static func < (lhs: Unicode.Version, rhs: Unicode.Version) -> Bool {
    return lhs.threeWayCompare(to: rhs) < 0
  }
}

extension Unicode.Version: Equatable {

  /// Returns a value indicating whether two versions are equal.
  ///
  /// - Parameters:
  ///   - lhs: A version.
  ///   - rhs: A version.
  /// - Returns: True if the versions are equal, or false otherwise.
  public static func == (lhs: Unicode.Version, rhs: Unicode.Version) -> Bool {
    return lhs.threeWayCompare(to: rhs) == 0
  }
}

extension Unicode.Version: LosslessStringConvertible {

  /// A string representation of the version, in the form
  /// `major.minor.patch.buildLevel` (trailing zero components are omitted).
  public var description: String {
    let capacity = Int(U_MAX_VERSION_STRING_LENGTH)
    let stringPointer = UnsafeMutablePointer<Int8>.allocate(capacity: capacity)
    defer { stringPointer.deallocate(capacity: capacity) }

    withUnsafeUInt8Pointer { versionPointer in
      u_versionToString(versionPointer, stringPointer)
    }

    return String(cString: stringPointer)
  }

  /// Creates a new `UnicodeVersion` by parsing the given string.
  ///
  /// Since the underlying ICU API does not provide error reporting, this
  /// initializer never fails. Instead, for values of `description` that do not
  /// meet the standard version string format, the created value is undefined.
  ///
  /// - Parameter description: A string representation of a version containing
  ///   between 1 and 4 components separated by dots, where each component is an
  ///   integer in the range `0...255`.
  public init(_ description: String) {
    var cValue: UVersionInfo = (0, 0, 0, 0)
    description.withCString { stringPointer in
      withUnsafeMutablePointer(to: &cValue) { pointer in
        pointer.withMemoryRebound(
          to: UInt8.self,
          capacity: MemoryLayout<UVersionInfo>.size
        ) { pointer in
          u_versionFromString(pointer, stringPointer)
        }
      }
    }
    self.init(cValue: cValue)
  }
}

extension UnicodeScalar {

  /// The Unicode version in which the receiving scalar was first defined.
  public var unicodeAge: Unicode.Version {
    var version = Unicode.Version(major: 0)
    version.withUnsafeMutableUInt8Pointer { pointer in
      u_charAge(uchar32Value, pointer)
    }
    return version
  }
}
