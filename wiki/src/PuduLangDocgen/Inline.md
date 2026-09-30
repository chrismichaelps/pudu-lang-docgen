---
type: module
path: "@root/src/PuduLangDocgen/Inline.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Inline

> /** @Docgen.Inline.Module — phrasing syntax parsed into article inline nodes */

## Purpose

Parses phrasing content into inline nodes: emphasis and strong by delimiter runs, code spans,
links and images in inline, reference, collapsed, and shortcut forms, autolinks and bare web
addresses, character references, emoji short codes, footnote references, cross references in
every written form, math, raw inline HTML, hard and soft breaks, and the extras `~sub~`, `^sup^`,
`++inserted++`, and `==marked==`.

## Interface

### Signatures

```pudu
export fn parse(text: Str, definitions: &Map[Str, Syntax.Target], line: Int) -> Array[Syntax.Inline]
export fn label(text: Str) -> Str
export fn plain(inlines: &Array[Syntax.Inline]) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Crossref]] · [[src/PuduLangDocgen/Markdown/Lexicon]] · [[src/PuduLangDocgen/Markdown/Syntax]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Render]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

- `parse` — Phrasing content of a block whose text starts at the given one-based line.
- `label` — A reference label compared case-insensitively with collapsed white space.
- `plain` — The text a reader sees, without markup.

## Negative Logic (Prohibited Paths)

- Do not let a link destination through without its title and line; the renderer checks it later.
- Do not parse inside code spans or math.

## Edge Cases

- Unmatched delimiters stay literal text.
- `~~strike~~` and `~sub~` share the tilde and are told apart by run length.
- Trailing punctuation stays outside bare web addresses.

## Depth

DEEP. One call hides the delimiter stack and every inline form.

## Grill Log

- Q: Parse emphasis greedily left to right? A: A delimiter stack with the left- and right-flanking rules, so nesting reads as authors expect. Rejected: regular expressions per form.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Render]]
