---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Emoji/Late.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Emoji.Late

> /** @Docgen.Markdown.Emoji.Late — emoji short codes m to z, digits, and signs */

## Purpose

Short codes `m` to `z`, digits, and signs generated from the complete Unicode emoji list.

## Interface

### Signatures

```pudu
export fn lookup(code: Str) -> Option[Str]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Emoji]]

## Algorithm

- `lookup` — The emoji a short code names.

## Negative Logic (Prohibited Paths)

- Do not edit by hand; regenerate from the full list.

## Edge Cases

- Keycap and flag codes live here.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete list. Rejected: missing emoji surprising authors.

## Referenced by

[[src/PuduLangDocgen/Markdown/Emoji/_MOC]] · [[src/PuduLangDocgen/Markdown/Emoji]]
