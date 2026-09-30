---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Languages/Titles.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Languages.Titles

> /** @Docgen.Markdown.Languages.Titles — language identities mapped to display names */

## Purpose

Language identities mapped to their display names for code captions and tabs.

## Interface

### Signatures

```pudu
export fn lookup(key: Str) -> Option[Str]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Languages]]

## Algorithm

- `lookup` — The value stored for a key.

## Negative Logic (Prohibited Paths)

- Do not edit by hand; regenerate from the full table.

## Edge Cases

- Identities without a title display as themselves.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete table. Rejected: raw identities in captions.

## Referenced by

[[src/PuduLangDocgen/Markdown/Languages/_MOC]] · [[src/PuduLangDocgen/Markdown/Languages]]
