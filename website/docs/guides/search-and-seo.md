---
uid: guides.search-and-seo
description: Built-in client-side search, sitemaps, canonical links, link previews, and structured data.
---

# Search and SEO

## Site search

Every build writes `index.json`, a search index of every page's address, title, summary, and visible text. The search box in the header loads the index on first use and ranks results in the browser, so search works on any static host without a server.

- Press `/` to move to the search box, the arrow keys to choose a result, and Enter to open it.
- Code copy buttons, scripts, and styles are not indexed. Each page contributes at most 8,000 characters of text.
- Pages with `_noindex: true` and redirect pages are left out.

Turn search off for the whole site with `"_enableSearch": false` in `globalMetadata`; the search box is hidden and no index is written.

## Sitemap

Add a `sitemap` section to publish `sitemap.xml`:

```json
"sitemap": {
  "baseUrl": "https://www.pudu-lang-docgen.com",
  "changefreq": "weekly",
  "priority": "0.5",
  "fileOptions": {
    "index.html": { "priority": "1.0" },
    "guides/**": { "priority": "0.8" }
  }
}
```

Each indexable page is listed under `baseUrl` with its last-modified date from git history, or the build date when history is unavailable. `fileOptions` globs match a page's source path or its published path.

With a sitemap configured, the build also publishes `robots.txt`, which allows every page and names the sitemap so crawlers find it:

```text
User-agent: *
Allow: /

Sitemap: https://www.pudu-lang-docgen.com/sitemap.xml
```

To publish different rules, list your own `robots.txt` as a resource; the build then leaves it as written.

## Page metadata for search engines

Set `_baseUrl` to the site's public address. With it, every page gets:

- a canonical link (`<link rel="canonical">`);
- Open Graph and Twitter card tags with an absolute preview image from `_appOgImagePath` or the page's `image`;
- structured breadcrumb data (JSON-LD) built from the page's navigation trail.

Every page also carries `description` (from metadata or the first paragraph), `keywords`, `author`, the `og:locale` from `_lang`, and any extra tags from `_meta`:

```yaml
_meta:
  application-name: Pudu Docgen
  google-site-verification: your-verification-token
```

## Not-found page

Unless the content provides its own `404.html`, the build writes one with a link back to the home page. It is marked `_noindex`. Configure the host to serve it for missing addresses; see [Deploying](deploying.md).

## Redirects

When a page moves, keep its old path as a small Markdown file with `redirect_url`:

```yaml
title: Moved
redirect_url: new-location.html
```

The build publishes a page that forwards the browser to the new address and leaves it out of search and the sitemap.
