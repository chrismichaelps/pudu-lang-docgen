---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Blocks.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Markdown.Blocks

> /** @Docgen.Markdown.Blocks — recursive block structure with includes and excerpts */

## Purpose

Recursive block structure: paragraphs, headings, fences, quotes and alerts, lists with loose and
tight items and task boxes, pipe tables, tabs, row and column layouts, images, video, math,
footnotes, whole-line and inline includes with cycle checks, and code excerpts.

## Interface

### Signatures

```pudu
export type Env = { origin: Str, files: Map[Str, Str], trail: Array[Str], definitions: Map[Str, Syntax.Target], alerts: Set[Str] }
export type Parsed = { blocks: Array[Syntax.Block], diagnostics: Array[Docgen.Diagnostic] }
export fn environment(origin: Str, files: &Map[Str, Str], alerts: &Set[Str]) -> Env
export fn parse(lines: &Array[FrontMatter.Line], env: &Env, depth: Int) -> Parsed
export fn inlines(text: Str, line: Int, env: &Env, depth: Int) -> (Array[Syntax.Inline], Array[Docgen.Diagnostic])
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Languages]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Snippet]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown]]

## Algorithm

- `environment` — A parsing environment for a project-relative file with extra alert kinds.
- `parse` — Blocks of numbered lines.
- `inlines` — Inline content of text starting at a line, with inline includes resolved.

## Negative Logic (Prohibited Paths)

- Do not follow an include that is already on the trail; the cycle is reported.
- Do not nest past the depth bound; deeper content stays text.

## Edge Cases

- A tab group ends at `---` or `***` after the last tab.
- An included file resolves relative to the file that includes it.
- An unclosed container directive runs to the end and is reported.

## Depth

DEEP. The block grammar and include machinery behind one recursive parse.

## Grill Log

- Q: Expand includes before parsing? A: Parse the included file in its own place so lines and relative paths stay correct. Rejected: textual splicing.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown]]
