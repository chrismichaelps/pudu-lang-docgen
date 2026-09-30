---
type: module
path: "@root/src/PuduLangDocgen/Site/Sitemap.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: SHALLOW
tags: [module, shallow]
---

# PuduLangDocgen.Site.Sitemap

> /** @Docgen.Site.Sitemap — the crawler map of published pages */

## Purpose

The crawler map of published pages with base address, priority, change frequency, per-glob
options, and last change dates.

## Interface

### Signatures

```pudu
export type Options = { baseUrl: Str, priority: Str, changefreq: Str, files: Array[(Str, Array[(Str, Docgen.Meta)])] }
export fn render(pages: &Array[Docgen.Page], options: &Options, modified: &Array[(Str, Str)]) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Configuration]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `render` — The sitemap XML listing every indexable page under the base address. `modified` gives each page's last change as `YYYY-MM-DD`, when known. Settings of the last matching glob win.

## Negative Logic (Prohibited Paths)

- Do not list pages marked `_noindex` or redirect pages.

## Edge Cases

- Settings of the last matching glob win.
- Last modified dates appear only when known.

## Depth

SHALLOW. A formatter.

## Grill Log

- Q: Per-page options in front matter? A: Globs in configuration, matching how sites are organized. Rejected: front matter in every file.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Configuration]]
