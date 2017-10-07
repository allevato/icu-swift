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

/// Errors that can be thrown when creating a `RuleBasedBreakCursor`.
public enum BreakRuleParseError: Error {

  /// An internal error (bug) was detected.
  case internalError(context: ParseErrorContext)

  /// Hexadecimal digits were expected but not found (e.g., part of an escaped
  /// character in a rule).
  case hexDigitsExpected(context: ParseErrorContext)

  /// The semicolon was missing at the end of a rule.
  case semicolonExpected(context: ParseErrorContext)

  /// There was a syntax error in a rule.
  case ruleSyntax(context: ParseErrorContext)

  /// A Unicode set within a rule was missing the closing "]".
  case unclosedSet(context: ParseErrorContext)

  /// There was a syntax error in a rule assignment statement.
  case assignError(context: ParseErrorContext)

  /// A `$variable` was redefined.
  case variableRedefinition(context: ParseErrorContext)

  /// There were mismatched parentheses in a rule.
  case mismatchedParentheses(context: ParseErrorContext)

  /// There was a missing closing quote in a rule.
  case newLineInQuotedString(context: ParseErrorContext)

  /// A `$variable` was used that was not defined.
  case undefinedVariable(context: ParseErrorContext)

  /// An error occurred during initialization (maybe ICU data is missing?).
  case initializationError(context: ParseErrorContext)

  /// A rule contained an empty Unicode set.
  case ruleEmptySet(context: ParseErrorContext)

  /// An `!!option` in a rule was not recognized.
  case unrecognizedOption(context: ParseErrorContext)

  /// The `{nnn}` tag on a rule was malformed.
  case malformedRuleTag(context: ParseErrorContext)

  /// Creates a new parse error with the given ICU error code and context.
  ///
  /// - Parameters:
  ///   - cValue: The underlying ICU C error code.
  ///   - context: The `ParseErrorContext` that describes where the error
  ///     occurred during parsing.
  init(cValue: UErrorCode, context: ParseErrorContext) {
    let factory: (ParseErrorContext) -> BreakRuleParseError

    switch cValue {
    case U_BRK_INTERNAL_ERROR: factory = BreakRuleParseError.internalError
    case U_BRK_HEX_DIGITS_EXPECTED:
      factory = BreakRuleParseError.hexDigitsExpected
    case U_BRK_SEMICOLON_EXPECTED:
      factory = BreakRuleParseError.semicolonExpected
    case U_BRK_RULE_SYNTAX: factory = BreakRuleParseError.ruleSyntax
    case U_BRK_UNCLOSED_SET: factory = BreakRuleParseError.unclosedSet
    case U_BRK_ASSIGN_ERROR: factory = BreakRuleParseError.assignError
    case U_BRK_VARIABLE_REDFINITION:
      factory = BreakRuleParseError.variableRedefinition
    case U_BRK_MISMATCHED_PAREN:
      factory = BreakRuleParseError.mismatchedParentheses
    case U_BRK_NEW_LINE_IN_QUOTED_STRING:
      factory = BreakRuleParseError.newLineInQuotedString
    case U_BRK_UNDEFINED_VARIABLE:
      factory = BreakRuleParseError.undefinedVariable
    case U_BRK_INIT_ERROR: factory = BreakRuleParseError.initializationError
    case U_BRK_RULE_EMPTY_SET: factory = BreakRuleParseError.ruleEmptySet
    case U_BRK_UNRECOGNIZED_OPTION:
      factory = BreakRuleParseError.unrecognizedOption
    case U_BRK_MALFORMED_RULE_TAG:
      factory = BreakRuleParseError.malformedRuleTag
    default: fatalError("Internal error: error code not supported")
    }

    self = factory(context)
  }
}
