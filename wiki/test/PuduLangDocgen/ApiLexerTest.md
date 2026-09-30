---
type: test
path: "@root/test/PuduLangDocgen/ApiLexerTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ApiLexerTest

> /** @Docgen.Api.LexerTests — source boundaries, literals, and comments lex without loss */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Api/Lexer]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- lines after comments and strings
- kinds
- line comment at the end
- bare comment marker at the end
- four slashes are no doc
- empty block is no doc
- unclosed block comment
- unclosed doc block
- doc block lines
- unclosed string
- closing brace outside interpolation
- escaped quote in string
- character after a backslash
- quoted word is not a character
- quote after a word
- lone quote
- quote at the end
- escape at the end
- escaped character
- overlong escape
- longest escape
- operator pairs
- symbol at the end
- underscored words

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Api/Lexer]]
