---
type: module
path: "@root/src/PuduLangDocgen/Site/Print.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Print

> /** @Docgen.Site.Print — printable documents assembled from tables of contents */

## Purpose

Printable documents assembled from tables of contents that set `pdf`: pages in reading order
with a cover page (`pdfCoverPage`), a contents page (`pdfTocPage`), header and footer
templates, and links rebased so sections link inside the document.

## Interface

### Signatures

```pudu
export type Printable = { html: Str, path: Str, pdf: Str, header: Str, footer: Str, background: Bool }
export const FOOTER: Str
export fn documents(pages: &Array[Docgen.Page], books: &Array[Site.Book]) -> Array[Printable]
export fn rebase(body: Str, page: Str, document: Str, numbers: &Map[Str, Int], prefix: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Site/Format]]
- **Consumed by:** [[src/PuduLangDocgen/Docset/Tasks]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `documents` — A printable document for every table of contents whose metadata sets `pdf`. Each lists its pages in reading order after an optional cover (`pdfCoverPage`) and contents page (`pdfTocPage`); `pdfFileName` names the output beside the table.
- `rebase` — Page HTML moved into a printed document: ids gain a prefix, links to pages in the document become section links, and other relative addresses are rebased to the document.

## Negative Logic (Prohibited Paths)

- Do not keep page-relative links that would break inside one document.

## Edge Cases

- Links to pages in the document become section links; others are rebased to the document's folder.
- `pdfFileName` names the output beside the table.

## Depth

MODERATE. Document assembly without the rendering program.

## Grill Log

- Q: Render each page to PDF and join? A: One HTML document per table, rendered once. Rejected: joining files and losing links.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Docset/Tasks]]
