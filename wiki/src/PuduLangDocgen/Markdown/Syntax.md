---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Syntax.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Markdown.Syntax

> /** @Docgen.Markdown.Syntax — article tree shared by parsing and rendering */

## Purpose

The article tree shared by parsing and rendering: inline and block unions and their records.

## Interface

### Signatures

```pudu
export type Target = { destination: Str, title: Str, line: Int }
export type XrefSpan = { uid: Str, text: Array[Inline], display: Str, line: Int, optional: Bool }
export type Inline
  = Text(Str)
  | Code(Str)
  | Emphasis(Array[Inline])
  | Strong(Array[Inline])
  | Strike(Array[Inline])
  | Subscript(Array[Inline])
  | Superscript(Array[Inline])
  | Inserted(Array[Inline])
  | Marked(Array[Inline])
  | Note(Str)
  | Anchor(Target, Array[Inline])
  | Picture(Target, Str)
  | Xref(XrefSpan)
  | Math(Str)
  | Markup(Str)
  | LineBreak
  | SoftBreak
  | Fragment(Str, Array[Inline])
export type Title = { level: Int, content: Array[Inline], id: Str, line: Int }
export type Sample = { language: Str, title: Str, text: Str, highlight: Array[Int], line: Int }
export type Item = { checked: Int, blocks: Array[Block] }
export type Listing = { ordered: Bool, start: Int, tight: Bool, items: Array[Item] }
export type Table = { align: Array[Str], header: Array[Array[Inline]], rows: Array[Array[Array[Inline]]] }
export type Notice = { kind: Str, blocks: Array[Block] }
export type Tab = { id: Str, title: Str, condition: Str, blocks: Array[Block] }
export type Column = { span: Int, blocks: Array[Block] }
export type Figure = { source: Str, alt: Str, kind: Str, lightbox: Str, caption: Array[Block], line: Int }
export type Block
  = Heading(Title)
  | Paragraph(Array[Inline])
  | CodeBlock(Sample)
  | Quote(Array[Block])
  | ListBlock(Listing)
  | TableBlock(Table)
  | Rule
  | HtmlBlock(Str)
  | Alert(Notice)
  | TabGroup(Array[Tab])
  | Included(Str, Array[Block])
  | Video(Str)
  | MathBlock(Str)
  | Grid(Array[Column])
  | Image(Figure)
  | Footnote(Str, Array[Block])
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Crossref]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Site/Landing]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

## Negative Logic (Prohibited Paths)

- Do not add rendering hints to the tree; the renderer decides presentation.

## Edge Cases

- Checked list items use -1 for no box, 0 for open, 1 for done.

## Depth

SHALLOW. Types only.

## Grill Log

- Q: Separate trees for inline and block? A: Two unions in one module, so both sides import one vocabulary. Rejected: scattered node definitions.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Crossref]] · [[src/PuduLangDocgen/Markdown/Layout]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Site/Landing]]
