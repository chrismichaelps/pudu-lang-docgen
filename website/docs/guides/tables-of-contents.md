---
uid: guides.tables-of-contents
description: Write tables of contents in YAML, JSON, or Markdown to build the top navigation, sidebars, breadcrumbs, and pager.
---

# Tables of contents

Tables of contents organize pages into navigation. A table of contents is a content file named `toc.yml`, `toc.yaml`, `toc.json`, or `toc.md`. The table at the root of the content becomes the top navigation bar; tables in folders become the sidebar of the pages they list.

## Top navigation and sidebars

This site uses a root table for the navigation bar:

```yaml
- name: Home
  href: index.md
- name: Docs
  href: guides/
- name: API
  href: api/
- name: Extensions
  href: extensions/
- name: GitHub
  href: https://github.com/chrismichaelps/pudu-lang-docgen
```

An item that links to a folder, such as `guides/`, uses the table of contents in that folder, trying `toc.yml`, `toc.yaml`, `toc.json`, and `toc.md` in that order. The generated API reference publishes its own table under its `dest` folder, so `api/` links to it.

Each page uses the table that lists it; when several do, the one with the lowest `order` and then the nearest folder wins. The same table produces the breadcrumb trail and the **Previous** and **Next** links at the bottom of the page, which follow reading order.

## Item fields

| Field | Description |
| --- | --- |
| `name` | The title shown in navigation. `displayName` and `title` are accepted as alternatives. Without one, the item takes the title of the page it links. |
| `href` | A Markdown file, another page, a folder, another table of contents, or an external address. |
| `uid` | A page or declaration identity; the item links to it and takes its name when `name` is missing. An unknown uid is reported as `DG210`. |
| `items` | Child items. Tables may nest up to 32 levels. |
| `expanded` | `true` to show the item's children open on every page. |
| `topicHref`, `topicUid` | Give a group its own page while `href` names a nested table of contents. |

An unknown field is an error (`DG206`), as is an item with neither a name, a uid, nor an href (`DG207`). A destination that does not exist is reported as a warning (`DG211`).

## Section labels

An item with a `name` and no `href`, `uid`, or `items` is shown as a section label that groups the items after it. This site's documentation sidebar is written that way:

```yaml
- name: Get started
- name: Introduction
  href: introduction.md
- name: Quick start
  href: quick-start.md
- name: Author content
- name: Markdown authoring
  href: markdown.md
```

An item with a `name` and child `items` but no destination becomes a collapsible group instead.

## Table metadata

A table can be written as an object with an `items` list. Every other key is metadata for the pages that use the table.

```yaml
order: 10
pdf: true
pdfFileName: guides.pdf
items:
- name: Introduction
  href: introduction.md
```

| Key | Effect |
| --- | --- |
| `order` | Ranks tables that list the same page; lower wins. Nested tables default to 100, others to 0. |
| `pdf` | Produces a PDF of the pages the table lists. See [PDF output](pdf.md). |

## JSON and Markdown forms

The same structure can be written as JSON:

```json
[
  { "name": "Introduction", "href": "introduction.md" },
  { "name": "Reference", "items": [ { "name": "Configuration", "href": "configuration.md" } ] }
]
```

Or as Markdown headings in `toc.md`, where each heading level nests one deeper and a heading written as a link links its item:

```markdown
# [Introduction](introduction.md)
# Reference
## [Configuration](configuration.md)
```

## Without a table of contents

When a site has no table of contents at all, the build lists every article in path order so that each page is still reachable.
