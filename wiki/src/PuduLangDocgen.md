---
type: module
path: "@root/src/PuduLangDocgen.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen

> /** @Docgen.Model.Module — shared documentation values across publishing phases */

## Purpose

The values every phase exchanges: diagnostics with stable codes, metadata, sources and
resources, headings, links, references, navigation items, pages, output artifacts, plans, and
publication reports. Pure phases produce these; only the seams turn them into files. See
[[architecture/LANGUAGE]] for the vocabulary.

## Interface

### Signatures

```pudu
export type Severity = Information | Warning | Error
export type Diagnostic = { code: Str, severity: Severity, path: Str, line: Int, message: Str }
export type Meta = Text(Str) | Whole(Int) | Flag(Bool) | Items(Array[Meta]) | Fields(Array[(Str, Meta)]) | Nothing
export type Source = { path: Str, text: Str }
export type Resource = { path: Str, content: Bytes }
export type Heading = { id: Str, title: Str, level: Int }
export type Link = { target: Str, line: Int }
export type Reference = { uid: Str, name: Str, fullName: Str, href: Str, kind: Str }
export type TocItem = { title: Str, href: Str, uid: Str, expanded: Bool, children: Array[TocItem] }
export type Page = {
  path: Str,
  source: Str,
  kind: Str,
  title: Str,
  uid: Str,
  summary: Str,
  body: Str,
  headings: Array[Heading],
  links: Array[Link],
  meta: Array[(Str, Meta)]
}
export type Artifact = { path: Str, content: Str }
export type Plan = { artifacts: Array[Artifact], resources: Array[Resource], diagnostics: Array[Diagnostic] }
export type Report = { written: Array[Str], unchanged: Array[Str], removed: Array[Str], diagnostics: Array[Diagnostic] }
export fn diagnostic(severity: Severity, code: Str, path: Str, line: Int, message: Str) -> Diagnostic
export fn error(code: Str, path: Str, line: Int, message: Str) -> Diagnostic
export fn warning(code: Str, path: Str, line: Int, message: Str) -> Diagnostic
export fn failed(diagnostics: &Array[Diagnostic]) -> Bool
export fn describe(held: &Diagnostic) -> Str
```

### Linkage

- **Requires:** nothing inside the package
- **Consumed by:** [[examples/BuildSite]] · [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/Strings]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]] · [[src/PuduLangDocgen/Theme]] · [[src/PuduLangDocgen/Yaml]] · [[test/PuduLangDocgen/ApiTest]] · [[test/PuduLangDocgen/BuildTest]] · [[test/PuduLangDocgen/ConfigurationTest]] · [[test/PuduLangDocgen/DocsetTest]] · [[test/PuduLangDocgen/InlineTest]] · [[test/PuduLangDocgen/MarkdownTest]] · [[test/PuduLangDocgen/NavigationTest]] · [[test/PuduLangDocgen/ReferencesTest]] · [[test/PuduLangDocgen/RestTest]] · [[test/PuduLangDocgen/SiteLandingTest]] · [[test/PuduLangDocgen/TemplateTest]] · [[test/PuduLangDocgen/ThemeTest]]

## Algorithm

- `diagnostic` — A diagnostic of the given severity at a one-based source line.
- `error` — A fatal diagnostic at a one-based source line.
- `warning` — A warning at a one-based source line.
- `failed` — Whether any diagnostic is fatal.
- `describe` — A diagnostic rendered as `path:line: severity CODE: message`.

`describe` prints `path:line: severity CODE: message`, the one format the command line,
logs, and tests share. `failed` looks only at severity, so rules that lower or raise levels
change the outcome without touching the producers.

## Negative Logic (Prohibited Paths)

- Do not add phase-specific fields to `Page`; phases keep their own records and fill `meta`.
- Do not treat an information or warning diagnostic as a failure; only `Error` stops a build.

## Edge Cases

- A diagnostic at line 0 still prints its path and code.
- `Meta.Nothing` stands for an explicit null and differs from a missing key.

## Depth

DEEP. A handful of plain records hides no logic of its own, but every other module speaks in them, so
the surface is small and stable while the reach is total.

## Grill Log

- Q: Carry severity as text? A: A closed union, so a misspelled level cannot exist. Rejected: strings compared at every call site.
- Q: Keep binary resources as text? A: `Resource` holds `Bytes`; images and fonts pass through untouched. Rejected: base64 text round trips.

## Referenced by

[[src/_MOC]] · [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Pages]] · [[src/PuduLangDocgen/Api/Sheet]] · [[src/PuduLangDocgen/Api/Signature]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Checks]] · [[src/PuduLangDocgen/Build/Overwrite]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Command]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Markdown/Blocks]] · [[src/PuduLangDocgen/Markdown/FrontMatter]] · [[src/PuduLangDocgen/Markdown/Leaves]] · [[src/PuduLangDocgen/Markdown/Phrase]] · [[src/PuduLangDocgen/Markdown/Render]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Navigation/Resolve]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Rest/Pages]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Site/Landing]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Site/Search]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Site/Strings]] · [[src/PuduLangDocgen/Site/View]] · [[src/PuduLangDocgen/Template]] · [[src/PuduLangDocgen/Theme]] · [[src/PuduLangDocgen/Yaml]]
