---
type: test
path: "@root/test/PuduLangDocgen/NavigationTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# NavigationTest

> /** @Docgen.Navigation.Tests — tables of contents parse, nest, and bind to pages */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Navigation]], [[src/PuduLangDocgen/Navigation/Resolve]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- yaml items
- compact nested sequence
- items object
- json items
- markdown items nest
- display name wins
- expanded flag
- empty file
- invalid yaml
- invalid json
- not a list
- unknown field
- nameless item
- table metadata
- titles taken from pages
- unsafe href
- unsafe markdown href
- recognized names
- resolved titles
- local href mapped
- folder brings nested items
- folder links its first page
- fragment kept
- uid resolves
- remote kept
- missing target warns
- cycles refused
- governing by folder
- linking tables win
- lower order wins
- pages of a tree
- output of toc
- trail
- deepest item wins the trail
- name-only items become labels
- reading order
- neighbors
- unlisted page has no neighbors
- pages fallback

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]]
