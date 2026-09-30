---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Languages.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Languages

> /** @Docgen.Markdown.Languages — language identities, aliases, extensions, and display names */

## Purpose

Language identity from a fence name, alias, file extension, or file name, and the display name
of an identity, following the linguist language table with Pudu added.

## Interface

### Signatures

```pudu
export fn identify(written: Str) -> Str
export fn ofPath(path: Str) -> Str
export fn title(identity: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Languages/Extensions]] · [[src/PuduLangDocgen/Markdown/Languages/Files]] · [[src/PuduLangDocgen/Markdown/Languages/Names]] · [[src/PuduLangDocgen/Markdown/Languages/Titles]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown/Render]] · [[test/PuduLangDocgen/LanguagesTest]]

## Algorithm

- `identify` — The identity of a language named by its name or an alias in any case, such as `js` or `JavaScript` for `javascript`. Unknown names answer themselves in lower case. Identities follow the language table published by the linguist project, with Pudu added.
- `ofPath` — The identity of the language a file is written in, from its exact name or its extension, or the empty text.
- `title` — The display name of a language identity, such as `JavaScript`; unknown identities answer themselves.

## Negative Logic (Prohibited Paths)

- Do not invent identities; unknown names answer themselves in lower case.

## Edge Cases

- `Dockerfile` and similar names are matched as whole file names.

## Depth

SHALLOW. Lookups over four data modules.

## Grill Log

- Q: Keep a short list? A: The complete table. Rejected: common fences without names.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown/Render]]
