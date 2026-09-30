---
type: module
path: "@root/src/PuduLangDocgen/Site/Gallery.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Gallery

> /** @Docgen.Site.Gallery — catalog pages listing extensions as entries */

## Purpose

Catalog pages marked `YamlMime:Dashboard`: a title, a description, `defaults` every item
inherits, and items listed as entries with a kind label, name, facts, description, usage lines,
and a source link.

## Interface

### Signatures

```pudu
export type Rendered = { title: Str, body: Str, headings: Array[Docgen.Heading], links: Array[Docgen.Link], diagnostics: Array[Docgen.Diagnostic] }
export const MARKER: Str = "YamlMime:Dashboard"
export fn render(value: &Docgen.Meta, context: &Phrase.Scope) -> Result[Rendered, Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `render` — A catalog page: `title`, an optional `description`, optional `defaults` every item inherits, and `items`, each with a `name` and any of `description`, `type`, `author`, `version`, `license`, `thumbnail`, `homepage`, `repository.url`, and `usage` entries. Local addresses are source paths checked like article links.

## Negative Logic (Prohibited Paths)

- Do not show an item without a name.
- Do not emit a homepage, thumbnail, or source address without checking it like an article link.
- Do not repeat per-item facts the catalog can state once in `defaults`.

## Edge Cases

- An item's own fields win over `defaults`.
- Usage lines appear in a fixed order: Install, Set up, Run, Configure.
- A missing thumbnail is reported as a missing image; a missing homepage as a broken link.

## Depth

MODERATE. One page kind with its own list layout.

## Grill Log

- Q: Cards with images? A: A registry-style list: name and kind beside the description, rules between entries. Rejected: cropped logos repeated on every card.
- Q: Free-form entry fields? A: A fixed set, so every entry reads the same way. Rejected: inconsistent entries.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]]
