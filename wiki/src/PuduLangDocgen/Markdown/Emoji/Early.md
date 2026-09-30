---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Emoji/Early.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Emoji.Early

> /** @Docgen.Markdown.Emoji.Early — emoji short codes a to l */

## Purpose

Short codes `a` to `l` generated from the complete Unicode emoji list.

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

- Skin tone and gender variants are separate codes.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete list. Rejected: missing emoji surprising authors.

## Referenced by

[[src/PuduLangDocgen/Markdown/Emoji/_MOC]] · [[src/PuduLangDocgen/Markdown/Emoji]]
