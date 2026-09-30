---
uid: guides.commands.serve
description: Preview a built site over HTTP.
---

# serve

Serves a built site folder over HTTP until interrupted.

```text
docgen serve [folder] [options]
```

| Argument | Description |
| --- | --- |
| `folder` | The site folder to serve. Defaults to `_site`. |

| Option | Description |
| --- | --- |
| `-n`, `--hostname <host>` | The host to listen on. Defaults to `localhost`. |
| `-p`, `--port <number>` | The port to listen on. Defaults to `8080`. |

A request for a folder serves its `index.html`. Addresses the site does not have receive the site's `404.html`. Requests whose decoded path would leave the folder are refused.

## Example

```bash
pudu run examples/Cli.pudu serve website/_site --port 8130
```

To rebuild while editing, use [build](build.md) with `--serve --watch` instead: `serve` only serves files that already exist.
