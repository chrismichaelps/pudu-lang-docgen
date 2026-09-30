---
type: test
path: "@root/test/PuduLangDocgen/RestTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# RestTest

> /** @Docgen.Rest.Tests — interface descriptions become operation and schema references */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Rest/OpenApi]], [[src/PuduLangDocgen/Rest/Pages]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- recognized
- title and version
- servers
- operations in path order
- shared path parameter
- response content
- request body
- deprecated flag
- schemas sorted
- schema properties
- enumerations
- body parameter becomes a payload
- older response schema
- generated operation id
- title required
- describe combinations
- references
- no problems
- outline groups by tag
- method badge and path
- schema links
- description rendered
- deprecated badge

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Rest/Pages]]
