---
type: test
path: "@root/test/PuduLangDocgen/ConfigurationTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ConfigurationTest

> /** @Docgen.Configuration.Tests — project configuration reads typed options and refuses mistakes */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Configuration]], [[src/PuduLangDocgen/Configuration/Fields]], [[src/PuduLangDocgen/Configuration/Rules]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- defaults
- content mapping
- plain glob mapping
- metadata source
- more metadata options
- filter file
- groups
- unknown group
- api sources may sit above the project
- content may not
- bounded ascent
- distinct api destinations
- web repository
- renderer output
- xref entries
- xref services
- xref services default empty
- xref service needs a slot
- xref service must be web
- output and templates
- global and file metadata
- switches
- contribution
- rules and alerts
- diagrams
- sitemap
- pdf renderer
- yaml configuration
- yaml read by name
- not json
- not an object
- unknown top option
- unknown build option
- wrong type
- escaping folder
- project folder as output
- mapping needs files
- rule level
- sitemap address
- sitemap priority
- sitemap frequency
- metadata needs sources
- metadata format
- member layout
- diagram mode
- file metadata shape

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]]
