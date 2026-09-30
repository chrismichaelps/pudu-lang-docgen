---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Highlight.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Highlight

> /** @Docgen.Markdown.Highlight — static syntax coloring for code samples */

## Purpose

Colors code samples at build time: comments, strings, numbers, and keywords, chosen by the
language identity, with every line escaped.

## Interface

### Signatures

```pudu
export fn lines(language: Str, text: Str) -> Array[Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Languages]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Markdown/Render]] · [[test/PuduLangDocgen/LanguagesTest]]

## Algorithm

- `lines` — Escaped HTML of each line, with tokens of known languages wrapped in `hl-*` spans. Unknown languages are escaped without coloring.

## Negative Logic (Prohibited Paths)

- Do not emit unescaped source text.
- Do not load a script to color code in the browser.

## Edge Cases

- Unknown languages are escaped without coloring.
- Languages sharing a profile, such as C-like ones, share keywords.

## Depth

MODERATE. A small scanner per language family behind one call.

## Grill Log

- Q: Client-side coloring? A: Static coloring, so pages work without scripts. Rejected: a script on every page with code.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Markdown/Render]]
