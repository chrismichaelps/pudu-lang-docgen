---
type: module
path: "@root/src/PuduLangDocgen/Markdown/FrontMatter.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.FrontMatter

> /** @Docgen.Markdown.FrontMatter — YAML header split from article body lines */

## Purpose

Splits a leading YAML header from the body and numbers the remaining lines so diagnostics point
at the original file.

## Interface

### Signatures

```pudu
export type Line = { text: Str, number: Int }
export type Header = { meta: Array[(Str, Docgen.Meta)], lines: Array[Line] }
export fn split(text: Str) -> Result[Header, (Int, Str)]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Leaves]]

## Algorithm

- `split` — Metadata from a leading `---` block and the numbered lines after it. A header that is not a YAML mapping fails with its one-based line.

## Negative Logic (Prohibited Paths)

- Do not accept a header that is not a mapping.

## Edge Cases

- An unclosed header fails with the line it opened on.
- A file without a header keeps every line.

## Depth

SHALLOW. One split with line bookkeeping.

## Grill Log

- Q: Renumber lines after the header? A: Keep original numbers. Rejected: diagnostics off by the header length.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Leaves]]
