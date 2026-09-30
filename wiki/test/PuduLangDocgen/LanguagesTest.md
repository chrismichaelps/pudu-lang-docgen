---
type: test
path: "@root/test/PuduLangDocgen/LanguagesTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# LanguagesTest

> /** @Docgen.Languages.Tests — language and emoji tables answer published identities */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Markdown/Languages]], [[src/PuduLangDocgen/Markdown/Highlight]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- aliases identify languages
- extensions identify files
- exact file names win
- display names
- shared profiles highlight
- unknown language escapes only
- block comment spans lines
- hash comment needs a word boundary
- strings and literals
- emoji names and aliases

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Markdown/Languages]] · [[src/PuduLangDocgen/Markdown/Highlight]]
