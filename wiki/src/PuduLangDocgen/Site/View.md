---
type: module
path: "@root/src/PuduLangDocgen/Site/View.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Site.View

> /** @Docgen.Site.View — everything a layout shows for one page, as template metadata */

## Purpose

Everything a layout shows for one page as template metadata: site identity, SEO and social
tags, structured data, navigation, breadcrumbs, affix, pager, actions, footer, client features,
and interface text, with `_disable*` switches for each part.

## Interface

### Signatures

```pudu
export type Frame = {
  navbar: Array[Docgen.TocItem],
  toc: Array[Docgen.TocItem],
  trail: Array[Docgen.TocItem],
  previous: Option[Docgen.TocItem],
  next: Option[Docgen.TocItem],
  editUrl: Str,
  updated: Str,
  features: Array[Str],
  root: Str,
  pdf: Str,
  tocPath: Str,
  navPath: Str
}
export fn view(page: &Docgen.Page, frame: &Frame) -> Docgen.Meta
export fn tocHtml(items: &Array[Docgen.TocItem], page: Str, trail: &Array[Docgen.TocItem]) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Sanitize]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Site/Strings]]
- **Consumed by:** [[src/PuduLangDocgen/Build/Site]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `view` — The view of a page: site identity, navigation, content, and interface text. Page metadata switches parts off with `_disableToc`, `_disableAffix`, `_disableBreadcrumb`, `_disableNavbar`, `_disableFooter`, `_disableContribution`, `_disableNextArticle`, and `_enableSearch: false`.
- `tocHtml` — Nested navigation as HTML lists; items on the trail to the page start expanded.

## Negative Logic (Prohibited Paths)

- Do not put page text in template metadata without escaping, except the body and sanitized footer.

## Edge Cases

- `landing` and `chromeless` layouts drop the navigation panes; `chromeless` also drops header and footer.
- Canonical and social image addresses become absolute when `_baseUrl` is set.

## Depth

DEEP. One call answers every question a template can ask.

## Grill Log

- Q: Let templates compute paths? A: Precompute every path and flag here; templates stay logic-less. Rejected: logic in layouts.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build/Site]]
