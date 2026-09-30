---
uid: extensions.overview
description: Templates, modules, and tools that extend or drive pudu-lang-docgen, and how catalog pages are written.
---

# Extensions

pudu-lang-docgen is extended in three ways: templates change how pages look, the package's modules let Pudu programs drive and extend builds, and tools run common tasks from the command line. The catalogs below list what ships with the package.

:::row:::
:::column:::
### Templates

The built-in look and the template extensions that split HTTP API reference pages.

[Browse templates](templates.yml)
:::column-end:::
:::column:::
### Packages

The package and the modules that serve as its entry points.

[Browse packages](packages.yml)
:::column-end:::
:::column:::
### Tools

The command line, the build program, and the commands for previews, PDFs, and cross-reference maps.

[Browse tools](tools.yml)
:::column-end:::
:::row-end:::

## Writing a catalog

The catalog pages on this site are YAML content files whose first line contains `YamlMime:Dashboard`. Each is rendered as a page of cards.

```yaml
### YamlMime:Dashboard
title: Templates
description: Templates decide how every page looks.
items:
- name: default
  description: The standard look, with light and dark themes.
  type: Template
  author: Chris Michael
  version: 0.1.0
  license: Apache-2.0
  thumbnail: ../images/pudu-lang-short.png
  homepage: ../guides/templates.html
  repository:
    url: https://github.com/chrismichaelps/pudu-lang-docgen
  usage:
    config: '"template": ["default"]'
    command: docgen template export template
```

| Field | Required | Shown as |
| --- | --- | --- |
| `title` | yes | The page heading. |
| `description` | no | An introduction in Markdown. |
| `items` | yes | One card per item. |
| `items[].name` | yes | The card title, linked to `homepage` when it is set. Each card also gets a fragment from its name. |
| `items[].description` | no | The card text, in Markdown. |
| `items[].type` | no | A badge. |
| `items[].author`, `version`, `license` | no | A line of facts. |
| `items[].thumbnail` | no | The card image, as an address relative to the published page. |
| `items[].homepage` | no | The link on the card title, relative to the published page. |
| `items[].repository.url` | no | A **Source** link. |
| `items[].usage` | no | `install`, `init`, `command`, and `config` lines shown as code. |

List catalogs in `content` like any other YAML file, and link them from a table of contents by their source name.
