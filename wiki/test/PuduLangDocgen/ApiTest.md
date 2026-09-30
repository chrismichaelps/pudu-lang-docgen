---
type: test
path: "@root/test/PuduLangDocgen/ApiTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ApiTest

> /** @Docgen.Api.Tests — Pudu declarations become linked reference pages */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Api/Lexer]], [[src/PuduLangDocgen/Api/Parser]], [[src/PuduLangDocgen/Api/Catalog]], [[src/PuduLangDocgen/Api/Pages]], [[src/PuduLangDocgen/Api/Export]], [[src/PuduLangDocgen/Api/Sheet]], [[src/PuduLangDocgen/Api/Signature]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- tokens skip nested comments and keep literals
- module identity and anchor text
- imports
- record signature without docs
- long records print a field per line
- declaration kinds
- exported flags
- variants
- fields and their docs
- alias target
- trait methods
- function signature
- function parameters
- constant value shown
- implementation
- summary and remarks
- private members dropped
- private members kept on request
- exclude patterns
- include patterns keep the module
- reference destinations
- toc lists types
- source link
- signature links through imports
- unknown names stay text
- pages per module and type
- module page sections
- demoted doc headings
- parameters listed
- source links shown
- variants table
- implemented traits
- trait implementors
- related functions
- field docs rendered
- nested module navigation
- separate member pages
- plain documentation
- filter rules
- bad filter
- category labels
- category groups
- alphabetic variants
- source links excluded
- kind names

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Api/Lexer]] · [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Api/Signature]]
