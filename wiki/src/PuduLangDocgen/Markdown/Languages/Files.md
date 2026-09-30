---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Languages/Files.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Languages.Files

> /** @Docgen.Markdown.Languages.Files — exact file names such as `Dockerfile` mapped to language identities */

## Purpose

Exact file names such as `Dockerfile` and `Makefile` mapped to language identities.

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

- Matching is exact and case sensitive.

## Depth

SHALLOW. Data.

## Grill Log

- Q: A curated subset? A: The complete table. Rejected: missing file names.

## Referenced by

[[src/PuduLangDocgen/Markdown/Languages/_MOC]] · [[src/PuduLangDocgen/Markdown/Languages]]
