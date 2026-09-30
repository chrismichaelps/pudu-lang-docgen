---
type: module
path: "@root/src/PuduLangDocgen/Site/Search.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Search

> /** @Docgen.Site.Search — the searchable text of published pages */

## Purpose

The search index: href, title, summary, and visible text of every indexable page, with
scripts, styles, and buttons left out.

## Interface

### Signatures

```pudu
export fn index(pages: &Array[Docgen.Page]) -> Str
export fn plainText(html: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Build/Site]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `index` — The search index as JSON: href, title, summary, and text of every indexable page. Pages with `_noindex` and redirect pages are left out.
- `plainText` — Visible text of HTML with white space collapsed and common references decoded.

## Negative Logic (Prohibited Paths)

- Do not index pages with `_noindex` or redirect pages.
- Do not keep more page text than the index limit.

## Edge Cases

- Common character references are decoded before indexing.

## Depth

MODERATE. Text extraction and one JSON document.

## Grill Log

- Q: Hosted search service? A: A static index the site script ranks. Rejected: a service dependency.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build/Site]]
