---
type: test
path: "@root/test/PuduLangDocgen/TemplateTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# TemplateTest

> /** @Docgen.Template.Tests — templates fill metadata exactly and refuse malformed tags */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Template]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- escaped value
- raw values
- numbers and flags
- missing value empty
- list section
- scalar list with dot
- truthy and falsy sections
- inverted sections
- object section scopes
- dotted names
- partials see the context
- unknown partial empty
- comments dropped
- unclosed section
- mismatched section
- stray close
- unclosed tag

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Template]]
