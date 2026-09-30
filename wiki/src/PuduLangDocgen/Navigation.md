---
type: module
path: "@root/src/PuduLangDocgen/Navigation.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Navigation

> /** @Docgen.Navigation.Module — table of contents files read into nested items */

## Purpose

Reads tables of contents written as YAML, JSON, or Markdown headings into nested items with
TOC-level metadata such as `order` and `pdf`, and writes navigation as JSON for the site script.
Pages without any table get one ordered by path.

## Interface

### Signatures

```pudu
export type Toc = { items: Array[Docgen.TocItem], meta: Array[(Str, Docgen.Meta)] }
export fn isToc(path: Str) -> Bool
export fn parse(path: Str, text: Str) -> Result[Toc, Array[Docgen.Diagnostic]]
export fn markdown(path: Str, text: Str) -> Result[Array[Docgen.TocItem], Array[Docgen.Diagnostic]]
export fn forPages(pages: &Array[Docgen.Page]) -> Array[Docgen.TocItem]
export fn toJson(tree: &Array[Docgen.TocItem]) -> Json.Json
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[test/PuduLangDocgen/NavigationTest]]

## Algorithm

- `isToc` — Whether a project-relative path names a table of contents file.
- `parse` — A table of contents written as YAML, JSON, or Markdown headings. An object form holds `items` beside metadata such as `order` or `pdf`. Hrefs are kept as written; resolution happens against the published docset.
- `markdown` — Items of a Markdown table of contents: each heading level nests one deeper. `# [Title](href)` links an item; `# Title` makes a group.
- `forPages` — Items for published pages when no table of contents exists, ordered by path.
- `toJson` — Items as JSON with `name`, `href`, `expanded`, and nested `items`.

## Negative Logic (Prohibited Paths)

- Do not resolve hrefs while reading; resolution needs the published docset.
- Do not accept nesting past the depth bound.

## Edge Cases

- `topicHref` and `topicUid` give a group its own page.
- An index file's headings can become a navigation tree.

## Depth

MODERATE. Three input forms, one tree.

## Grill Log

- Q: Resolve items while parsing? A: Keep hrefs as written and resolve in [[src/PuduLangDocgen/Navigation/Resolve]]. Rejected: a table that depends on read order.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Navigation/Resolve]]
