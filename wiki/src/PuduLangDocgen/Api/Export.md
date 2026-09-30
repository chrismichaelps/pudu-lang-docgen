---
type: module
path: "@root/src/PuduLangDocgen/Api/Export.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: MODERATE
tags: [module, moderate]
---

# PuduLangDocgen.Api.Export

> /** @Docgen.Api.Export — extracted declarations written as model, Markdown, or API page files */

## Purpose

Writes extracted declarations as files for other tools or later builds: the raw JSON model,
Markdown pages, or `#YamlMime:ApiPage` documents, plus a `toc.yml` of modules and types. This is
what the `metadata` command publishes.

## Interface

### Signatures

```pudu
export const FORMATS: Array[Str] = ["json", "markdown", "apiPage"]
export fn files(units: &Array[Model.Unit], format: Str) -> Array[(Str, Str)]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]] · [[test/PuduLangDocgen/ApiExportTest]]

## Algorithm

- `files` — Files for selected modules in a format, with paths relative to the metadata folder and a `toc.yml` listing modules and their types.

## Negative Logic (Prohibited Paths)

- Do not write paths outside the metadata folder; every path is an identity plus an extension.
- Do not drop private members here; selection already happened in the catalog.

## Edge Cases

- A module without types produces only its own file.
- Unknown formats are rejected earlier by configuration, so only the three names reach this module.

## Depth

MODERATE. Three encoders behind one call; the shared part is the table of contents.

## Grill Log

- Q: One file per member? A: One file per module and per type, matching the published page layout. Rejected: a file per function that nobody reads.

## Referenced by

[[src/PuduLangDocgen/Api/_MOC]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Docset]]
