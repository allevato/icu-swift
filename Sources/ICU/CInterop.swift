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

/// Namespace containing helper functions for interoperating with C APIs.
enum CInterop {

  /// Wraps a value in a heap-allocated object and then executes the given
  /// block, passing it a pointer to the object.
  ///
  /// This is intended to be used to pass value types and function references to
  /// C functions -- in particular, those that take callbacks and `void *`
  /// context arguments. The wrapping object, and thus the underlying value, is
  /// guaranteed to exist during the execution of the closure.
  ///
  /// Because the value type is wrapped, be aware that the value that you get
  /// back on the other side (by calling `unwrappedValue(from:)`) will be a copy
  /// and that mutating it will not affect the original value.
  ///
  /// - Parameters:
  ///   - value: An arbitrary value.
  ///   - block: A block that will be passed the raw pointer to the object
  ///     wrapping the value.
  /// - Returns: Whatever `block` returns.
  /// - Throws: Whatever `block` throws.
  static func withPointer<
    Value,
    Result
  >(
    wrapping value: Value,
    _ block: (UnsafeMutableRawPointer) throws -> Result
  ) rethrows -> Result {
    let wrapper = ValueWrapper(wrapping: value)
    let pointer = Unmanaged.passUnretained(wrapper).toOpaque()
    return try block(pointer)
  }

  /// Returns a copy of a value that has been wrapped by
  /// `withPointer(wrapping:block:)`.
  ///
  /// The behavior of this function is undefined if the return type `T` does not
  /// match the type of the value originally passed to
  /// `withPointer(wrapping:block:)`.
  ///
  /// - Parameter pointer: An opaque pointer to a wrapped value that was
  ///   obtained by calling `withPointer(wrapping:block:)`.
  /// - Returns: A copy of the value that was wrapped by the opaque pointer.
  static func unwrappedValue<T>(from pointer: UnsafeRawPointer) -> T {
    let unmanaged = Unmanaged<ValueWrapper<T>>.fromOpaque(pointer)
    return unmanaged.takeUnretainedValue().wrapped
  }
}

/// Used by `CInterop.withPointer(wrapping:block:)` to wrap arbitrary values in
/// a heap-allocated object.
private class ValueWrapper<Value> {

  /// The wrapped value.
  let wrapped: Value

  /// Creates a new wrapper for the given value.
  ///
  /// - Parameter value: The value to wrap.
  init(wrapping value: Value) {
    self.wrapped = value
  }
}
