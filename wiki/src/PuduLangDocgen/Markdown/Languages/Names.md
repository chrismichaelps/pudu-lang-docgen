---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Languages/Names.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Languages.Names

> /** @Docgen.Markdown.Languages.Names — language names and aliases, in lower case, mapped to language identities */

## Purpose

Language names and aliases, in lower case, mapped to language identities.

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

- Aliases such as `js` and `sh` resolve to their language.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete table. Rejected: missing aliases.

## Referenced by

[[src/PuduLangDocgen/Markdown/Languages/_MOC]] · [[src/PuduLangDocgen/Markdown/Languages]]
