// swift-tools-version:5.0

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

import PackageDescription

let package = Package(
  name: "icu-swift",
  products: [
    .library(
      name: "swiftICU",
      type: .static,
      targets: ["ICU"]),
  ],
  targets: [
    .target(
      name: "ICU",
      dependencies: ["ICU4C"]),
    .systemLibrary(
      name: "ICU4C",
      pkgConfig: "icu-uc",
      providers: [
        .brew(["icu4c"]),
        .apt(["libicu-dev"]),
      ]),
    .testTarget(
      name: "ICUTests",
      dependencies: ["ICU"]),
  ]
)
