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

extension UErrorCode {

  /// True if the error code is a success error code.
  var isSuccess: Bool {
    return rawValue <= U_ZERO_ERROR.rawValue
  }

  /// Creates a new error code equal to `U_ZERO_ERROR`.
  init() {
    self = U_ZERO_ERROR
  }
}
