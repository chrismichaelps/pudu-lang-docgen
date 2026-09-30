---
type: test
path: "@root/test/PuduLangDocgen/MarkdownTest.pudu"
grammar: "[[grammar/pudu]]"
tags: [test]
---

# MarkdownTest

> /** @Docgen.Markdown.Tests — article syntax renders to exact, safe HTML */

## Purpose

Checks the public contracts of [[src/PuduLangDocgen/Markdown]], [[src/PuduLangDocgen/Markdown/Blocks]], [[src/PuduLangDocgen/Markdown/Render]], [[src/PuduLangDocgen/Markdown/Phrase]], [[src/PuduLangDocgen/Markdown/Snippet]], [[src/PuduLangDocgen/Markdown/Sanitize]] through their exported
functions only. Each check names the behavior it holds, so a failure reads as a broken promise.

## Interface

```pudu
fn main() -> Int
```

`pudu test test` runs it with the other suites; it answers nonzero when any check fails and prints each failure.

## Contracts

- paragraph
- atx heading with permalink
- explicit heading id
- closing hashes removed
- setext heading
- duplicate ids numbered
- title from first h1
- emphasis kinds
- nested emphasis
- intraword underscore
- unmatched delimiter literal
- code span escapes
- backslash escape
- hard break
- soft break
- local link mapped
- link title
- external link
- reference link
- shortcut reference
- unsafe link unlinked
- unsafe link warns
- broken link warns
- escaping root warns
- image resolved
- missing image warns
- autolink
- email autolink
- bare address trims punctuation
- www address
- xref forms
- unresolved xref
- unresolved xref warns
- mention needs boundary
- entities decoded then escaped
- emoji codes
- inline math
- math feature
- allowed inline html
- html comment dropped
- bullet list tight
- ordered list start
- loose list
- nested list
- task list
- lazy list continuation
- quote
- alert
- custom alert
- unknown alert warns
- video
- insecure video warns
- fenced code highlighted
- fence title and highlight
- unclosed fence warns
- indented code
- mermaid
- table alignment
- table pads rows and keeps escaped pipes
- thematic break
- html block sanitized
- block include
- inline include
- include cycle
- missing include
- excerpt by tag region
- excerpt directive with range
- missing region
- missing excerpt file
- tabs
- dependent tabs share one button per id
- emphasis extras
- lonely extras stay text
- footnotes
- video media link
- video file link
- plantuml
- row layout
- image directive
- unclosed container
- unsupported directive keeps content
- front matter kept apart
- front matter lines keep numbers
- unclosed front matter
- summary from first paragraph
- links recorded for validation
- dependencies
- deep nesting is bounded

## Negative Logic (Prohibited Paths)

- Do not test private helpers; mutation testing measures the public surface.
- Do not accept a changed expected value without reading the semantic difference.

## Grill Log

- Q: Snapshot whole pages? A: Assert the specific markup each behavior promises. Rejected: snapshots that hide which change mattered.

## Referenced by

[[test/_MOC]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Snippet]] · [[src/PuduLangDocgen/Markdown/Sanitize]]
