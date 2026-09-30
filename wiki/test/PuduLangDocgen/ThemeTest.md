---
type: test
path: "@root/test/PuduLangDocgen/ThemeTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# ThemeTest

> /** @Docgen.Theme.Tests — the layout, its overrides, and site-wide files render as specified */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Theme]], [[src/PuduLangDocgen/Site/View]], [[src/PuduLangDocgen/Site/Strings]], [[src/PuduLangDocgen/Site/Search]], [[src/PuduLangDocgen/Site/Sitemap]], [[src/PuduLangDocgen/Site/Print]], [[src/PuduLangDocgen/Site/Format]], [[src/PuduLangDocgen/Site/Gallery]], [[src/PuduLangDocgen/Site/Redirect]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- assets
- stylesheet has both schemes and print
- escaped tab title
- language
- localized text
- description and keywords
- social cards
- custom meta
- canonical and structured data
- analytics
- navbar active
- toc tree
- breadcrumb
- actions
- pager
- affix
- math script
- landing drops navigation panes
- chromeless drops header and footer
- footer shown by default
- footer switched off
- partial override
- invalid template
- strings fall back to English
- string override
- plain text
- search skips hidden pages
- sitemap
- print rebasing
- print documents
- tables without pdf print nothing
- formatted html
- gallery cards
- gallery needs names
- redirect

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Theme]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Site/Strings]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Format]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Redirect]]
