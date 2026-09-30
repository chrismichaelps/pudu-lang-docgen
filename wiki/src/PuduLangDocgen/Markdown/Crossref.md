---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Crossref.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Crossref

> /** @Docgen.Markdown.Crossref — cross references with display options read from their written forms */

## Purpose

Builds cross reference nodes from their written forms, reading `displayProperty` and `text`
options, and reads the `<xref uid="..."/>` element form.

## Interface

### Signatures

```pudu
export fn span(written: Str, children: Array[Syntax.Inline], line: Int, optional: Bool) -> Syntax.Inline
export fn element(inner: Str, line: Int) -> Option[Syntax.Inline]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Lexicon]] · [[src/PuduLangDocgen/Markdown/Syntax]]
- **Consumed by:** [[src/PuduLangDocgen/Inline]]

## Algorithm

- `span` — A cross reference written as `uid?displayProperty=fullName&text=Label`; given link text wins over the `text` option.
- `element` — The `<xref uid="..." />` element form, read from the text between its angle brackets.

## Negative Logic (Prohibited Paths)

- Do not let the `text` option override text written between the tags.

## Edge Cases

- The `@uid` shorthand is marked optional: unresolved, it keeps its `@` so the text reads as written.

## Depth

SHALLOW. Two small readers shared by the inline parser.

## Grill Log

- Q: Parse options as a URL query? A: Only the two known options, read from the query part. Rejected: arbitrary parameters passed through.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Inline]]
