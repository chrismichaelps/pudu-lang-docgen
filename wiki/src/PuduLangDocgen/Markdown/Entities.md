---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Entities.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Entities

> /** @Docgen.Markdown.Entities — every named character reference of the HTML standard */

## Purpose

Every named character reference of the HTML standard mapped to its text.

## Interface

### Signatures

```pudu
export fn lookup(name: Str) -> Option[Str]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Lexicon]]

## Algorithm

- `lookup` — The text a character reference name stands for, written without `&` and `;`.

## Negative Logic (Prohibited Paths)

- Do not decode names that are not in the standard table.

## Edge Cases

- Names are case sensitive: `&Alpha;` and `&alpha;` differ.

## Depth

SHALLOW. Data.

## Grill Log

- Q: Only the common references? A: The complete table. Rejected: references that render literally.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown/Lexicon]]
