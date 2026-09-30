---
uid: home
_layout: landing
description: Turn Markdown articles, Pudu source declarations, and OpenAPI descriptions into a searchable static documentation website.
---

# Documentation publishing for Pudu

<p class="hero-lead">pudu-lang-docgen turns Markdown articles, the public declarations of your Pudu modules, and OpenAPI descriptions into one static website with navigation, cross references, search, and printable PDF documents. This site is built with it.</p>

<p class="hero-actions"><a class="button button-primary" href="guides/quick-start.html">Get started</a> <a class="button" href="api/PuduLangDocgen.html">API reference</a> <a class="button" href="https://github.com/chrismichaelps/pudu-lang-docgen">View on GitHub</a></p>

## Capabilities

:::row:::
:::column:::
### Articles

CommonMark with tables, alerts, tabs, includes, code excerpts, math, diagrams, and footnotes.
[Markdown authoring](guides/markdown.md)
:::column-end:::
:::column:::
### API reference from Pudu sources

Modules, records, unions, traits, functions, and constants documented from their doc comments.
[Pudu API reference](guides/api-reference.md)
:::column-end:::
:::column:::
### HTTP API reference

OpenAPI 3 and Swagger 2 descriptions rendered as operation and schema pages.
[HTTP API reference](guides/http-api.md)
:::column-end:::
:::column:::
### Cross references

Link any page or declaration by its uid and exchange maps with other sites.
[Links and cross references](guides/cross-references.md)
:::column-end:::
:::row-end:::

:::row:::
:::column:::
### Navigation

Tables of contents in YAML, JSON, or Markdown drive the top bar, sidebar, breadcrumbs, and pager.
[Tables of contents](guides/tables-of-contents.md)
:::column-end:::
:::column:::
### Search

A generated index and client-side search with keyboard navigation. No server required.
[Search and SEO](guides/search-and-seo.md)
:::column-end:::
:::column:::
### Theming

Override the layout or any partial, add styles and scripts, and set colors and text through metadata.
[Templates and theming](guides/templates.md)
:::column-end:::
:::column:::
### PDF

Printable documents per table of contents, with cover, contents page, header, and footer.
[PDF output](guides/pdf.md)
:::column-end:::
:::row-end:::

## Quick start

Install the package, add a two-line program that runs the command line, then create and build a documentation project.

```bash
pudu install @chrismichaelps/pudu-lang-docgen
```

```pudu
module Docgen

import Std.Env as Env
import PuduLangDocgen.Command as Command

fn main() -> Int { Command.run(&Env.all()) }
```

```bash
pudu run Docgen.pudu init docs --yes
pudu run Docgen.pudu build docs --serve
```

The build writes a static site to `docs/_site`, which any web server or static host can publish. Continue with the [quick start](guides/quick-start.md) for a complete walkthrough, or read the [basic concepts](guides/concepts.md) first.
