---
type: module
path: "@root/src/PuduLangDocgen/Site/Gallery.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Gallery

> /** @Docgen.Site.Gallery — catalog pages of extensions shown as cards */

## Purpose

Catalog pages marked `YamlMime:Dashboard`: a title, a description, and items shown as cards
with type, author, version, license, thumbnail, links, and usage snippets.

## Interface

### Signatures

```pudu
export type Rendered = { title: Str, body: Str, headings: Array[Docgen.Heading], links: Array[Docgen.Link], diagnostics: Array[Docgen.Diagnostic] }
export const MARKER: Str = "YamlMime:Dashboard"
export fn render(value: &Docgen.Meta, context: &Phrase.Scope) -> Result[Rendered, Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `render` — A catalog page: `title`, an optional `description`, and `items`, each with a `name` and any of `description`, `type`, `author`, `version`, `license`, `thumbnail`, `homepage`, `repository.url`, and `usage` entries.

## Negative Logic (Prohibited Paths)

- Do not show an item without a name.
- Do not link an unsafe thumbnail or homepage.

## Edge Cases

- Descriptions render as Markdown.
- Usage entries appear in a fixed order: install, get, command line, configuration.

## Depth

MODERATE. One page kind with its own card layout.

## Grill Log

- Q: Free-form card fields? A: A fixed set, so every card reads the same way. Rejected: inconsistent cards.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]]
