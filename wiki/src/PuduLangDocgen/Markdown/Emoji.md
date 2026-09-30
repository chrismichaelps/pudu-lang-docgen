---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Emoji.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Emoji

> /** @Docgen.Markdown.Emoji — short codes for every fully-qualified Unicode 18.0 emoji */

## Purpose

Looks up emoji short codes across the split tables, covering every fully qualified Unicode 18.0
emoji plus common aliases such as `tada`, `smile`, and `+1`.

## Interface

### Signatures

```pudu
export fn lookup(code: Str) -> Option[Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Emoji/Early]] · [[src/PuduLangDocgen/Markdown/Emoji/Late]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Lexicon]] · [[test/PuduLangDocgen/LanguagesTest]]

## Algorithm

- `lookup` — The emoji a short code names without its colons. Codes are Unicode names in lower case joined by underscores, such as `thumbs_up_medium_skin_tone` or `flag_japan`, and the common short aliases such as `tada`, `smile`, and `+1`.

## Negative Logic (Prohibited Paths)

- Do not guess a code that is not in the tables.

## Edge Cases

- Codes are matched exactly as written between the colons.

## Depth

SHALLOW. A router over two data modules.

## Grill Log

- Q: One table? A: Two halves by first letter, keeping each file under the size limit. Rejected: a single oversized file.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown/Lexicon]]
