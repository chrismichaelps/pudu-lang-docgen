---
type: module
path: "@root/src/PuduLangDocgen/Docset.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Docset

> /** @Docgen.Docset.Seam — a project folder loaded, built, and published */

## Purpose

The library entry for whole projects: load a configuration with command-line options applied,
build and publish incrementally, build with PDFs, produce PDFs, write API metadata, and compute
the source fingerprint used for watching.

## Interface

### Signatures

```pudu
export type Options = {
  output: Str,
  metadata: Array[(Str, Docgen.Meta)],
  xref: Array[Str],
  templates: Array[Str],
  warningsAsErrors: Bool,
  dryRun: Bool,
  disableGitFeatures: Bool,
  force: Bool,
  exportRawModel: Bool,
  exportViewModel: Bool
}
export type Loaded = { base: Str, input: Build.Input, diagnostics: Array[Docgen.Diagnostic] }
export fn options() -> Options
export fn load(configFile: Str, chosen: &Options) -> Result[Loaded, Array[Docgen.Diagnostic]]
export fn build(configFile: Str, chosen: &Options, extending: &Build.Extensions) -> Result[Docgen.Report, Array[Docgen.Diagnostic]]
export fn buildAll(configFile: Str, chosen: &Options) -> Result[(Docgen.Report, Array[Str]), Array[Docgen.Diagnostic]]
export fn pdf(configFile: Str, chosen: &Options) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn metadata(configFile: Str, chosen: &Options) -> Result[Array[Str], Array[Docgen.Diagnostic]]
export fn fingerprint(configFile: Str, output: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen/Api/Catalog]] · [[src/PuduLangDocgen/Api/Export]] · [[src/PuduLangDocgen/Api/Model]] · [[src/PuduLangDocgen/Api/Parser]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Site]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Configuration]] · [[src/PuduLangDocgen/Constants/Codes]] · [[src/PuduLangDocgen/Constants/Package]] · [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Docset/Publish]] · [[src/PuduLangDocgen/Docset/Tasks]] · [[src/PuduLangDocgen/Docset/Tools]] · [[src/PuduLangDocgen/Docset/Walk]] · [[src/PuduLangDocgen/Markdown]] · [[src/PuduLangDocgen/Meta]] · [[src/PuduLangDocgen/References]] · [[src/PuduLangDocgen/Yaml]]
- **Consumed by:** [[examples/BuildSite]] · [[src/PuduLangDocgen/Command]] · [[test/PuduLangDocgen/DocsetTest]]

## Algorithm

- `options` — Options that leave the configuration as written.
- `load` — A project read from its configuration file with options applied.
- `build` — A project built and, unless the run is dry, published incrementally.
- `buildAll` — The site built and published, then a PDF for every table of contents that sets `pdf`. Unlike `pdf`, a missing renderer is a warning here, so sites build on machines without a browser.
- `pdf` — The site built and published, then a PDF for every table of contents that sets `pdf`.
- `metadata` — API metadata written as files beside the configuration, in each source's format.
- `fingerprint` — A digest of every project file's path and content outside the output folder, which changes whenever a source the build reads changes.

Loading reads the configuration, walks the project, reads sources, API units, resources,
templates, reference maps, diagrams, git history, and repository settings. When reference
services are configured, a trial build finds unresolved identities and the services are asked
for them before the real build.

## Negative Logic (Prohibited Paths)

- Do not write when the run is dry.
- Do not publish a plan that failed validation.
- Do not ask reference services for identities the project or its maps already resolve.

## Edge Cases

- A missing configuration file is a single diagnostic, not an exception.
- Git features degrade to nothing when git is not installed.

## Depth

DEEP. Five calls cover every command; all effects of a build pass through here.

## Grill Log

- Q: Query services for every reference? A: Only for what a trial build could not resolve. Rejected: one request per cross reference in the site.
- Q: Fail the build when a service is down? A: Warn and continue; the references stay unresolved warnings. Rejected: builds that depend on a network.

## Referenced by

[[src/PuduLangDocgen/_MOC]] · [[src/PuduLangDocgen/Command]]
