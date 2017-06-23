# ICU for Swift

This package implements Swift-style APIs for [ICU (International Components
for Unicode)](http://site.icu-project.org) for Swift 4.

Swift already provides great support for working with strings, characters, code
points, and code units of various encodings in a Unicode-safe way. This library
fills in some of the more detailed functionality not in the standard library.

The current version adds a number of custom types to the `Unicode` namespace
and corresponding properties and methods to `UnicodeScalar`.

## Future work

* Wrap more ICU core features, like break iterators
* Easier integration with iOS, tvOS, watchOS (not using Swift Package Manager)
