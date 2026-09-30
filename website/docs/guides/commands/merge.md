---
uid: guides.commands.merge
description: Combine several cross-reference maps into one file.
---

# merge

Reads several cross-reference maps, from files or web addresses, and writes one map containing every identity.

```text
docgen merge <maps...> --output <file>
```

| Argument or option | Description |
| --- | --- |
| `maps` | Paths or addresses of the maps to combine. |
| `-o`, `--output <file>` | The file to write. A `.json` name writes JSON; any other name writes YAML. Required. |

When several maps declare the same uid, the first map listed wins. The result is sorted by uid. The command prints `merged <n> references into <file>`.

It fails with `DG904` when a map cannot be read, and exits with status `2` when no map or no `--output` is given.

## Example

```bash
pudu run Docgen.pudu merge maps/docgen.yml maps/partner.json --output maps/all.yml
```
