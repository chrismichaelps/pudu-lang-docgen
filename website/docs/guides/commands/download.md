---
uid: guides.commands.download
description: Save another site's cross-reference map to a local file.
---

# download

Fetches a cross-reference map from a web address and saves it as a file, so that builds can use it without network access.

```text
docgen download <file> --xref <address>
```

| Argument or option | Description |
| --- | --- |
| `file` | The file to write. A `.json` name writes JSON; any other name writes YAML. |
| `-x`, `--xref <address>` | The address of the map to fetch. Required. |

Relative addresses in the map are made absolute against the map's `baseUrl`, or against the address it was fetched from, so the saved file works from any project. The command prints `saved <n> references to <file>`.

It fails with `DG904` when the map cannot be fetched or read, and exits with status `2` when the file or `--xref` is missing.

## Example

```bash
pudu run Docgen.pudu download maps/docgen.yml --xref https://pudu-lang-docgen.vercel.app/xrefmap.yml
```

Then list the file in the configuration:

```json
"xref": ["maps/docgen.yml"]
```
