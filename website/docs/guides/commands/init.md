---
uid: guides.commands.init
description: Create a new documentation project with a configuration, starter pages, and navigation.
---

# init

Creates a documentation project in a folder.

```text
docgen init [folder] [options]
```

| Argument | Description |
| --- | --- |
| `folder` | Where to create the project. Defaults to the current folder. |

| Option | Description |
| --- | --- |
| `-y`, `--yes` | Accept every default instead of asking. |

Without `--yes`, the command asks four questions. Press Enter to accept the default shown in brackets.

| Question | Default | Effect |
| --- | --- | --- |
| Site title | The folder name | `_appTitle` and `_appName`, and the landing page heading. |
| Document Pudu sources | yes | Adds a `metadata` source and an **API** navigation item. |
| Source folder | `src` | The folder the API reference is generated from. |
| Enable PDF | no | Sets `pdf` in global metadata. |

The command prints `created <path>` for every file it writes, then the command that builds and serves the new project. See the [quick start](../quick-start.md#create-a-documentation-project) for the files it creates.

A folder that already holds a `docgen.json` is refused with `DG501`.

## Example

```bash
pudu run Docgen.pudu init docs --yes
pudu run Docgen.pudu build docs --serve
```
