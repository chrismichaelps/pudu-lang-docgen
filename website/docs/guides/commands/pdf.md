---
uid: guides.commands.pdf
description: Build the site and print a PDF for every table of contents that enables one.
---

# pdf

Builds and publishes the site, then prints a PDF for every table of contents whose metadata sets `pdf: true`.

```text
docgen pdf [config] [options]
```

It accepts the same project path and build options as [build](build.md). For each document it prints `wrote <path>`, relative to the output folder.

The command fails with `DG905` when no table of contents sets `pdf`, when no renderer is found, or when the renderer fails or runs past its time limit. See [PDF output](../pdf.md) to configure documents and the renderer.

## Example

```bash
pudu run Docgen.pudu pdf docs
```
