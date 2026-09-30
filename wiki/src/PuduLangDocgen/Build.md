---
type: module
path: "@root/src/PuduLangDocgen/Build.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Build

> /** @Docgen.Build.Module — a complete, validated site plan from loaded project content */

## Purpose

Turns a loaded project into a complete, validated site plan: articles, API and HTTP
reference, catalogs, redirects, navigation, search, sitemap, cross-reference map, manifest,
theme, and printable documents. Nothing is planned for output unless the whole site validates.
`Extensions` let a program change pages or artifacts on the way out.

## Interface

### Signatures

```pudu
export type Input = {
  config: Configuration.Config,
  paths: Array[Str],
  files: Map[Str, Str],
  resources: Array[(Str, Docgen.Resource)],
  units: Array[Array[Model.Unit]],
  external: Array[Docgen.Reference],
  template: Array[(Str, Str)],
  assets: Array[Docgen.Resource],
  history: Map[Str, Str],
  repository: Configuration.Contribution,
  diagrams: Map[Str, Str],
  generator: Str,
  today: Str
}
export type Extensions = { pages: Array[fn(Docgen.Page) -> Docgen.Page], artifacts: Array[fn(Array[Docgen.Artifact]) -> Array[Docgen.Artifact]] }
export fn extensions() -> Extensions
export type Built = { plan: Docgen.Plan, pages: Array[Docgen.Page], books: Array[Site.Book] }
export fn plan(input: &Input, extending: &Extensions) -> Result[Docgen.Plan, Array[Docgen.Diagnostic]]
export fn site(input: &Input, extending: &Extensions) -> Result[Built, Array[Docgen.Diagnostic]]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Inline]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Markdown/Syntax]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Format]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Theme]]
- **Consumed by:** [[examples/BuildSite]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[test/PuduLangDocgen/BuildTest]] · [[test/PuduLangDocgen/DocsetTest]] · [[test/PuduLangDocgen/SiteLandingTest]]

## Algorithm

- `extensions` — Extensions that change nothing.
- `plan` — The site plan, or every error found. Warnings travel with a successful plan; nothing is planned for output unless the whole site validates.
- `site` — The site plan with its pages and resolved tables of contents, for work that continues from a built site such as printable documents.

Identities are collected from every source first, so forward references resolve. Pages are
rendered, page extensions run, fragments are checked across the site, navigation is resolved,
the layout is applied, site files are added, artifact extensions run, output paths are checked,
and diagnostic rules apply last.

## Negative Logic (Prohibited Paths)

- Do not read or write files; `Input` carries everything.
- Do not return a partial plan when any diagnostic is an error.
- Do not trust paths produced by extensions; outputs are checked after them.

## Edge Cases

- A site without a `404.html` gets a generated one.
- Article order in printable documents follows the tables of contents, not file names.
- A configuration that selects no content and no API sources is refused.

## Depth

DEEP. Two calls hide the whole build; everything else in the package is reachable from here.

## Grill Log

- Q: Render while collecting identities? A: Collect first, render second. Rejected: references that only resolve to earlier files.
- Q: Let extensions add files after validation? A: Validation runs after extensions. Rejected: unchecked output paths.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tasks]]
