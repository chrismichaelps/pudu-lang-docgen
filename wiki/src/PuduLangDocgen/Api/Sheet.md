---
type: module
path: "@root/src/PuduLangDocgen/Api/Sheet.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Api.Sheet

> /** @Docgen.Api.Sheet — structured API pages written by any language's converter */

## Purpose

Renders `#YamlMime:ApiPage` documents: pages any converter can write as blocks of headings,
Markdown, code, facts, parameters, lists, and inheritance chains, so reference material from
other languages shares the site's look.

## Interface

### Signatures

```pudu
export type Rendered = { title: Str, body: Str, headings: Array[Docgen.Heading], links: Array[Docgen.Link], diagnostics: Array[Docgen.Diagnostic] }
export fn render(value: &Docgen.Meta, context: &Phrase.Scope) -> Result[Rendered, Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]]

## Algorithm

- `render` — A page from an API page document: `title`, optional `languageId`, and a `body` of blocks named `h1`–`h6`, `api1`–`api4`, `markdown`, `code`, `facts`, `parameters`, `list`, and `inheritance`. Unknown blocks are reported and skipped.

## Negative Logic (Prohibited Paths)

- Do not accept a page without a title or a body list.
- Do not emit unknown block kinds; they are reported and skipped.

## Edge Cases

- `api1`–`api4` headings may carry a `uid`, `src`, and `deprecated` flag.
- Code blocks take `languageId` from the page when they name none.

## Depth

MODERATE. A fixed block vocabulary rendered in one pass.

## Grill Log

- Q: Allow raw HTML blocks? A: Markdown blocks go through the sanitizer like articles. Rejected: an unescaped side door.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Build]]
