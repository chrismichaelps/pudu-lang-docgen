---
type: module
path: "@root/src/PuduLangDocgen/Site/Format.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Format

> /** @Docgen.Site.Format — published HTML laid out with two-space indentation */

## Purpose

Lays out published HTML with block elements on their own lines, indented two spaces per level,
so generated pages read well in a diff. Text, inline markup, and the content of `pre`, `script`,
`style`, and `textarea` keep their exact form.

## Interface

### Signatures

```pudu
export fn html(document: Str) -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Site/Print]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `html` — HTML with block elements on their own lines indented two spaces per level. Text, inline markup, and the content of `pre`, `script`, `style`, and `textarea` keep their exact form.

## Negative Logic (Prohibited Paths)

- Do not change whitespace inside verbatim elements.
- Do not move inline elements onto lines of their own.

## Edge Cases

- Void elements never indent their successors.
- A doctype stays on the first line.

## Depth

MODERATE. One pass over tags with an indentation stack.

## Grill Log

- Q: Minify instead? A: Readable output; static hosts compress anyway. Rejected: unreadable diffs of generated sites.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Site/Print]]
