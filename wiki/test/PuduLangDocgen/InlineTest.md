---
type: test
path: "@root/test/PuduLangDocgen/InlineTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# InlineTest

> /** @Docgen.Inline.Tests — phrasing trees, file mapping, overwrites, checks, YAML, and history */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Inline]], [[src/PuduLangDocgen/Markdown/Lexicon]], [[src/PuduLangDocgen/Markdown/Crossref]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- text and emphasis tree
- link line numbers
- angle destination with spaces
- balanced parentheses in destination
- unclosed bracket stays text
- quoted mention
- xref element
- labels normalize
- plain text
- deep nesting stays bounded
- mapping with source and destination
- first mapping wins
- overwrite sections
- overwrite metadata
- overwrite without uid
- no overwrite problems
- anchors
- missing fragment
- present fragment
- output collisions
- rules and strict mode
- yaml writes and reads back
- yaml scalars quoted when needed
- block scalars in list items
- folded and stripped scalars
- remote addresses normalized
- environment overrides
- other services
- history takes the newest date

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Lexicon]] · [[src/PuduLangDocgen/Markdown/Crossref]]
