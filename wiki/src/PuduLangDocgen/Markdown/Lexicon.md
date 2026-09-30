---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Lexicon.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Lexicon

> /** @Docgen.Markdown.Lexicon — character references, short codes, tags, and web addresses */

## Purpose

Low-level readers used while parsing inlines: character references, emoji short codes, bare web
addresses, autolinks, allowed inline tags, and attribute values.

## Interface

### Signatures

```pudu
export fn slice(cs: &Array[Char], from: Int, to: Int) -> Str
export fn blank(character: Char) -> Bool
export fn entity(cs: &Array[Char], index: Int, to: Int) -> Option[(Str, Int)]
export fn emoji(cs: &Array[Char], index: Int, to: Int) -> Option[(Str, Int)]
export fn address(cs: &Array[Char], index: Int, to: Int) -> Option[(Str, Int)]
export fn autolink(inner: Str) -> Option[Str]
export fn tag(inner: Str) -> Option[Str]
export fn attribute(element: Str, name: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Markdown/Emoji]] · [[src/PuduLangDocgen/Markdown/Entities]]
- **Consumed by:** [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Crossref]]

## Algorithm

- `slice` — Text of the characters in a half-open range.
- `blank` — Whether a character counts as white space between words.
- `entity` — A decoded character reference at an index and the index after it.
- `emoji` — The emoji a `:name:` short code at an index stands for, and the index after it.
- `address` — A bare web address starting with `http://`, `https://`, or `www.`, and the index after it. Trailing punctuation and unbalanced closing parentheses stay outside the address.
- `autolink` — Whether text inside angle brackets is an autolink, answering its destination.
- `tag` — Allowed inline HTML rebuilt without attributes other than `title`, or none for other tags.
- `attribute` — The double-quoted value of a named attribute inside a tag, or the empty text.

## Negative Logic (Prohibited Paths)

- Do not keep attributes on inline tags other than `title`.

## Edge Cases

- Unbalanced closing parentheses stay outside a bare address.
- Numeric references outside the Unicode range become the replacement character.

## Depth

MODERATE. Character-level readers with no state.

## Grill Log

- Q: Allow `class` and `style` on inline HTML? A: Only `title`. Rejected: author styling leaking past the theme.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Crossref]]
