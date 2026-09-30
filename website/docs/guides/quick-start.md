---
uid: guides.quick-start
description: Install pudu-lang-docgen, create a documentation project, build it, and preview the result.
---

# Quick start

This walkthrough installs the package, creates a documentation project, builds it, and previews the site in a browser. It takes a few minutes.

## Prerequisites

- Pudu 0.1.2 or a later 0.1 release. Run `pudu version` to check.
- A Pudu project with a `pudu.toml` file. Create one with `pudu init` if you do not have one yet.

## Install the package

# [Command line](#tab/cli)

Install the package into the current project. The command records the dependency in `pudu.toml`, writes `pudu.lock`, and places the sources under `deps/`.

```bash
pudu install @chrismichaelps/pudu-lang-docgen
```

# [pudu.toml](#tab/toml)

Declare the dependency yourself, then run `pudu install` to fetch it.

```toml
[dependencies]
"@chrismichaelps/pudu-lang-docgen" = "0.1.0"
```

---

[!INCLUDE[Package modules](includes/package-modules.md)]

## Add the command-line program

The package exposes its command line as <xref:PuduLangDocgen.Command.run>. Add a program that passes the process arguments to it:

```pudu
/** @Docs.Cli.Program — the docgen command line for this project */
module Docgen

import Std.Env as Env
import PuduLangDocgen.Command as Command

/// Runs docgen with the program's arguments and answers its exit status.
fn main() -> Int { Command.run(&Env.all()) }
```

Save it as `Docgen.pudu`. Every command in this documentation is written as `pudu run Docgen.pudu <command>`.

## Create a documentation project

```bash
pudu run Docgen.pudu init docs
```

The command asks for a site title, whether to document Pudu sources and where they are, and whether to produce a PDF. Pass `--yes` to accept every default. It writes:

| File | Purpose |
| --- | --- |
| `docs/docgen.json` | The project configuration. |
| `docs/index.md` | A landing page using the `landing` layout. |
| `docs/toc.yml` | The top navigation: Home, Guide, and API. |
| `docs/docs/introduction.md`, `docs/docs/getting-started.md` | Two starter articles. |
| `docs/docs/toc.yml` | The sidebar of the guide section. |
| `docs/src/Example.pudu` | A sample module for the API section, when sources default to `src`. |
| `docs/.gitignore` | Keeps `_site/` and `.docgen/` out of version control. |

> [!NOTE]
> `init` refuses a folder that already holds a `docgen.json` and reports `DG501`. Other files that already exist in the folder are kept as they are.

## Build the site

```bash
pudu run Docgen.pudu build docs
```

A successful build prints a summary such as `Build succeeded: 24 written, 0 unchanged, 0 removed.` and writes the site to `docs/_site`. Warnings are printed before the summary; errors stop the build and nothing is written.

## Preview the site

```bash
pudu run Docgen.pudu build docs --serve
```

`--serve` builds and then serves the output folder at `http://localhost:8080`. Add `--watch` to rebuild whenever a project file changes, and `--port` to choose another port:

```bash
pudu run Docgen.pudu build docs --serve --watch --port 8130
```

To serve a folder that is already built, use the [serve](commands/serve.md) command.

## Next steps

- Learn how projects are organized in [Basic concepts](concepts.md).
- Write richer pages with the [Markdown authoring](markdown.md) guide.
- Document your modules with [Pudu API reference](api-reference.md).
- Publish the site with [Deploying](deploying.md).
