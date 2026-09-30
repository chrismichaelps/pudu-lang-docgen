---
type: test
path: "@root/test/PuduLangDocgen/BuildTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# BuildTest

> /** @Docgen.Build.Tests — whole-site plans validate before any output is produced */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Build]], [[src/PuduLangDocgen/Build/Checks]], [[src/PuduLangDocgen/Build/Overwrite]], [[src/PuduLangDocgen/Build/Site]], [[src/PuduLangDocgen/Build/Sources]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- artifacts
- resources copied
- warnings travel with the plan
- title with site suffix
- metadata title becomes the heading
- navbar from the root table
- xref to API page
- edit link
- last updated
- canonical address
- governing table in the folder
- breadcrumb trail
- image resolved from nested page
- mention resolved
- redirect page
- overwrite replaced summary
- rest page
- not found page uses the base path
- search index
- sitemap dates
- xrefmap
- manifest version
- warnings as errors
- rules silence codes
- rules raise codes
- model export

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]]
