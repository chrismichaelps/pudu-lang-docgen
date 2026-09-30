---
uid: guides.configuration
description: Every docgen.json setting with its type, default, and effect.
---

# Configuration reference

A project is configured by `docgen.json` in the project folder. The same settings can be written as YAML in a `.yml` or `.yaml` file; pass that file's path to the command line instead of a folder.

The file has three top-level sections. Any key that is not listed on this page is rejected with `DG501`, which names the exact location of the key, such as `build.sitemap.priority`.

```json
{
  "metadata": [ ],
  "build": { },
  "pdf": { }
}
```

All paths are relative to the configuration file's folder and may not leave it, except API source folders, which may start with `../`.

## File mappings

`build.content`, `build.resource`, `build.overwrite`, and `metadata[].src` select files with mappings. A mapping is an object, and a key may hold one mapping or a list of them. A plain glob, or a list of plain globs, is shorthand for one mapping with only `files`.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | glob or list of globs | required | Files to select, matched against their path inside `src`. |
| `exclude` | glob or list of globs | none | Files to leave out. |
| `src` | folder | project folder | The folder the globs apply to. Its name is not part of the output path. |
| `dest` | folder | output root | The folder the selected files are published under. |
| `group` | text | none | The name of an entry in `build.groups` whose `dest` and metadata apply to these files. |

The first mapping that selects a file wins.

## API metadata settings

`metadata` is a list of sources, each producing an [API reference](api-reference.md).

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `src` | mappings | required | The Pudu source files to document. `src` folders may lie above the project with `../`. |
| `dest` | folder | `api` | The folder that receives the reference pages and their `toc.yml`. |
| `includePrivateMembers` | flag | `false` | Also document declarations that are not exported. |
| `filter` | object or path | none | `include` and `exclude` lists of uid globs, or the path of a YAML file of `apiRules`. |
| `sourceUrl` | text | none | A link pattern for source lines; `{path}` and `{line}` are filled in. |
| `sourceLinkExclude` | list of globs | none | Source paths that get no source link. |
| `outputFormat` | `json`, `markdown`, `apiPage` | `json` | The format the `metadata` command writes. |
| `namespaceLayout` | `flattened`, `nested` | `flattened` | Whether modules nest by their dotted names in navigation. |
| `memberLayout` | `samePage`, `separatePages` | `samePage` | Whether functions and constants get pages of their own. |
| `categoryLayout` | `flattened`, `nested`, `none` | `flattened` | How a module's navigation entries are grouped by kind. |
| `enumSortOrder` | `declaringOrder`, `alphabetic` | `declaringOrder` | The order of union variants. |
| `shouldSkipMarkup` | flag | `false` | Show doc comments as plain text instead of Markdown. |

## Build settings

### Inputs

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | mappings | none | Articles, tables of contents, OpenAPI descriptions, API pages, and catalogs. |
| `resource` | mappings | none | Files copied to the output unchanged. |
| `overwrite` | mappings | none | [Overwrite files](concepts.md#overwrite-files) that amend pages by uid. |
| `xref` | list of paths or addresses | none | [Cross-reference maps](cross-references.md#cross-reference-maps) of other sites. |
| `xrefService` | list of addresses holding `{uid}` | none | [Reference services](cross-references.md#reference-services) asked for identities nothing else resolves. |
| `groups` | object | none | Named sets of `dest` and metadata that mappings refer to with `group`. |

### Output

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | folder | `_site` | Where the site is written. `dest` is accepted as another name for it. It may not be the project folder itself. |
| `dryRun` | flag | `false` | Validate and plan the site without writing anything. |
| `exportRawModel` | flag | `false` | Write each page's data model as `<page>.raw.json`. |
| `rawModelOutputFolder` | folder | the output folder | Where raw models are written. |
| `exportViewModel` | flag | `false` | Write each page's template view as `<page>.view.json`. |
| `viewModelOutputFolder` | folder | the output folder | Where view models are written. |

### Metadata

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `globalMetadata` | object | none | Metadata for every page. See [page metadata](templates.md#page-metadata). |
| `globalMetadataFiles` | list of paths | none | JSON or YAML files merged into global metadata, later files winning. |
| `fileMetadata` | object | none | Metadata by glob: each key maps glob patterns to the value files matching them receive. |
| `fileMetadataFiles` | list of paths | none | JSON or YAML files of further `fileMetadata` rules. |

```json
"fileMetadata": {
  "_disableContribution": { "docs/generated/**": true },
  "keywords": { "docs/guides/**": ["guide"] }
}
```

`fileMetadata` globs match the file's path in the project, such as `docs/guides/markdown.md`.

### Appearance

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `template` | list of names or folders | `["default"]` | The built-in template followed by template folders, later ones overriding earlier ones. Also accepts the built-in extensions `rest.tagpage` and `rest.operationpage`. |
| `theme` | list of folders | none | Template folders applied after every `template` entry. |
| `markdownEngineProperties.alerts` | object | none | Extra alert kinds mapped to the CSS classes they use, such as `{ "SECURITY": "alert alert-caution" }`. |
| `markdownEngineProperties.plantUml.remoteUrl` | address | `https://www.plantuml.com/plantuml` | The PlantUML server. |
| `markdownEngineProperties.plantUml.outputFormat` | `svg`, `png`, `txt` | `svg` | The diagram format requested. |
| `markdownEngineProperties.plantUml.renderingMode` | `remote`, `local` | `remote` | `local` draws diagrams during the build with a local PlantUML. |
| `markdownEngineProperties.plantUml.localPlantUmlPath` | path | `plantuml.jar` | The PlantUML archive used for local rendering. |
| `markdownEngineProperties.plantUml.javaPath` | path | `java` | The Java runtime used for local rendering. |

### Search engines

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `sitemap.baseUrl` | address | required | The absolute `http` or `https` address the site is published at. |
| `sitemap.changefreq` | `always`, `hourly`, `daily`, `weekly`, `monthly`, `yearly`, `never` | none | The change frequency of every page. |
| `sitemap.priority` | number from 0.0 to 1.0 | none | The priority of every page. |
| `sitemap.fileOptions` | object | none | `baseUrl`, `changefreq`, and `priority` for pages matching each glob; the last matching glob wins. |

The sitemap is written only when `sitemap` is present. See [Search and SEO](search-and-seo.md).

### Repository

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `disableGitFeatures` | flag | `false` | Skip last-modified dates and edit links taken from git. |
| `gitContribute.repo` | address | detected | The repository behind **Edit this page** links. |
| `gitContribute.branch` | text | `main` | The branch edit links point at. |
| `gitContribute.path` | folder | none | The project folder's path inside the repository. |

Without `gitContribute.repo`, the repository is read from `DOCGEN_SOURCE_REPOSITORY_URL`, then from the variables of common build services, then from the local clone's `origin` remote. The branch is read the same way, starting with `DOCGEN_SOURCE_BRANCH_NAME`. Edit links follow the conventions of GitHub, GitLab, Bitbucket, and Azure DevOps.

### Diagnostics

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `warningsAsErrors` | flag | `false` | Fail the build on any warning. |
| `rules` | object | none | Diagnostic codes mapped to `error`, `warning`, `info`, or `off`. |

```json
"rules": { "DG211": "error", "DG124": "off" }
```

See the [diagnostics reference](diagnostics.md) for every code.

## PDF settings

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `pdf.renderer` | list of text | detected | The command that prints a document, with `{input}`, `{output}`, `{url}`, `{header}`, and `{footer}` filled in. |

See [PDF output](pdf.md).

## Complete example

This site's configuration:

[!code-json[](../../docgen.json "website/docgen.json")]
