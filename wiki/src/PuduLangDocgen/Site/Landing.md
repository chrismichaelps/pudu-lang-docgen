---
type: module
path: "@root/src/PuduLangDocgen/Site/Landing.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Site.Landing

> /** @Docgen.Site.Landing — hub pages with a banner, highlighted links, and topic lists */

## Purpose

Hub pages marked `YamlMime:Landing`: a banner across the full page width with the title and
summary, highlighted entry points labeled by kind, topic lists with an optional footer link, and
related-content sections. Pages read this way use the `landing` layout, and a `metadata` object
sets their page metadata.

## Interface

### Signatures

```pudu
export type Rendered = { title: Str, body: Str, headings: Array[Docgen.Heading], links: Array[Docgen.Link], diagnostics: Array[Docgen.Diagnostic] }
export const MARKER: Str = "YamlMime:Landing"
export fn render(value: &Docgen.Meta, context: &Phrase.Scope) -> Result[Rendered, Str]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Paths]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]] · [[test/PuduLangDocgen/SiteLandingTest]]

## Algorithm

- `render` — A hub page: `title`, an optional `summary` shown in the banner, `highlightedContent.items` with `title`, `itemType`, and `url`, `conceptualContent.items` with a `title`, `links` of `text` and `url`, and an optional `footerLink`, and `additionalContent.sections` whose `items` have a `title`, `summary`, and `url`. Local addresses are checked like article links. A `metadata` object sets the page's metadata, such as `uid` and `description`, when read.

## Negative Logic (Prohibited Paths)

- Do not accept an `itemType` outside the label table.
- Do not emit an address without checking it; local links are recorded for the site-wide checks.
- Do not decorate entries with icons or boxes; presentation stays typographic and the theme owns it.

## Edge Cases

- Sections without a title render their lists without a heading.
- A page with only a title renders the banner alone.

## Depth

MODERATE. One page kind with a fixed vocabulary, reusing the article link checks.

## Grill Log

- Q: Allow free-form Markdown on hub pages? A: A fixed schema, so every hub page reads the same and links stay checked. Rejected: a second article format.
- Q: Draw an icon per entry? A: Small uppercase kind labels over the link. Rejected: icon grids that crowd the page.

## Referenced by

[[src/PuduLangDocgen/Site/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]]
