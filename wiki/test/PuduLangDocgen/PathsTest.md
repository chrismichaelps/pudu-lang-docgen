---
type: test
path: "@root/test/PuduLangDocgen/PathsTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# PathsTest

> /** @Docgen.Paths.Tests — publication boundaries and destination escaping remain observable */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Paths]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- portable relative paths
- unicode path
- invalid publication paths
- safe browser destinations
- unsafe browser destinations
- slug separators collapse
- slug unicode preserved
- empty slug fallback
- article suffix mapping
- relative resolution and query
- same page fragments
- same page queries
- external stays external
- root escape is refused
- encoded local path refused
- unsafe source refused
- unsafe destination refused
- dot segments resolve
- empty destination segment refused
- invalid local output refused
- html escaping exact

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Paths]]
