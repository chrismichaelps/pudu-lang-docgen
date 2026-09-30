---
uid: guides.commands
description: The docgen command line - commands, arguments, options, and exit statuses.
---

# Command-line reference

The command line is the function <xref:PuduLangDocgen.Command.run>. Run it through a program that passes the process arguments, as described in the [quick start](../quick-start.md#add-the-command-line-program). This repository ships one as `examples/Cli.pudu`:

```bash
pudu run examples/Cli.pudu build website
```

The general form is:

```text
docgen [command] [path] [options]
```

| Command | Description |
| --- | --- |
| [build](build.md) | Build the site, API reference included. The default when no command is given. |
| [metadata](metadata.md) | Write API metadata files for the configured sources. |
| [serve](serve.md) | Preview a built site over HTTP. |
| [init](init.md) | Create a new documentation project. |
| [pdf](pdf.md) | Build the site and a PDF for every table of contents that sets `pdf`. |
| [template](template.md) | List the built-in templates or export the default one for customizing. |
| [download](download.md) | Save a cross-reference map from the web. |
| [merge](merge.md) | Combine cross-reference maps into one. |
| [version](version.md) | Print the package version. |
| [help](help.md) | Print the usage summary. |

## Paths

Commands that read a project take the path of its configuration: a folder containing `docgen.json`, or a `.json`, `.yml`, or `.yaml` file. Without a path, `docgen.json` in the current folder is used.

## Exit statuses

| Status | Meaning |
| --- | --- |
| `0` | The command succeeded. Warnings may have been printed. |
| `1` | The work failed: the build found errors, a file could not be written, or a tool failed. |
| `2` | The command line was invalid: an unknown option, a missing option value, or too many paths. |

Diagnostics are printed to standard error as `path:line: severity CODE: message`, followed by a count of errors and warnings. See the [diagnostics reference](../diagnostics.md).
