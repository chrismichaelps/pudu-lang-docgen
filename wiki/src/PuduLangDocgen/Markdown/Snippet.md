---
type: module
path: "@root/src/PuduLangDocgen/Markdown/Snippet.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Markdown.Snippet

> /** @Docgen.Markdown.Snippet — code excerpts selected by region, range, and emphasis */

## Purpose

Code excerpts: a destination selects a file with an optional `#region`, `#L3-L9` style line
ranges, `?range=`, `?highlight=`, and `?dedent=`; extraction answers the text and the lines to
emphasize.

## Interface

### Signatures

```pudu
export type Selection = { path: Str, region: Str, ranges: Array[(Int, Int)], highlight: Array[(Int, Int)], dedent: Int }
export fn selection(destination: Str) -> Result[Selection, Str]
export fn ranges(written: Str) -> Result[Array[(Int, Int)], Str]
export fn extract(text: Str, chosen: &Selection) -> Result[(Str, Array[Int]), Str]
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]]

## Algorithm

- `selection` — The file path and selection written in an excerpt destination. `#name` selects a region, `#L3-L9` a line range; `?name=`, `?range=`, `?highlight=` and `?dedent=` refine it.
- `ranges` — Line ranges written as `3`, `3-9`, or `12-`, separated by commas.
- `extract` — The excerpt a selection takes from file text and the output lines it emphasizes. Region markers inside the excerpt are removed; common indentation is removed unless `dedent` names an exact amount.

## Negative Logic (Prohibited Paths)

- Do not include region marker lines in the excerpt.

## Edge Cases

- `12-` runs to the end of the file.
- Dedent without an amount removes the common indentation.

## Depth

MODERATE. Parsing and extraction for one excerpt syntax.

## Grill Log

- Q: Regions by language comment syntax? A: Recognize `#region name`/`#endregion` and `<name>`/`</name>` behind any comment leader. Rejected: one marker style per language.

## Referenced by

[[src/PuduLangDocgen/Markdown/_MOC]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/Leaves]]
