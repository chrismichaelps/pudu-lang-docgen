---
type: module
path: "@root/src/PuduLangDocgen/Navigation/Resolve.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Navigation.Resolve

> /** @Docgen.Navigation.Resolve — tables of contents bound to published pages */

## Purpose

Binds tables of contents to published pages: nested and folder tables are brought in as
children, uid items link through the registry, items without titles take their page's title,
and each page learns its governing table, breadcrumb trail, and previous and next pages.

## Interface

### Signatures

```pudu
export type Links = { tocs: Map[Str, Array[Docgen.TocItem]], outputs: Map[Str, Str], references: Map[Str, Docgen.Reference], titles: Map[Str, Str] }
export type Candidate = { output: Str, order: Int, pages: Array[Str] }
export fn resolve(path: Str, links: &Links) -> (Array[Docgen.TocItem], Array[Docgen.Diagnostic])
export fn outputOf(path: Str) -> Str
export fn governing(page: Str, candidates: &Array[Candidate]) -> Str
export fn pagesOf(items: &Array[Docgen.TocItem]) -> Array[Str]
export fn trail(items: &Array[Docgen.TocItem], page: Str) -> Array[Docgen.TocItem]
export fn neighbors(items: &Array[Docgen.TocItem], page: Str) -> (Option[Docgen.TocItem], Option[Docgen.TocItem])
export fn readingOrder(items: &Array[Docgen.TocItem]) -> Array[Docgen.TocItem]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Site/Print]] · [[test/PuduLangDocgen/NavigationTest]]

## Algorithm

- `resolve` — Items of the table of contents at a project-relative path with every destination made root-relative to the published site. Folder links and links to other tables of contents bring in those items as children.
- `outputOf` — The published path of a table of contents: its source path ending in `toc.json`.
- `governing` — The table of contents governing a page, or the empty text. Tables that link the page win, lower `order` first and then the nearest folder; otherwise the nearest table in a folder holding the page is used, again preferring lower `order`.
- `pagesOf` — Local pages a tree links, without fragments.
- `trail` — The items from the top of a tree down to the deepest one linking a page; a group that links its first page yields to that page's own item.
- `neighbors` — The pages before and after a page in reading order, when it is listed.
- `readingOrder` — Local pages in the order a reader meets them, each listed once.

## Negative Logic (Prohibited Paths)

- Do not follow a table that includes itself.
- Do not list a page twice in reading order.

## Edge Cases

- A group whose first link is a page yields to that page's own item in the trail.
- Among tables that list a page, lower `order` wins; otherwise the nearest folder's table governs.

## Depth

DEEP. Every navigation question a page asks is answered here.

## Grill Log

- Q: Governing table by path depth only? A: Explicit listing first, `order` next, then the nearest folder. Rejected: pages showing an unrelated folder's table.

## Referenced by

[[src/PuduLangDocgen/Navigation/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Site/Print]]
