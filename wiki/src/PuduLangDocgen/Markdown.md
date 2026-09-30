---
type: module
path: "@root/src/PuduLangDocgen/Markdown.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Markdown

> /** @Docgen.Markdown.Module — article text parsed into metadata and a block tree */

## Purpose

The article entry point: splits front matter, collects link reference definitions, parses
blocks with includes and excerpts, renders documentation fragments inside other pages, lists
PlantUML sources for local drawing, and lists the files an article depends on for watching.

## Interface

### Signatures

```pudu
export type Article = { meta: Array[(Str, Docgen.Meta)], blocks: Array[Syntax.Block], diagnostics: Array[Docgen.Diagnostic] }
export const ALERTS: Array[Str] = ["NOTE", "TIP", "IMPORTANT", "CAUTION", "WARNING"]
export fn parse(origin: Str, text: Str, files: &Map[Str, Str], alerts: &Array[Str]) -> Article
export fn fragment(text: Str, context: &Phrase.Scope, demote: Int) -> Render.Rendered
export fn diagrams(blocks: &Array[Syntax.Block]) -> Array[Str]
export fn dependencies(origin: Str, text: Str) -> Array[Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Markdown/Snippet]] · [[src/PuduLangDocgen/Markdown/Syntax]]
- **Consumed by:** [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]] · [[test/PuduLangDocgen/MarkdownTest]]

## Algorithm

- `parse` — An article written at a project-relative path. `files` holds the text of every file it may include or excerpt; `alerts` adds alert kinds to the built-in ones.
- `fragment` — Documentation text written inside another page, rendered with its headings lowered by `demote` levels so they sit below the page's own sections.
- `diagrams` — Sources of the PlantUML diagrams in blocks, in order, each listed once.
- `dependencies` — Project-relative paths an article includes or excerpts, in first-mention order. Paths that cannot be located are left for parsing to report.

## Negative Logic (Prohibited Paths)

- Do not render during parsing; parsing only builds the tree.
- Do not accept alert kinds outside the built-in and configured ones.

## Edge Cases

- A front matter error yields an empty article with one diagnostic.
- Fragments lower their headings so they sit under the page's own sections, never past level 6.

## Depth

DEEP. Four calls for every article-shaped input in the site.

## Grill Log

- Q: Allow alert kinds freely? A: Built-in kinds plus configured ones; others are reported. Rejected: typos turning into unstyled asides.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]]
