---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Layout.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Layout

> /** @Docgen.Markdown.Layout — line-level recognition of block boundaries */

## Purpose

Line-level recognition of block boundaries: indentation with tab stops, fences and their
closing lines, thematic breaks, ATX and setext headings with explicit ids, list markers, quote
markers, and pipe table cells.

## Interface

### Signatures

```pudu
export type Fence = { marker: Char, length: Int, indent: Int, info: Str }
export type Marker = { ordered: Bool, start: Int, symbol: Char, width: Int, rest: Str }
export fn indent(text: Str) -> Int
export fn strip(text: Str, columns: Int) -> Str
export fn blank(text: Str) -> Bool
export fn fence(text: Str) -> Option[Fence]
export fn closes(text: Str, opened: &Fence) -> Bool
export fn thematic(text: Str) -> Bool
export fn atx(text: Str) -> Option[(Int, Str, Str)]
export fn setext(text: Str) -> Int
export fn marker(text: Str) -> Option[Marker]
export fn quote(text: Str) -> Option[Str]
export fn cells(text: Str) -> Array[Str]
export fn alignments(text: Str) -> Option[Array[Str]]
export fn html(text: Str) -> Bool
export fn interrupts(text: Str) -> Bool
export fn definition(text: Str, number: Int) -> Option[(Str, Syntax.Target)]
export fn definitions(lines: &Array[FrontMatter.Line]) -> (Map[Str, Syntax.Target], Array[FrontMatter.Line])
export fn locate(origin: Str, written: Str) -> Result[Str, Str]
export fn expand(bounds: &Array[(Int, Int)], count: Int) -> Array[Int]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]]

## Algorithm

- `indent` — Leading indentation in columns, with tabs advancing to the next multiple of four.
- `strip` — Text with up to the given columns of leading indentation removed.
- `blank` — Whether a line holds only white space.
- `fence` — An opening fence of three or more backticks or tildes indented at most three columns.
- `closes` — Whether a line closes a fence: the same character, at least as long, nothing after it.
- `thematic` — Whether a line is a thematic break of three or more `-`, `*`, or `_`.
- `atx` — An ATX heading as level, content, and explicit `{#id}`.
- `setext` — The level of a setext underline: 1 for `=`, 2 for `-`, 0 for neither.
- `marker` — A bullet or ordered list marker and the content column after it.
- `quote` — The content of a block quote line without its `>` marker.
- `cells` — Cells of a pipe table row; escaped pipes and pipes inside code spans stay in their cell.
- `alignments` — Column alignments of a table delimiter row, or none when the line is not one.
- `html` — Whether a line opens an HTML block: a comment, a block-level element, or a line holding exactly one tag.
- `interrupts` — Whether a line ends a paragraph by starting another block.
- `definition` — A link reference definition `[label]: destination "title"`.
- `definitions` — Link reference definitions outside code, and the lines that remain.
- `locate` — The project-relative path a file names from the file that mentions it.
- `expand` — Line numbers of ranges limited to the lines a sample has.

## Negative Logic (Prohibited Paths)

- Do not treat a fence indented four columns as a fence; it is indented code.

## Edge Cases

- A closing fence must use the same character and be at least as long.
- Escaped pipes and pipes inside code spans stay in their cell.

## Depth

MODERATE. Pure predicates the block parser composes.

## Grill Log

- Q: Expand tabs to spaces first? A: Measure columns with tab stops of four, keeping the text intact. Rejected: rewriting code samples.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]]
