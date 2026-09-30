---
uid: guides.templates
description: Control the look of a site with page metadata, template folders, partial overrides, styles, scripts, and alert titles.
---

# Templates and theming

Every page is rendered through a template: a layout with partials for the header, sidebar, footer, and other regions. The built-in `default` template provides a responsive layout with light, dark, and automatic color themes, a searchable header, a filterable sidebar, an outline of the current article, and print styles. Most sites need only metadata and a stylesheet to make it their own.

## Page metadata

Set these keys in `build.globalMetadata` for the whole site, in `fileMetadata` for groups of files, or in an article's front matter for one page.

### Site identity

| Key | Description |
| --- | --- |
| `_appTitle` | Added to every browser tab title after a vertical bar. |
| `_appName` | The name next to the logo. Defaults to `_appTitle`. |
| `_appLogoPath` | The logo image in the header. |
| `_appLogoUrl` | Where the logo links. Defaults to the site's home page. |
| `_appFaviconPath` | The browser tab icon. |
| `_appTouchIconPath` | The icon used when the site is added to a home screen. |
| `_appFooter` | HTML for the footer. Only safe elements and attributes are kept. When set, it replaces the footer below. |
| `_footerLinks` | Footer links as a list of objects with `name` and `href`. Unsafe or incomplete entries are left out. |
| `_copyright` | The copyright holder shown in the footer as `© <year> <holder>`, dated by the year of the build. |
| `_themeColor` | The browser interface color on supporting devices. |
| `_lang` | The page language, such as `en`. It also selects the interface text language. |

### Layout and parts

| Key | Description |
| --- | --- |
| `_layout` | `default`, `landing` (no sidebar, outline, breadcrumb, or pager; full-width content), or `chromeless` (no header or footer). |
| `_disableToc` | Hide the sidebar. |
| `_disableAffix` | Hide the **In this article** outline. |
| `_disableBreadcrumb` | Hide the breadcrumb trail. |
| `_disableNavbar` | Hide the top navigation. |
| `_disableFooter` | Hide the page footer. |
| `_disableTocFilter` | Hide the sidebar filter box. |
| `_disableNextArticle` | Hide the previous and next links. |
| `_disableContribution` | Hide the **Edit this page** link. |
| `_enableSearch` | `false` hides the search box and skips the search index. |
| `_enableNewTab` | Open external links in a new tab. |
| `_appStyle`, `_appScript` | Another stylesheet or script for every page. |
| `_mathScript`, `_mermaidScript` | Replace the script loaded on pages with math or diagrams. |
| `_text` | Replacement interface text, such as `{ "edit": "Suggest a change" }`. |

### Search engines and sharing

| Key | Description |
| --- | --- |
| `description` | The page summary for search results and link previews. |
| `keywords` | Text or a list of keywords. |
| `author` | The page author. |
| `_baseUrl` | The site's public address. Enables canonical links, absolute preview images, and structured breadcrumb data. |
| `_appOgImagePath`, `image` | The preview image for shared links; `image` sets it for one page. |
| `_twitterSite` | The account named in link previews. |
| `_noindex` | Ask search engines not to index the page, and leave it out of the search index and sitemap. |
| `_meta` | Extra `<meta>` tags as name and content pairs. |
| `_googleAnalyticsTagId` | Adds the analytics tag for that identifier. |

This site's identity is set entirely through `globalMetadata`:

```json
"globalMetadata": {
  "_appTitle": "Pudu Docgen",
  "_appName": "Pudu Docgen",
  "_appLogoPath": "images/pudu-lang-short.png",
  "_appFaviconPath": "images/pudu-lang-short.png",
  "_baseUrl": "https://www.pudu-lang-docgen.com",
  "_enableSearch": true,
  "_lang": "en"
}
```

## Landing pages

A YAML file whose first line contains `YamlMime:Landing` becomes a hub page on the `landing` layout: a banner across the full width of the page, then highlighted entry points, topic lists, and related links. Addresses are checked like links in articles, so a missing page is reported.

```yaml
### YamlMime:Landing
title: Inventory service documentation
summary: Everything needed to run and extend the inventory service.
metadata:
  uid: home
  description: Guides and reference for the inventory service.

highlightedContent:
  items:
  - title: What is the inventory service?
    itemType: overview
    url: guide/introduction.md
  - title: Release notes
    itemType: whats-new
    url: https://example.org/releases

conceptualContent:
  title: Explore
  items:
  - title: Operate
    links:
    - text: Deploying
      url: guide/deploy.md
    footerLink:
      text: All operations guides
      url: guide/index.md

additionalContent:
  sections:
  - title: Related content
    items:
    - title: Pudu
      summary: The language the service is written in.
      url: https://www.pudu-lang.org/
```

| Key | Description |
| --- | --- |
| `title` | The banner heading and the page title. Required. |
| `summary` | The text under the banner heading. |
| `metadata` | Page metadata, like an article's front matter. |
| `highlightedContent.items` | Entry points with a `title`, a `url`, and an `itemType` of `overview`, `get-started`, `quickstart`, `concept`, `tutorial`, `how-to-guide`, `reference`, `whats-new`, `download`, `deploy`, `architecture`, or `sample`. |
| `conceptualContent` | An optional `title` and `items`, each a topic with a `title`, a list of `links` with `text` and `url`, and an optional `footerLink`. |
| `additionalContent.sections` | Sections with a `title` and `items`, each with a `title`, a `summary`, and a `url`. |

The banner colors come from the `--hero-bg` custom property, which a template's `public/main.css` can set.

## Template folders

`build.template` lists templates in order. The first is usually `default`; the others are folders in the project. A later folder replaces files of an earlier one.

```json
"template": ["default", "template"]
```

A template folder may contain:

| File | Effect |
| --- | --- |
| `layout.html` | Replaces the page layout. |
| `partials/<name>.html` | Replaces or adds a partial. |
| `public/main.css` | Loaded on every page after the default styles. |
| `public/main.js` | Loaded on every page after the default script. |
| `public/**` | Any other file, published under `public/`. |
| `token.json` | Replacement alert titles. |

The built-in partials are `head`, `header`, `sidebar`, `breadcrumb`, `actions`, `affix`, `pager`, `footer`, and `scripts`. Export them with the [template](commands/template.md) command to start from the originals:

```bash
pudu run Docgen.pudu template export template
```

## Styles and scripts

The default styles are written with CSS custom properties, so a small `public/main.css` can restyle the whole site. This site's stylesheet lays out the footer columns and the landing page using the theme's own colors:

```css
.footer-grid {
  display: grid;
  grid-template-columns: minmax(220px, 1.4fr) repeat(3, minmax(160px, 1fr));
  gap: 32px;
}

.content a.button-primary {
  border-color: var(--accent);
  background: var(--accent);
  color: #fff;
}
```

| Property | Used for |
| --- | --- |
| `--accent`, `--accent-hover`, `--accent-soft` | Links, active navigation, buttons. |
| `--bg`, `--bg-subtle`, `--bg-muted`, `--bg-hover` | Page, panel, and hover backgrounds. |
| `--text`, `--text-muted`, `--text-subtle` | Body, secondary, and tertiary text. |
| `--border`, `--border-strong` | Rules and outlines. |
| `--font`, `--font-mono` | Text and code fonts. |
| `--content-width`, `--sidebar-width`, `--affix-width` | Column widths. |

Light values are set on `:root`. Dark values are set on `:root[data-theme="dark"]` and, for the automatic theme, on `:root[data-theme="auto"]` inside a `prefers-color-scheme: dark` media query; override both to change the dark theme.

## Alert titles

`token.json` renames alert titles. Keys are alert kinds in lower case:

```json
{ "note": "Remarque", "warning": "Avertissement" }
```

## Layout syntax

Layouts and partials use a logic-less template syntax:

| Tag | Meaning |
| --- | --- |
| `{{name}}` | The value, HTML-escaped. |
| `{{{name}}}` or `{{& name}}` | The value without escaping. |
| `{{#name}}...{{/name}}` | Repeat for each item of a list, or show when the value is present and true. |
| `{{^name}}...{{/name}}` | Show when the value is missing, false, or empty. |
| `{{>name}}` | Include a partial. |
| `{{! comment}}` | Ignored. |

A layout that does not parse stops the build with `DG401`. Export the view of each page with `--exportViewModel` to see every value a layout can use, including `title`, `body`, `toc`, `navbar`, `breadcrumb`, `headings`, `previous`, `next`, `editUrl`, `lastModified`, and `text`.

## Interface language

`_lang` selects the interface text of the default template. English, Spanish, French, German, Portuguese, Italian, Japanese, Chinese, and Korean are built in; other languages use English. Replace individual strings with `_text`:

| Key | English text |
| --- | --- |
| `skip` | Skip to main content |
| `search` | Search |
| `filter` | Filter by title |
| `updated` | Last updated on |
| `edit` | Edit this page |
| `previous`, `next` | Previous, Next |
| `inThisArticle` | In this article |
| `pdf` | Download PDF |
