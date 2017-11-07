# ICU for Swift

[![Build Status](https://travis-ci.org/allevato/icu-swift.svg?branch=master)](https://travis-ci.org/allevato/icu-swift)

This package implements Swift-style APIs for [ICU (International Components
for Unicode)](http://site.icu-project.org) for Swift 4.

Swift already provides great support for working with strings, characters, code
points, and code units of various encodings in a Unicode-safe way. This library
fills in some of the more detailed functionality not in the standard library.

## Usage note

If you are using this library (or ICU in general) in an application meant for
distribution on the App Store, Apple considers the ICU dynamic library included
with the operating system to be private API and will reject the submission.

This can be worked around; the solution is to **statically link ICU in your
application** instead of relying on the system version.

## Changelog

* **0.1.3 (2017.10.30):** Fixes the missing `usearch.h` dependency by updating
  to the correct version of `icu4c`, which wasn't caught when working in Xcode.

* **0.1.2 (2017.10.07):** Fix `text` and `pattern` setters in `SearchCursor`.

* **0.1.1 (2017.10.07):** Add `SearchCursor`, which wraps ICU's search iterator.

* **0.1.0 (2017.06.23):** Initial release. Adds a number of custom types to the
  `Unicode` namespace and corresponding properties and methods to
  `UnicodeScalar`.

## Future work

* Wrap more ICU core features, like break iterators
* Easier integration with iOS, tvOS, watchOS (not using Swift Package Manager)
