---
uid: guides.pdf
description: Produce printable PDF documents from tables of contents, with a cover page, a contents page, and page headers and footers.
---

# PDF output

The [pdf](commands/pdf.md) command builds the site and then prints a PDF for every table of contents that asks for one. Each PDF holds the pages its table lists, in reading order, with links between them kept inside the document.

## Enable a PDF

Write the table of contents as an object and set `pdf: true`:

```yaml
pdf: true
pdfFileName: user-guide.pdf
pdfTocPage: true
pdfCoverPage: cover.html
items:
- name: Introduction
  href: introduction.md
- name: Quick start
  href: quick-start.md
```

| Key | Default | Description |
| --- | --- | --- |
| `pdf` | `false` | Produce a PDF for this table of contents. |
| `pdfFileName` | `toc.pdf` | The file name, written beside the published table. |
| `pdfTocPage` | `false` | Add a contents page listing every included page. |
| `pdfCoverPage` | none | The published path of a page placed first, as a cover. |
| `pdfHeaderTemplate` | none | HTML printed at the top of every page. |
| `pdfFooterTemplate` | page number and count | HTML printed at the bottom of every page. |
| `pdfPrintBackground` | `false` | Print background colors and images. |

These keys can also be set in `globalMetadata` to apply to every table that enables `pdf`. Pages that belong to a PDF show a **Download PDF** link.

The header and footer templates are written to HTML files that the renderer receives through the `{header}` and `{footer}` placeholders described below; whether and how they are printed depends on the renderer. The default footer marks the page number and count with the `pageNumber` and `totalPages` classes:

```html
<div style="width: 100%; font-size: 12px;"><div style="float: right; padding: 0 2em"><span class="pageNumber"></span> / <span class="totalPages"></span></div></div>
```

## Renderer

A PDF is printed by an external program. Without configuration, the command looks for Chromium, Google Chrome, or Microsoft Edge, then for `wkhtmltopdf`. When none is installed, it reports `DG905`.

Name a renderer explicitly with `pdf.renderer`. Each argument may use these placeholders:

| Placeholder | Replaced by |
| --- | --- |
| `{input}` | The path of the printable HTML document. |
| `{url}` | The same document as a `file://` address. |
| `{output}` | The path of the PDF to write. |
| `{header}`, `{footer}` | Paths of the header and footer HTML files. |

```json
"pdf": {
  "renderer": ["chromium", "--headless=new", "--disable-gpu", "--no-pdf-header-footer", "--print-to-pdf={output}", "{url}"]
}
```

A renderer that runs longer than two minutes for one document is stopped. Set the `DOCGEN_PDF_TIMEOUT` environment variable to a number of milliseconds to change the limit.

> [!NOTE]
> This site does not publish PDFs, because its build host has no browser installed. The settings above are shown as they would be written.
