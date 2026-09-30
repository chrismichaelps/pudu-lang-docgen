# pudu-lang-docgen website

The documentation website of pudu-lang-docgen, built with pudu-lang-docgen. It is published at
<https://pudu-lang-docgen.vercel.app>.

| Path | Contents |
| --- | --- |
| `docgen.json` | The project configuration. The API reference is generated from `../src`. |
| `docs/` | Articles, tables of contents, catalog pages, and the sample OpenAPI description. |
| `docs/guides/includes/`, `docs/guides/samples/` | Files that articles include or excerpt; they are not published as pages. |
| `overwrite/` | Overwrite sections that amend generated API pages. |
| `filterConfig.yml` | API filter rules for the generated reference. |
| `images/` | Resources copied to the site. |
| `template/public/main.css` | Styles loaded after the default template. |
| `vercel.json`, `vercel-build.sh` | Deployment configuration and build step. |

## Build

From the repository root, with Pudu 0.1.2 or a later 0.1 release installed:

```bash
pudu install
pudu run examples/Cli.pudu build website
```

The site is written to `website/_site`. The build must finish with no warnings; add
`--warningsAsErrors` to enforce it.

## Preview

```bash
pudu run examples/Cli.pudu serve website/_site --port 8130
```

Then open <http://localhost:8130>. To rebuild while editing, use
`pudu run examples/Cli.pudu build website --serve --watch --port 8130` instead.

## Deploy

The site is deployed to Vercel from this folder.

```bash
pudu run examples/Cli.pudu build website
cd website
vercel deploy --prod
```

`vercel-build.sh` publishes the prebuilt `_site` when only this folder is uploaded. In a Git
deployment whose root directory is `website`, it installs Pudu 0.1.2 after verifying the release
checksum, runs `pudu install` at the repository root, and builds the site on the build host.

`vercel.json` sets security headers, including a Content-Security-Policy that allows the site's
own scripts, the inline color-theme script by its hash, and `cdn.jsdelivr.net` for diagrams and
math. If the default template's inline script changes, update its `sha256-` hash in the policy.
Vercel serves `404.html` for addresses the site does not have.

Any other static host works the same way: publish the contents of `_site` and serve `404.html`
for missing addresses.
