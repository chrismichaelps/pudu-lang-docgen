---
type: test
path: "@root/test/PuduLangDocgen/ReferencesTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ReferencesTest

> /** @Docgen.References.Tests — identities stay unique and maps round-trip */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/References]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- own identity wins
- external added
- no problems
- duplicate identity refused
- yaml map
- yaml round trip with base
- quoted scalars survive
- json round trip
- relative to remote origin
- name defaults to uid
- unsafe href refused
- missing uid refused
- not a mapping refused
- service list answer
- empty service answer
- service answer not a list of mappings
- service address encodes the identity
- service address without slot unchanged
- unresolved identities once each
- nothing unresolved
- pages become references

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/References]]
