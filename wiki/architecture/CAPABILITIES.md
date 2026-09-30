# Capability ledger

Each row needs implementation, success, failure, and regression checks, output evidence, and
review before release. "Done" means the module and its suite exist and pass; "Open" rows are
still to build. The acceptance boundary lists every behavior a row must cover.

| Capability | Acceptance boundary | Module | State |
| --- | --- | --- | --- |
| Paths | portable relative output, safe hrefs, slugs, joins without escaping the root, relative links | Paths | Done |
| Metadata values | JSON/YAML values, lookup, deep merge, glob-scoped file metadata, compact YAML sequences | Meta | Done |
| Articles | CommonMark blocks and inlines, setext/ATX headings, nested and task lists, loose/tight, pipe tables with alignment, quotes, fences, indented code, sanitized HTML, entities (full HTML table), emoji (full Unicode 18 table), autolinks and bare addresses | Markdown, Inline, Markdown/* | Done |
| Emphasis extras | `~sub~`, `^sup^`, `++inserted++`, `==marked==` | Inline | Done |
| Footnotes | `[^label]` references and definitions, back links | Markdown | Done |
| Media links | images pointing at video hosts or video files become embeds | Markdown/Phrase | Done |
| Authoring | front matter, block and inline includes with cycle checks, code excerpts by region/lines/highlight/dedent, `:::code`, alerts with custom kinds and classes, video, math, mermaid, image directive, row/column layout | Markdown/* | Done |
| PlantUML | `plantuml` fences rendered through a configurable remote server | Markdown/Render | Done |
| Tabs | tab groups ended by `---` or `***`, synchronized ids, dependent tabs by condition | Markdown/Blocks, Theme | Done |
| Highlighting | static coloring by linguist language identity, aliases, extensions, file names | Markdown/Highlight, Languages | Done |
| API metadata | Pudu modules, records, unions, aliases, traits, impls, functions, constants, docs, filters, private members, source links | Api/* | Done |
| API layouts | nested or flattened module navigation, members on the same or separate pages | Api/Catalog, Api/Pages | Done |
| API page format | `#YamlMime:ApiPage` input rendering; `apiPage`, `json`, `markdown` metadata output | Api | Done |
| HTTP API | OpenAPI 3 and Swagger 2 in JSON/YAML, tags, parameters, bodies, responses, schemas, local references | Rest/* | Done |
| Navigation | YAML/JSON/Markdown TOC, nested and folder TOCs, uid items, breadcrumbs, previous/next | Navigation/* | Done |
| TOC metadata | `order`, TOC-level metadata, items titled from their article | Navigation | Done |
| References | uid registry, duplicate refusal, xrefmap YAML/JSON read and write, external maps, `displayProperty`/`text` | References, Markdown/Phrase | Done |
| Overwrite files | `uid` sections replacing summary, remarks, or any property; `*content` | Build | Done |
| Templates | Mustache layout and partials, overrides, `public/main.css`, `public/main.js`, `token.json`, template variables | Template, Theme | Done |
| Site chrome | header, navbar, TOC filter, breadcrumbs, affix, pager, actions, dark/light/auto, print, landing and chromeless layouts, analytics, new-tab links, logo link | Theme, Site/View | Done |
| Page metadata and SEO | tab title with `_appTitle` suffix, favicon, touch icon, theme color, description, keywords, author, canonical, robots, Open Graph and Twitter cards, `_meta` tags, JSON-LD breadcrumbs, analytics tag | Site/View, Theme | Done |
| Style and script injection | template `public/main.css` and `public/main.js` loaded after the defaults; `_appStyle` and `_appScript` for other files | Build, Theme | Done |
| Search | index of indexable pages, ranked client search with keyboard use | Site/Search, Theme | Done |
| Sitemap | base URL, priority, change frequency, per-glob options, last modified | Site/Sitemap | Done |
| Redirects and 404 | `redirect_url` pages; a not-found page for static hosts | Site/Redirect, Build | Done |
| Configuration | typed `docgen.json`/`docgen.yml`, mappings, metadata files, rules, warnings as errors, dry runs | Configuration | Done |
| Build | complete validation before output, link and fragment checks, manifest with generator version, raw and view model export | Build | Done |
| Git features | last modified dates, edit links from repository settings, CI variables, overrides by environment | Docset | Done |
| Incremental output | unchanged files kept, stale outputs removed | Docset | Done |
| CLI | build, metadata, serve with watching, pdf, init, download, merge, template list/export, version, help, exit statuses | Command | Done |
| PDF | per-TOC printable documents, cover page, TOC page, header and footer templates, background printing, detected or configured renderer | Site/Print, Docset/Tasks | Done |
| Release | full tests, mutation score, examples, CI, wiki API docs | tools, examples | Open |

## Referenced by

[[architecture/_MOC]] · [[handoffs/2026-09-29-docgen]]
