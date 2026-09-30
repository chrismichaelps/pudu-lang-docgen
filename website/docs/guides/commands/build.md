---
uid: guides.commands.build
description: Build a documentation project into a static site.
---

# build

Builds the site, API reference included, and publishes it to the output folder. `build` is the default command, so `docgen website` and `docgen build website` are the same.

```text
docgen [build] [config] [options]
```

| Argument | Description |
| --- | --- |
| `config` | A project folder, or the path of a `.json`, `.yml`, or `.yaml` configuration. Defaults to `docgen.json` in the current folder. |

## Options

| Option | Description |
| --- | --- |
| `-o`, `--output <folder>` | Write the site to this folder instead of the configured `output`. |
| `-m`, `--metadata <key=value>` | Set global metadata. `true` and `false` become flags; anything else is text. Repeat for more keys. |
| `-x`, `--xref <map>` | Add a cross-reference map by path or address. Repeatable. |
| `-t`, `--template <folder>` | Add a template folder after the configured ones. Repeatable. |
| `--force` | Rewrite every output file, not only changed ones. |
| `--dryRun` | Validate and plan the site without writing anything. |
| `--warningsAsErrors` | Fail the build on any warning. |
| `--disableGitFeatures` | Skip last-modified dates and edit links from git. |
| `--exportRawModel` | Write each page's data model beside it as `.raw.json`. |
| `--exportViewModel` | Write each page's template view beside it as `.view.json`. |
| `-s`, `--serve` | Serve the output folder after a successful build. |
| `-w`, `--watch` | With `--serve`, rebuild whenever a project file changes. |
| `-n`, `--hostname <host>` | With `--serve`, the host to listen on. Defaults to `localhost`. |
| `-p`, `--port <number>` | With `--serve`, the port to listen on. Defaults to `8080`. |

## Examples

Build this site from the repository root:

```bash
pudu run examples/Cli.pudu build website
```

Check a project in continuous integration without writing output:

```bash
pudu run Docgen.pudu build docs --dryRun --warningsAsErrors
```

Build a preview with a banner title and serve it while editing:

```bash
pudu run Docgen.pudu build docs -m _appTitle="Docs preview" --serve --watch --port 8130
```

## Output

A successful build prints its warnings, then a summary:

```text
Build succeeded: 168 written, 0 unchanged, 0 removed.
```

When the build fails, every diagnostic is printed with a final count, the exit status is `1`, and nothing is written. While watching, each rebuild prints `Rebuilt: <n> written, <n> removed.`
