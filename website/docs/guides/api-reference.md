---
uid: guides.api-reference
description: Generate reference pages from the public declarations and doc comments of Pudu modules, and control their selection and layout.
---

# Pudu API reference

The `metadata` section of `docgen.json` turns Pudu source files into reference pages. Each module gets a page listing its functions and constants; each record, union, alias, and trait gets a page of its own with its fields, variants, or methods. Documentation comes from the doc comments in the source.

The [API section of this site](xref:PuduLangDocgen) is generated from the package's own `src` folder with this configuration:

```json
"metadata": [
  {
    "src": [ { "files": ["**/*.pudu"], "src": "../src" } ],
    "dest": "api",
    "namespaceLayout": "nested",
    "categoryLayout": "nested",
    "filter": "filterConfig.yml",
    "sourceUrl": "https://github.com/chrismichaelps/pudu-lang-docgen/blob/main/src/{path}#L{line}"
  }
]
```

## What is documented

| Declaration | Page | Shows |
| --- | --- | --- |
| Module | `api/<Module>.html` | The module comment, then its functions and constants as sections. |
| Record, union, alias, opaque type | `api/<Module>.<Type>.html` | The signature, documentation, and fields or variants. |
| Trait | `api/<Module>.<Trait>.html` | The signature, documentation, and methods. |
| Function, constant | A section of its module page | The signature and documentation. |

Only exported declarations are published unless `includePrivateMembers` is `true`. Every declaration gets a [uid](cross-references.md#identities) equal to its qualified name, so articles can link to it with `<xref:PuduLangDocgen.Docset.build>`.

## Doc comments

Consecutive `///` comments document the declaration below them, and a `/** ... */` block before a module or type documents it the same way. A block that starts with a role anchor such as `@Docgen.Docset.Seam —` is reduced to the text after the dash. The first paragraph is the summary shown in lists; the rest are remarks. Doc comments are Markdown, so they may contain code, lists, links, and cross references.

```pudu
/** @Docgen.Docset.Seam — a project folder loaded, built, and published */
module PuduLangDocgen.Docset

/// A project built and, unless the run is dry, published incrementally.
export fn build(configFile: Str, chosen: &Options, extending: &Build.Extensions) -> Result[Docgen.Report, Array[Docgen.Diagnostic]] {
```

Set `shouldSkipMarkup` to `true` to show doc comments as plain paragraphs instead of rendering them as Markdown.

## Selecting sources

`src` uses the same mapping shape as content: `files` globs, optional `exclude` globs, and a `src` folder. Unlike content, an API source folder may lie above the project folder, written with leading `../` segments, so a documentation folder can document the package that contains it.

Narrow what is published with `filter`:

# [Globs](#tab/globs)

`include` and `exclude` match uids with globs. A module is kept when an `include` pattern matches it or starts with its uid.

```json
"filter": {
  "include": ["PuduLangDocgen.Docset*", "PuduLangDocgen.Build*"],
  "exclude": ["*.Internal*"]
}
```

# [Rule file](#tab/rules)

`filter` may instead name a YAML file of ordered rules. Each rule matches uids with a regular expression, optionally only for one kind: `Module`, `Type`, `Function`, `Constant`, or `Member`. The first matching rule decides.

```yaml
apiRules:
- exclude:
    uidRegex: ^PuduLangDocgen\.Meta$
    type: Module
- include:
    uidRegex: ^PuduLangDocgen\.
```

---

## Layouts

| Setting | Values | Effect |
| --- | --- | --- |
| `namespaceLayout` | `flattened` (default), `nested` | `nested` arranges modules by their dotted names, so `PuduLangDocgen.Build.Site` appears under `PuduLangDocgen.Build`. `flattened` lists every module at the top level. |
| `memberLayout` | `samePage` (default), `separatePages` | `separatePages` gives each function and constant a page of its own and lists it in navigation. |
| `categoryLayout` | `flattened` (default), `nested`, `none` | How a module's entries are grouped in navigation: under **Types**, **Traits**, **Functions**, and **Constants** headings (`nested`), after flat heading labels (`flattened`), or not at all (`none`). |
| `enumSortOrder` | `declaringOrder` (default), `alphabetic` | The order of union variants. |

The generated table of contents is published as `<dest>/toc.yml`, so a navigation item with `href: api/` leads to it.

## Source links

`sourceUrl` adds a **View source** link to every declaration. `{path}` is replaced by the file path relative to the mapping's `src` folder and `{line}` by the declaration's line. `sourceLinkExclude` lists globs of paths that get no link.

## Metadata files

The [metadata](commands/metadata.md) command writes the model of every selected module without building the site, in the format chosen by `outputFormat`:

| `outputFormat` | Files |
| --- | --- |
| `json` (default) | One JSON document per module. |
| `markdown` | One Markdown page per module and per type. |
| `apiPage` | One `#YamlMime:ApiPage` document per module. |

Each format also writes a `toc.yml`. An `apiPage` document can be listed as content in another project and is rendered as a reference page there.
