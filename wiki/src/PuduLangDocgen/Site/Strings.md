---
type: module
path: "@root/src/PuduLangDocgen/Site/Strings.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Site.Strings

> /** @Docgen.Site.Strings — interface text of the default layout by language */

## Purpose

Interface text of the default layout in English, Spanish, French, German, Portuguese,
Italian, Japanese, Chinese, and Korean, with `_text` overrides from metadata.

## Interface

### Signatures

```pudu
export fn forLanguage(tag: Str, overrides: &Array[(Str, Docgen.Meta)]) -> Docgen.Meta
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Site/View]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `forLanguage` — Interface text for a language tag with `_text` overrides from metadata applied. Unknown languages use English.

## Negative Logic (Prohibited Paths)

- Do not fail on an unknown language; it falls back to English.

## Edge Cases

- Only the primary subtag of a language tag is used.

## Depth

SHALLOW. Tables.

## Grill Log

- Q: Ship every language? A: Common languages built in, any other through `_text`. Rejected: large partial translations.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Site/View]]
