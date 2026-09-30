---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Directives.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Directives

> /** @Docgen.Markdown.Directives — authoring extension syntax recognized per line */

## Purpose

Recognizes authoring extensions line by line: `:::name` containers and their attributes, alert
markers, video lines, tab headings, footnote definitions, whole-line includes, code excerpts,
container extents, and row columns.

## Interface

### Signatures

```pudu
export type Directive = { name: Str, attributes: Array[(Str, Str)], closed: Bool }
export type TabHeading = { level: Int, title: Str, id: Str, condition: Str }
export type Excerpt = { language: Str, name: Str, destination: Str, title: Str }
export fn colon(text: Str) -> Option[Directive]
export fn value(found: &Directive, key: Str) -> Str
export fn attributes(text: Str) -> Array[(Str, Str)]
export fn alert(text: Str) -> Option[(Str, Str)]
export fn video(text: Str) -> Option[Str]
export fn tab(text: Str) -> Option[TabHeading]
export fn footnote(text: Str) -> Option[(Str, Str)]
export fn include(text: Str) -> Option[(Str, Str)]
export fn excerpt(text: Str) -> Option[Excerpt]
export fn extent(lines: &Array[FrontMatter.Line], start: Int, name: Str) -> Int
export fn columns(lines: &Array[FrontMatter.Line]) -> Array[(Int, Array[FrontMatter.Line])]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/FrontMatter]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Sanitize]]

## Algorithm

- `colon` — A `:::name key="value" flag:::` line; `closed` tells whether it ends on the same line.
- `value` — The value of an attribute, or the empty text.
- `attributes` — `key="value"` pairs and bare flags, in written order.
- `alert` — The alert kind of a quote's first line `[!NOTE]`, uppercased, with any text after it.
- `video` — The address of a `[!Video address]` line.
- `tab` — A tab heading `# [Title](#tab/id/condition)`.
- `footnote` — The label and first line of a footnote definition `[^label]: text`.
- `include` — The title and path of a whole-line `[!INCLUDE[title](path)]`.
- `excerpt` — A whole-line `[!code-language[name](path "title")]` excerpt.
- `extent` — The index of the `:::name-end:::` line closing a container opened at an index, or -1. Containers of the same name nest.
- `columns` — The columns of a row body: each `:::column span="n":::` up to its `:::column-end:::`. Lines outside any column are ignored.

## Negative Logic (Prohibited Paths)

- Do not decide block structure; it only recognizes lines for [[src/PuduLangDocgen/Markdown/Blocks]].

## Edge Cases

- Attributes accept quoted values and bare flags in written order.
- Containers with the same name nest.

## Depth

MODERATE. Pure recognizers with no state.

## Grill Log

- Q: Single regular expression per directive? A: Small hand readers with exact rules. Rejected: patterns that accept near misses.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Sanitize]]
