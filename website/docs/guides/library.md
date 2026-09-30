---
uid: guides.library
description: Build documentation from Pudu code with Docset.build and Build.plan, and extend it with page transforms and output post-processors.
---

# Library usage

Everything the command line does is available to Pudu programs. Call the package directly to build sites from a larger tool, add pages or files during a build, or check a project in tests.

## Entry points

| Function | Use it to |
| --- | --- |
| <xref:PuduLangDocgen.Command.run> | Run the command line with a list of arguments and get its exit status. |
| <xref:PuduLangDocgen.Docset.build> | Load a project from its configuration file, build it, and publish it incrementally. |
| <xref:PuduLangDocgen.Docset.load> | Load a project into a <xref:PuduLangDocgen.Build.Input> without building it. |
| <xref:PuduLangDocgen.Build.plan> | Build a validated <xref:PuduLangDocgen.Plan> from loaded input, without touching the file system. |
| <xref:PuduLangDocgen.Docset.metadata> | Write API metadata files for the configured sources. |
| <xref:PuduLangDocgen.Docset.pdf> | Build the site and print its PDF documents. |
| <xref:PuduLangDocgen.describe> | Format a diagnostic as `path:line: severity CODE: message`. |

## Build a project

```pudu
export fn build(configFile: Str, chosen: &Options, extending: &Build.Extensions) -> Result[Docgen.Report, Array[Docgen.Diagnostic]]
```

<xref:PuduLangDocgen.Docset.build> reads the configuration, loads every file the project uses, builds the site, and publishes it. On success it returns a <xref:PuduLangDocgen.Report> listing the files written, unchanged, and removed, with any warnings. On failure it returns every diagnostic, and nothing is written.

<xref:PuduLangDocgen.Docset.Options> layers command-line choices over the configuration. Start from <xref:PuduLangDocgen.Docset.options>, which changes nothing, and set the fields you need:

| Field | Type | Effect |
| --- | --- | --- |
| `output` | `Str` | Output folder instead of the configured one. |
| `metadata` | `Array[(Str, Docgen.Meta)]` | Global metadata merged over the configuration. |
| `xref` | `Array[Str]` | More cross-reference maps. |
| `templates` | `Array[Str]` | More template folders. |
| `warningsAsErrors` | `Bool` | Fail on any warning. |
| `dryRun` | `Bool` | Validate and plan without writing. |
| `disableGitFeatures` | `Bool` | Skip git dates and edit links. |
| `force` | `Bool` | Rewrite every output file. |
| `exportRawModel`, `exportViewModel` | `Bool` | Write page models beside the pages. |

[!code-pudu[](samples/CustomBuild.pudu#main "A build with custom options")]

## Extend a build

<xref:PuduLangDocgen.Build.Extensions> holds two lists of functions that run during a build:

```pudu
export type Extensions = { pages: Array[fn(Docgen.Page) -> Docgen.Page], artifacts: Array[fn(Array[Docgen.Artifact]) -> Array[Docgen.Artifact]] }
```

| Field | Runs | Receives |
| --- | --- | --- |
| `pages` | After every page is rendered, before navigation, fragment checks, and layout. | One <xref:PuduLangDocgen.Page> at a time: its path, source, kind, title, uid, body HTML, headings, links, and metadata. |
| `artifacts` | After the whole site is rendered, before output paths are validated. | Every output file as a <xref:PuduLangDocgen.Artifact> with its path and text. |

Use <xref:PuduLangDocgen.Build.extensions> when you need none.

### Page transforms

A page transform returns the page it is given, changed or not. The `kind` of a page is `article`, `rest`, `api-page`, `catalog`, `landing`, `redirect`, or `not-found` for content, and `api-module`, `api-type`, or `api-member` for generated Pudu reference pages. A transform can use it to target one family of pages; the layout also exposes it as a `kind-<kind>` class on the page body.

[!code-pudu[](samples/CustomBuild.pudu#transform "A page transform")]

Changes made by a page transform are validated with the rest of the site: a fragment link to a heading the transform removed is still reported.

### Post-processors

A post-processor receives every output file and returns the files to publish. It can add, remove, or rewrite files; the result is checked for portable, unique paths before anything is written.

[!code-pudu[](samples/CustomBuild.pudu#postprocess "A post-processor that adds a file")]

## Build without writing

<xref:PuduLangDocgen.Build.plan> is a pure function: given loaded input, it returns the complete <xref:PuduLangDocgen.Plan> of files and resources, or every error. Tests can use it to check a documentation project without an output folder:

```pudu
match Docset.load("docs/docgen.json", &Docset.options()) {
  case Ok(loaded) => match Build.plan(&loaded.input, &Build.extensions()) {
    case Ok(plan) => plan.diagnostics.isEmpty()
    case Err(_problems) => false
  }
  case Err(_problems) => false
}
```

## Diagnostics

Every failure is a <xref:PuduLangDocgen.Diagnostic> with a stable code, a <xref:PuduLangDocgen.Severity>, the file, the line, and a message. <xref:PuduLangDocgen.failed> tells whether a list holds an error. The codes are listed in the [diagnostics reference](diagnostics.md).
