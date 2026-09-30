<p align="center">
  <img src="public/pudu-lang-short.png" alt="Pudu" width="120">
</p>

<p align="center">
  <a href="https://www.pudu-lang.org/">Pudu</a> |
  <a href="https://www.pudu-lang-docgen.com/">Documentation</a> |
  <a href="wiki/00-INDEX.md">Design vault</a> |
  <a href="https://www.pudu-lang-docgen.com/api/PuduLangDocgen.html">API docs</a> |
  <a href="CONTRIBUTING.md">Contributing</a>
</p>

# pudu-lang-docgen

Documentation publishing for Pudu, written in Pudu. Write articles in Markdown, document the
public declarations of your Pudu modules and your OpenAPI descriptions, and publish one static
website with navigation, cross references, search, and printable PDF documents.

The package is named `@chrismichaelps/pudu-lang-docgen`. Its modules live under `PuduLangDocgen`.
[www.pudu-lang-docgen.com](https://www.pudu-lang-docgen.com/) is built with it.

## Example

A two-line program runs the command line:

```pudu
module Docgen

import Std.Env as Env
import PuduLangDocgen.Command as Command

fn main() -> Int { Command.run(&Env.all()) }
```

```sh
pudu run Docgen.pudu init docs --yes
pudu run Docgen.pudu build docs --serve
```

`init` writes a configuration, a landing page, starter articles, and tables of contents. `build`
validates the whole site before writing anything, publishes it to `docs/_site`, and `--serve`
previews it at `http://localhost:8080`. The same work is available to Pudu programs through
`Docset.build`, which takes page and output extensions.

## What it includes

| Area | Modules |
| --- | --- |
| Projects and the command line | `Docset`, `Command`, `Configuration`, `Serve`, `Scaffold` |
| Articles | `Markdown`, `Inline`, `Markdown.*` |
| Reference pages | `Api.*` for Pudu modules, `Rest.*` for OpenAPI 3 and Swagger 2 |
| Navigation and cross references | `Navigation`, `Navigation.Resolve`, `References` |
| Site output | `Build`, `Site.*`, `Theme`, `Template` |

Articles support tables, task lists, footnotes, alerts, tabs, layouts, includes, code excerpts,
static highlighting, math, and diagrams. Sites get a responsive theme with light and dark modes,
search, a sitemap and `robots.txt`, SEO and social tags, landing and catalog pages, and PDF
documents per table of contents. Builds are incremental, and every diagnostic has a stable code
that configuration rules can raise, lower, or silence.

The [source mirrors](wiki/src/_MOC.md) record each module's behavior and design decisions.

## Installing

Add the package to a Pudu project:

```sh
pudu install @chrismichaelps/pudu-lang-docgen
```

The [quick start](https://www.pudu-lang-docgen.com/guides/quick-start.html) walks through a first
site.

### Build from source

Install [Pudu 0.1.2](https://www.pudu-lang.org/download), then:

```sh
git clone https://github.com/chrismichaelps/pudu-lang-docgen
cd pudu-lang-docgen
pudu install --locked
pudu test test
pudu run examples/Cli.pudu build examples/site
```

## Developing

```sh
pudu check $(find src test tools examples -name '*.pudu')
pudu fmt --check src test tools examples
pudu lint src test tools examples
pudu test test
```

The [wiki vault](wiki/00-INDEX.md) has a design page for each package module.

## License

[Apache License 2.0](LICENSE).
