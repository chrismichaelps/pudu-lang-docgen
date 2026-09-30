---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Languages/Extensions.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Languages.Extensions

> /** @Docgen.Markdown.Languages.Extensions — file extensions, without the dot and in lower case, mapped to language identities */

## Purpose

File extensions, lower case and without the dot, mapped to language identities.

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

- Each extension maps to exactly one identity.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete table. Rejected: missing extensions.

## Referenced by

[[src/PuduLangDocgen/Markdown/Languages/_MOC]] · [[src/PuduLangDocgen/Markdown/Languages]]
