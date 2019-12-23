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

import XCTest

/// Asserts that the given index is a certain distance from the start of a
/// collection.
///
/// - Parameters:
///   - index: The index to assert. A test failure occurs if this is `nil`.
///   - distance: The expected distance from the start of the collection to
///     `index`.
///   - collection: The collection whose `startIndex` will be compared to
///     `index`.
func assertIndex<C: Collection>(
  _ index: C.Index?,
  isDistance distance: Int,
  fromStartOf collection: C,
  file: StaticString = #file,
  line: UInt = #line
) {
  guard let index = index else {
    XCTFail("expected index to be non-nil", file: file, line: line)
    return
  }
  XCTAssertEqual(
    collection.distance(from: collection.startIndex, to: index),
    distance,
    file: file,
    line: line)
}
