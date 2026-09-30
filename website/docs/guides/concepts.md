---
uid: guides.concepts
description: The building blocks of a documentation project - content, resources, metadata, overwrite files, templates, and output.
---

# Basic concepts

A documentation project is a folder with a `docgen.json` file. Every path in the configuration is relative to that folder, and the build never reads or writes outside it, with one exception: API metadata sources may name a folder above the project, such as `../src`.

```text
website/
  docgen.json          configuration
  docs/                content: Markdown, tables of contents, OpenAPI, catalogs
  images/              resources copied as they are
  overwrite/           overwrite files that amend generated pages
  template/            template folder: partial overrides and public assets
  _site/               output, written by the build
  .docgen/             build state used for incremental publishing
```

## Content

Content files are the pages of the site. The `build.content` setting selects them with globs:

```json
"content": [
  { "files": ["**/*.md", "**/toc.yml"], "exclude": ["drafts/**"], "src": "docs", "dest": "" }
]
```

A file is selected when it lies under `src`, a `files` glob matches its path inside `src`, and no `exclude` glob does. The output keeps that inner path under `dest`, with `.md`, `.yml`, and `.json` becoming `.html`. The first mapping that selects a file wins.

The kind of a content file decides how it is read:

| File | Read as |
| --- | --- |
| `*.md`, `*.markdown` | An article, or a redirect page when its metadata sets `redirect_url`. |
| `toc.yml`, `toc.yaml`, `toc.json`, `toc.md` | A [table of contents](tables-of-contents.md). |
| YAML or JSON with an `openapi` or `swagger` key | An [HTTP API reference](http-api.md) page. |
| YAML or JSON whose first line is `#YamlMime:ApiPage` | A structured API page. |
| YAML whose first line contains `YamlMime:Dashboard` | A catalog page of cards. |
| YAML whose first line contains `YamlMime:Landing` | A [landing page](templates.md#landing-pages) with a banner and topic lists. |

Any other selected file is reported with `DG603` and skipped; list it as a resource instead.

## Resources

Resources are copied to the output without change: images, downloads, and any other static file. They use the same mapping shape as content:

```json
"resource": [ { "files": ["images/**"] } ]
```

Articles can link to resources, and the build checks that every image and link target exists.

## Metadata

Metadata is a set of keys and values attached to each page. Templates read it to decide what a page shows, and the build reads some keys itself. Values come from four places, applied in this order so that later ones win:

1. `build.globalMetadata`, and the files named by `build.globalMetadataFiles`.
2. `build.fileMetadata` rules, which assign a value to every file a glob matches, and the files named by `build.fileMetadataFiles`.
3. The article's own front matter.
4. Overwrite sections for the page's uid.

```yaml
---
title: Deploying
uid: guides.deploying
description: Publish the site to any static host.
_disableAffix: true
---
```

Keys that start with an underscore, such as `_appTitle` or `_disableToc`, are read by the template. The complete list is in [Templates and theming](templates.md#page-metadata).

## Overwrite files

An overwrite file amends a page or a generated declaration without editing its source. Each section starts with a YAML header that names a `uid`; the Markdown that follows the header is the section's content.

```markdown
---
uid: PuduLangDocgen.Docset.build
example: *content
---
Build the project in `website` with the default options:

    Docset.build("website/docgen.json", &Docset.options(), &Build.extensions())
```

| Header value | Effect on an API declaration |
| --- | --- |
| `summary: *content` | Replaces the summary. |
| `remarks: *content` | Replaces the remarks. |
| `example: *content` | Adds an **Examples** section. |
| none | Appends the content after the existing documentation. |

Other keys in the header become page metadata for that uid. Select overwrite files with `build.overwrite`, using the same mapping shape as content. This site amends <xref:PuduLangDocgen.Docset.build> this way.

## Templates

A template decides how pages look. The built-in `default` template renders every page; template folders listed after it replace its layout or partials and add `public/main.css` and `public/main.js`. See [Templates and theming](templates.md).

## Output

The build writes the site to `build.output`, `_site` by default. Output is validated as a whole before anything is written: every output path must be portable, two outputs may not share a path, and a file may not take the path of a folder.

Publishing is incremental. The `.docgen/build.json` state file records what the previous build wrote, so unchanged files are left alone and stale files are removed. Pass `--force` to rewrite every file.

> [!IMPORTANT]
> Keep `_site/` and `.docgen/` out of version control. The `init` command writes a `.gitignore` that does this.
