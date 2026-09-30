---
uid: guides.deploying
description: Publish a built site to Vercel, GitHub Pages, or any static web host.
---

# Deploying

The output folder is a self-contained static site. Publishing it means copying the folder to a web host and, ideally, telling the host to serve `404.html` for addresses the site does not have.

Before publishing, set the site's public address so that canonical links, link previews, the sitemap, and the cross-reference map use it:

```json
"globalMetadata": { "_baseUrl": "https://docs.example.com" },
"sitemap": { "baseUrl": "https://docs.example.com" }
```

Every build host needs Pudu. Install the release you develop with and verify its checksum:

```bash
version=0.1.2
archive="pudu-${version}-linux-amd64.tar.gz"
base="https://github.com/chrismichaelps/pudu-lang/releases/download/v${version}"
curl -fsSLO "$base/$archive"
curl -fsSLO "$base/$archive.sha256"
sha256sum -c "$archive.sha256"
tar -xzf "$archive"
export PATH="$PWD/pudu-${version}-linux-amd64/bin:$PATH"
```

# [Vercel](#tab/vercel)

This site is deployed to Vercel from its `website` folder. Its `vercel.json` runs a build script, publishes `_site`, and sets security and caching headers:

```json
{
  "buildCommand": "bash vercel-build.sh",
  "outputDirectory": "_site",
  "cleanUrls": false
}
```

When the whole repository is available, as in a Git deployment with the project's root directory set to `website`, the script installs Pudu as shown above, runs `pudu install` at the repository root for the package's dependencies, and builds the site. When only the `website` folder is uploaded, it publishes the site already built in `_site`:

```bash
pudu run examples/Cli.pudu build website
cd website
vercel deploy --prod
```

Vercel serves `404.html` from the output folder for any address the site does not have.

# [GitHub Pages](#tab/github-pages)

Build in a workflow and publish the output folder as a Pages artifact:

```yaml
name: docs
on:
  push:
    branches: [main]
permissions:
  contents: read
  pages: write
  id-token: write
jobs:
  deploy:
    runs-on: ubuntu-24.04
    environment: github-pages
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Install Pudu
        run: |
          set -euo pipefail
          archive="pudu-0.1.2-linux-amd64.tar.gz"
          base="https://github.com/chrismichaelps/pudu-lang/releases/download/v0.1.2"
          curl -fsSLO "$base/$archive"
          curl -fsSLO "$base/$archive.sha256"
          sha256sum -c "$archive.sha256"
          tar -xzf "$archive"
          echo "$PWD/pudu-0.1.2-linux-amd64/bin" >> "$GITHUB_PATH"
      - run: pudu install
      - run: pudu run Docgen.pudu build docs
      - uses: actions/upload-pages-artifact@v3
        with:
          path: docs/_site
      - uses: actions/deploy-pages@v4
```

`fetch-depth: 0` gives the build the full git history, so every page shows its real last-modified date. GitHub Pages serves `404.html` automatically.

# [Any static host](#tab/static)

Copy the output folder to the host's web root:

```bash
pudu run Docgen.pudu build docs
rsync -av --delete docs/_site/ user@host:/var/www/docs/
```

Configure the server to answer missing addresses with `404.html`. For example, in an nginx `server` block:

```nginx
error_page 404 /404.html;
```

Serve `.json`, `.xml`, and `.yml` files as text so that search, the sitemap, and the cross-reference map can be read.

***

## Checklist

- The build runs with no warnings. Consider `--warningsAsErrors` in continuous integration.
- `_baseUrl` and `sitemap.baseUrl` name the public address.
- The build host clones the repository with history if last-modified dates matter.
- `gitContribute` names the repository and branch, so **Edit this page** links point at the right files.
- The host serves `404.html` for missing addresses.
