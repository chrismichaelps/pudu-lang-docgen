---
type: module
path: "@root/src/PuduLangDocgen/Configuration.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Configuration

> /** @Docgen.Configuration.Module — the typed project configuration of a documentation site */

## Purpose

Reads `docgen.json` or `docgen.yml` into a typed `Config`: API sources and their layouts,
content, resource, and overwrite mappings, output folder, global and file metadata, templates,
reference maps and services, sitemap, git features, diagnostic rules, Markdown engine
properties, dry runs, model export, and PDF settings.

## Interface

### Signatures

```pudu
export type Mapping = { files: Array[Str], exclude: Array[Str], src: Str, dest: Str, meta: Array[(Str, Docgen.Meta)] }
export type ApiSource = { mappings: Array[Mapping], options: Catalog.Options, format: Str, filterFile: Str }
export type Contribution = { repo: Str, branch: Str, path: Str }
export type Diagrams = { remote: Str, format: Str, local: Bool, jar: Str, java: Str }
export type Pdf = { renderer: Array[Str] }
export type Config = {
  metadata: Array[ApiSource],
  content: Array[Mapping],
  resource: Array[Mapping],
  overwrite: Array[Mapping],
  output: Str,
  globalMetadata: Array[(Str, Docgen.Meta)],
  globalMetadataFiles: Array[Str],
  fileMetadata: Array[Meta.Rule],
  fileMetadataFiles: Array[Str],
  templates: Array[Str],
  xref: Array[Str],
  xrefService: Array[Str],
  sitemap: Option[Sitemap.Options],
  gitFeatures: Bool,
  contribution: Contribution,
  warningsAsErrors: Bool,
  rules: Array[(Str, Str)],
  alerts: Array[(Str, Str)],
  diagrams: Diagrams,
  dryRun: Bool,
  exportRawModel: Str,
  exportViewModel: Str,
  pdf: Option[Pdf]
}
export const LEVELS: Array[Str] = ["error", "warning", "info", "off"]
export fn defaults() -> Config
export fn parse(file: Str, text: Str) -> Result[Config, Array[Docgen.Diagnostic]]
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Configuration/Fields]] · [[src/PuduLangDocgen/Configuration/Rules]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/Site/Sitemap]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tools]] · [[test/PuduLangDocgen/BuildTest]] · [[test/PuduLangDocgen/ConfigurationTest]] · [[test/PuduLangDocgen/InlineTest]] · [[test/PuduLangDocgen/SiteLandingTest]]

## Algorithm

- `defaults` — Settings used when a configuration names nothing else.
- `parse` — A configuration read from JSON or YAML text; the file name decides the format and appears in every diagnostic.

## Negative Logic (Prohibited Paths)

- Do not accept unknown keys; each object lists the keys it allows.
- Do not report more than the first shape error; cross-field rules then report all of theirs.

## Edge Cases

- A single text or object where a list is expected counts as a list of one.
- `dest` is accepted where `output` is expected.
- Paths may start with `./`; they may not leave the project.

## Depth

DEEP. One call produces every setting with exact error locations.

## Grill Log

- Q: Silently ignore unknown keys? A: Refuse them with their dotted location. Rejected: typos that quietly change nothing.
- Q: Validate relations in the reader? A: A separate rule set in [[src/PuduLangDocgen/Configuration/Rules]]. Rejected: rules scattered through parsing.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Docset]] · [[src/PuduLangDocgen/Docset/Tools]]
