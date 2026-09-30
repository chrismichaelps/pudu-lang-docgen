---
uid: extensions.overview
description: Templates, packages, and tools that extend or drive pudu-lang-docgen, and how catalog pages are written.
---

# Extensions

pudu-lang-docgen is extended in three ways: templates change how pages look, packages let Pudu programs drive and extend builds, and tools run common tasks from the command line. The catalogs below list each of them.

:::row:::
:::column:::
### Templates

The built-in look and the template extensions that split HTTP API reference pages.

[Browse templates](templates.yml)
:::column-end:::
:::column:::
### Packages

pudu-lang-docgen and the packages it is built on.

[Browse packages](packages.yml)
:::column-end:::
:::column:::
### Tools

The command line, the build program, and the commands for previews, PDFs, and cross-reference maps.

[Browse tools](tools.yml)
:::column-end:::
:::row-end:::

## Writing a catalog

The catalog pages on this site are YAML content files whose first line contains `YamlMime:Dashboard`. Each is rendered as a list of entries with their usage lines.

```yaml
### YamlMime:Dashboard
title: Templates
description: Templates decide how every page looks.
defaults:
  type: Template
  license: Apache-2.0
items:
- name: default
  description: The standard look, with light and dark themes.
  homepage: ../guides/templates.md
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
| `defaults` | no | Fields every item inherits unless it sets its own, such as `type`, `author`, or `license`. |
| `items` | yes | One entry per item, in order. |
| `items[].name` | yes | The entry title, linked to `homepage` when it is set. Each entry also gets a fragment from its name. |
| `items[].description` | no | The entry text, in Markdown. |
| `items[].type` | no | A small label above the name. |
| `items[].author`, `version`, `license` | no | A line of facts under the name. |
| `items[].thumbnail` | no | A small square image beside the name. |
| `items[].homepage` | no | The link on the entry title. |
| `items[].repository.url` | no | A **Source** link. |
| `items[].usage` | no | `install`, `init`, `command`, and `config` lines shown as code, labeled Install, Set up, Run, and Configure. |

Local addresses in `homepage`, `thumbnail`, and `repository.url` are source paths, such as `../guides/templates.md`, resolved and checked like links in articles.

List catalogs in `content` like any other YAML file, and link them from a table of contents by their source name.
