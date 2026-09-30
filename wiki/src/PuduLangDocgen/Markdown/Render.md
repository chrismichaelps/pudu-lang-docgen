---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Render.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Markdown.Render

> /** @Docgen.Markdown.Render — article blocks rendered as accessible HTML */

## Purpose

Renders article blocks as accessible HTML: headings with anchors, code with captions and
highlighted lines, alerts, tabs, layouts, figures, tables with alignment, task lists, footnotes,
math, Mermaid, and PlantUML. Also answers the title, headings, summary, and client features a
page needs.

## Interface

### Signatures

```pudu
export type Rendered = {
  html: Str,
  title: Str,
  summary: Str,
  headings: Array[Docgen.Heading],
  links: Array[Docgen.Link],
  features: Array[Str],
  diagnostics: Array[Docgen.Diagnostic]
}
export fn render(blocks: &Array[Syntax.Block], context: &Phrase.Scope) -> Rendered
export fn summaryOf(blocks: &Array[Syntax.Block]) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Highlight]] · [[src/PuduLangDocgen/Markdown/Languages]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Sanitize]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown]] · [[test/PuduLangDocgen/MarkdownTest]]

## Algorithm

- `render` — Blocks rendered for a page; the title is the first level-one heading.
- `summaryOf` — Plain text of the first paragraph, cut at a word near the summary limit.

## Negative Logic (Prohibited Paths)

- Do not emit raw HTML blocks without the sanitizer.
- Do not give two headings the same id; duplicates get a numeric suffix.

## Edge Cases

- The title is the first level-one heading.
- PlantUML uses a locally drawn diagram when one exists, otherwise the configured server.

## Depth

DEEP. The whole block vocabulary rendered in one pass.

## Grill Log

- Q: Render math on the server? A: Mark math and load a renderer only on pages that need it. Rejected: a math engine in the build.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Markdown]]
