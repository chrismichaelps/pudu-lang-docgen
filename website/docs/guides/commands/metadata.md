---
uid: guides.commands.metadata
description: Write API metadata files for the configured Pudu sources without building the site.
---

# metadata

Reads the Pudu sources named by the configuration's `metadata` section and writes their model as files, without building the site.

```text
docgen metadata [config] [options]
```

Each source is written in its `outputFormat` (`json`, `markdown`, or `apiPage`) under its `dest` folder, together with a `toc.yml`. The command prints `wrote <path>` for every file.

| Option | Description |
| --- | --- |
| `-o`, `--output <folder>` | Write every source's files to this folder instead of each `dest`. |

## Example

```bash
pudu run Docgen.pudu metadata docs --output docs/reference
```

With `"outputFormat": "apiPage"`, the written files can be listed as content in another project, which renders them as reference pages. See [Pudu API reference](../api-reference.md#metadata-files).
