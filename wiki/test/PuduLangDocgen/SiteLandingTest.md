---
type: test
path: "@root/test/PuduLangDocgen/SiteLandingTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# SiteLandingTest

> /** @Docgen.Site.LandingTests — hub pages render banners, highlights, topic lists, and site footers */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Site/Landing]], [[src/PuduLangDocgen/Site/View]], [[src/PuduLangDocgen/Theme/Layout]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- landing layout
- declared metadata
- banner with escaped summary
- highlight card
- remote highlight kept
- topic card
- related card
- outline
- links recorded for checks
- missing page reported
- no page actions on landing pages
- page actions on articles
- footer links from metadata
- unsafe and nameless footer links dropped
- copyright dated by the build
- navigation toggle
- needs an object
- needs a title
- known item types
- highlights need titles
- topic links need text
- lists must be lists
- list entries must be objects
- banner alone

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Theme/Layout]]
