---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Leaves.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Leaves

> /** @Docgen.Markdown.Leaves — blocks read without nested content: code, math, and raw HTML */

## Purpose

Blocks read without nested content: fenced code, indented code, display math, and raw HTML.

## Interface

### Signatures

```pudu
export type Step = { blocks: Array[Syntax.Block], next: Int, diagnostics: Array[Docgen.Diagnostic] }
export fn fenced(lines: &Array[FrontMatter.Line], index: Int, opened: &Layout.Fence, origin: Str) -> Step
export fn indented(lines: &Array[FrontMatter.Line], index: Int) -> Step
export fn mathBlock(lines: &Array[FrontMatter.Line], index: Int, origin: Str) -> Step
export fn markup(lines: &Array[FrontMatter.Line], index: Int) -> Step
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Directives]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Snippet]] · [[src/PuduLangDocgen/Markdown/Syntax]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown/Blocks]]

## Algorithm

- `fenced` — A fenced code block; an unclosed fence runs to the end of its container.
- `indented` — Code indented by four columns; blank lines inside are kept.
- `mathBlock` — A display math block between `$$` lines, or on one line.
- `markup` — Raw HTML running to the next blank line, or to the end of a comment.

## Negative Logic (Prohibited Paths)

- Do not parse inline syntax inside these blocks.

## Edge Cases

- An unclosed fence runs to the end of its container and is reported.
- Raw HTML runs to the next blank line, or to the end of a comment.

## Depth

MODERATE. Four readers that each answer where the next block starts.

## Grill Log

- Q: Fold into the block parser? A: Separate module, keeping the recursive parser short. Rejected: one oversized file.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown/Blocks]]
