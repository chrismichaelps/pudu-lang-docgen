---
type: module
path: "@root/src/PuduLangDocgen/Build/Site.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Build.Site

> /** @Docgen.Build.Site — navigation, page frames, templated pages, and site-wide files */

## Purpose

Builds the navigation books, the frame each page is shown in, the templated pages, and the
site-wide files: tables of contents as JSON, search index, sitemap, cross-reference map,
manifest, and theme assets.

## Interface

### Signatures

```pudu
export type Book = { output: Str, items: Array[Docgen.TocItem], meta: Array[(Str, Docgen.Meta)], nested: Bool }
export type Context = {
  config: Configuration.Config,
  books: Array[Book],
  look: Theme.Look,
  history: Map[Str, Str],
  repository: Configuration.Contribution,
  global: Array[(Str, Docgen.Meta)],
  generator: Str,
  today: Str
}
export fn books(tocs: &Array[(Str, Str, Navigation.Toc)], links: &Resolve.Links) -> (Array[Book], Array[Docgen.Diagnostic])
export fn rendered(pages: &Array[Docgen.Page], context: &Context) -> Array[Docgen.Artifact]
export fn files(pages: &Array[Docgen.Page], references: &Array[Docgen.Reference], context: &Context) -> Array[Docgen.Artifact]
export fn notFound(global: &Array[(Str, Docgen.Meta)]) -> Docgen.Page
export fn manifest(pages: &Array[Docgen.Page], resources: &Array[(Str, Str)], generator: Str, outputs: &Array[Str]) -> Str
export fn pdfOf(book: &Book) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Site/Redirect]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Theme]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Site/Print]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `books` — Tables of contents resolved against the site; entries without an output only serve as targets of other tables. Tables another table links are nested and rank after tables of their own folder unless they declare an `order`.
- `rendered` — Every page rendered through the layout, with redirect pages standing alone.
- `files` — Site-wide files: tables of contents as JSON, the search index, the sitemap, and the cross-reference map.
- `notFound` — A generated page for addresses the site does not have.
- `manifest` — The manifest listing every output with its source and kind, and the generator version.
- `pdfOf` — The PDF a table publishes: `pdfFileName` beside the table, `toc.pdf` by default.

## Negative Logic (Prohibited Paths)

- Do not render a redirect page through the layout; redirects stand alone.
- Do not list outputs in the manifest in any order but path order.

## Edge Cases

- A folder table of contents without `order` governs only its own folder.
- PDF names default to `toc.pdf` beside the table.

## Depth

DEEP. Every site-wide artifact comes from here with one context.

## Grill Log

- Q: Store tables of contents as YAML in the site? A: JSON, which the browser reads directly. Rejected: a YAML reader in the site script.

## Referenced by

[[src/PuduLangDocgen/Build/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Site/Print]]
