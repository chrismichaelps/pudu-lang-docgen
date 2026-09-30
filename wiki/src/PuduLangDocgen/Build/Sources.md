---
type: module
path: "@root/src/PuduLangDocgen/Build/Sources.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Build.Sources

> /** @Docgen.Build.Sources — project files mapped to outputs and read into typed documents */

## Purpose

Maps project files to outputs through content mappings and reads each into a typed document:
Markdown article, HTTP interface description, API page, catalog, or redirect. Metadata is layered
here: global, group, file rules, then the file's own header.

## Interface

### Signatures

```pudu
export type Document = Article(Markdown.Article) | Service(OpenApi.Service) | ApiPage(Docgen.Meta) | Catalog(Docgen.Meta) | Moved(Str)
export type Entry = { source: Str, output: Str, meta: Array[(Str, Docgen.Meta)], document: Document }
export type Read = { entries: Array[Entry], tocs: Array[(Str, Str, Navigation.Toc)], diagnostics: Array[Docgen.Diagnostic] }
export fn mapped(mappings: &Array[Configuration.Mapping], paths: &Array[Str], skip: &Array[Str]) -> Array[(Str, Str)]
export fn groupMeta(mappings: &Array[Configuration.Mapping], paths: &Array[Str], skip: &Array[Str]) -> Map[Str, Array[(Str, Docgen.Meta)]]
export fn metadata(config: &Configuration.Config, files: &Map[Str, Str]) -> (Array[(Str, Docgen.Meta)], Array[Meta.Rule], Array[Docgen.Diagnostic])
export fn read(content: &Array[(Str, Str)], files: &Map[Str, Str], global: &Array[(Str, Docgen.Meta)], rules: &Array[Meta.Rule], alerts: &Array[Str], groups: &Map[Str, Array[(Str, Docgen.Meta)]]) -> Read
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Navigation]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/Rest/OpenApi]] · [[src/PuduLangDocgen/Site/Gallery]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/InlineTest]]

## Algorithm

- `mapped` — Project files selected by mappings, each paired with its output path. A file matches when it lies under the mapping's source folder, a `files` glob matches its path inside that folder, and no `exclude` glob does. The output keeps that inner path under `dest`. Files under `skip` folders are never selected; the first mapping to select a file wins.
- `groupMeta` — Metadata that the group of a file's mapping gives it, by source path.
- `metadata` — Global metadata and file metadata rules from the configuration and the metadata files it names; later files override earlier values.
- `read` — Content files read by kind: Markdown articles and redirects, HTTP interface descriptions, structured API pages, and tables of contents. Metadata merges global values, then file metadata of the file's group, then file rules, then the file's own header, which wins.

## Negative Logic (Prohibited Paths)

- Do not select files under the output folder or the state folder.
- Do not let a later mapping re-map a file the first mapping selected.

## Edge Cases

- `redirect_url` in a header makes a redirect page regardless of body.
- A YAML file is recognized by its first-line marker or its content shape.

## Depth

DEEP. File selection, format recognition, and metadata layering behind two calls.

## Grill Log

- Q: Header metadata lose to global metadata? A: The file's own header wins; it is the most specific. Rejected: global values overriding authors.

## Referenced by

[[src/PuduLangDocgen/Build/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Docset]]
