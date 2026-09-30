---
uid: guides.commands.help
description: Print the usage summary of every command and option.
---

# help

Prints the usage summary: every command with a one-line description and every option. `-h` and `--help` do the same after any command.

```text
docgen help
docgen <command> --help
```

The command exits with status `0`. An invalid command line prints the reason followed by the same summary and exits with status `2`.

## Example

```bash
pudu run examples/Cli.pudu help
```

```text
Usage: docgen [command] [path] [options]

Commands:
  [config]  Build the site, API reference included (the default)
  build [config]  The same as the default
  metadata [config]  Write API metadata files for the configured sources
  serve [folder]  Preview a built site over HTTP
  ...
```
