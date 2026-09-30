---
uid: home
_layout: landing
description: Turn Markdown articles, Pudu source declarations, and OpenAPI descriptions into a searchable static documentation website.
---

# Documentation publishing for Pudu

<p class="hero-eyebrow">pudu-lang-docgen 0.1 · Microsoft Learn style, generated from your sources</p>

<p class="hero-lead">Turn Markdown articles, the public declarations of your Pudu modules, and OpenAPI descriptions into one static website with navigation, cross references, search, and printable PDF documents. This site is built with it.</p>

<p class="hero-actions"><a class="button button-primary" href="guides/quick-start.html">Get started</a> <a class="button" href="api/PuduLangDocgen.html">API reference</a> <a class="button" href="https://github.com/chrismichaelps/pudu-lang-docgen">View on GitHub</a></p>

## One pipeline, three moves

<div class="steps">
<div class="step">
<p class="step-num">1</p>
<h3>Author</h3>
<p>Write Markdown articles next to your Pudu modules and OpenAPI descriptions. Document declarations with doc comments where they live.</p>
</div>
<div class="step">
<p class="step-num">2</p>
<h3>Build</h3>
<p>Run one command. Articles, API pages, navigation, search index, sitemap, and PDFs come out as a static folder.</p>
</div>
<div class="step">
<p class="step-num">3</p>
<h3>Publish</h3>
<p>Upload the folder anywhere. No server, no database, no runtime. This site deploys straight to a static host.</p>
</div>
</div>

## Write documents that read like products

Articles are CommonMark with tables, alerts, tabs, includes, code excerpts, math, diagrams, and footnotes. Reuse shared snippets across pages, and export any table of contents to a printable PDF with cover, contents page, header, and footer.

<p class="band-links"><a href="guides/markdown.html">Markdown authoring</a> <a href="guides/pdf.html">PDF output</a></p>

## Reference generated from real code

Modules, records, unions, traits, functions, and constants become API pages built from their doc comments, with filtering and source links. OpenAPI 3 and Swagger 2 descriptions render as operation and schema pages. Link any page or declaration by its uid, and exchange cross-reference maps with other sites.

<p class="band-links"><a href="guides/api-reference.html">Pudu API reference</a> <a href="guides/http-api.html">HTTP API reference</a> <a href="guides/cross-references.html">Links and cross references</a></p>

## Find everything, theme anything

Tables of contents in YAML, JSON, or Markdown drive the top bar, sidebar, breadcrumbs, and pager. The generated index powers client-side search with keyboard navigation and no server. Override the layout or any partial, add styles and scripts, and set colors and text through metadata.

<p class="band-links"><a href="guides/tables-of-contents.html">Tables of contents</a> <a href="guides/search-and-seo.html">Search and SEO</a> <a href="guides/templates.html">Templates and theming</a></p>

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
