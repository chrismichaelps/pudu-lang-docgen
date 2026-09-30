---
type: module
path: "@root/src/PuduLangDocgen/Docset/Tasks.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Docset.Tasks

> /** @Docgen.Docset.Tasks — project scaffolding, template export, printing, and reference maps */

## Purpose

Project tasks beyond building: scaffolding a new project, exporting the default template,
printing and rendering PDFs, downloading a cross-reference map, and merging maps.

## Interface

### Signatures

```pudu
export fn init(folder: Str, answers: &Scaffold.Answers) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn exportTemplate(folder: Str) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn pdf(base: Str, built: &Build.Built, output: Str, renderer: &Array[Str]) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn download(address: Str, file: Str) -> Result[Int, Array[Docgen.Diagnostic]]
export fn merge(sources: &Array[Str], file: Str) -> Result[Int, Array[Docgen.Diagnostic]]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen/Constants/Package]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Paths]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Scaffold]] · [[src/PuduLangDocgen/Site/Print]] · [[src/PuduLangDocgen/Theme/Layout]] · [[src/PuduLangDocgen/Theme]]
- **Consumed by:** [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `init` — A new project written into a folder; a folder that already holds a configuration is left alone.
- `exportTemplate` — The default layout, partials, and assets written into a folder for customization.
- `pdf` — Printable documents for every table that sets `pdf`, published and then rendered to PDF.
- `download` — A cross-reference map saved from a web address after checking that it reads.
- `merge` — Cross-reference maps read from files or web addresses and written as one; the first map to declare an identity keeps it.

## Negative Logic (Prohibited Paths)

- Do not overwrite an existing configuration on init.
- Do not save a downloaded map that does not parse.

## Edge Cases

- Merging keeps the first map's entry for a repeated identity.
- PDF rendering names the configured program or the first browser found.

## Depth

MODERATE. Each task is a short sequence over pure builders.

## Grill Log

- Q: Bundle a PDF engine? A: Use a browser or a configured program. Rejected: a heavy dependency most sites never need.

## Referenced by

[[src/PuduLangDocgen/Docset/_MOC]] · [[src/PuduLangDocgen/Command/Actions]] · [[src/PuduLangDocgen/Docset]]
