---
uid: guides.http-api
description: Publish reference pages for HTTP services described with OpenAPI 3 or Swagger 2, on one page or split per tag or per operation.
---

# HTTP API reference

An OpenAPI description listed as content becomes a reference page for the service. OpenAPI 3 and Swagger 2 documents are both read, in YAML or JSON. A structured content file is recognized as an interface description when it has an `openapi` or a `swagger` key.

The [Inventory Service](inventory-service.yml) page on this site is produced from a sample description in `docs/guides/inventory-service.yml`.

## Adding a description

List the file as content like any article:

```json
"content": [ { "files": ["**/*.md", "**/*.yml"], "src": "docs" } ]
```

Link it from a table of contents or an article by its source name:

```yaml
- name: "Sample: Inventory service"
  href: inventory-service.yml
```

## What the page shows

| Part | Source in the description |
| --- | --- |
| Title and version | `info.title` and `info.version`. |
| Introduction | `info.description`, rendered as Markdown. Links in it are checked like any article link. |
| Servers | `servers[].url` in OpenAPI 3; `host` and `basePath` in Swagger 2. |
| Operations | Every method under `paths`, listed under each of its tags; operations without tags are grouped under **Operations**. Deprecated operations are marked. |
| Parameters | Name, location (`path`, `query`, `header`, `cookie`), whether it is required, type, and description. |
| Request body | Media types and schemas of `requestBody`, or a `body` parameter in Swagger 2. |
| Responses | Status codes, descriptions, and the schema of each media type. |
| Schemas | `components.schemas` in OpenAPI 3 or `definitions` in Swagger 2, with properties, required markers, and enumerated values. |

Local references (`$ref: '#/components/schemas/Item'`) are shown as links to the schema's section.

## Identities

The service's uid is the `uid` set for the page through metadata, or a slug of its title. Operations and schemas get identities below it, so articles can link to them:

| Identity | Example on this site |
| --- | --- |
| `<service>` | <xref:inventory-service> |
| `<service>.<operationId>` | <xref:inventory-service.getItem?displayProperty=fullName> |
| `<service>.schemas.<Name>` | <xref:inventory-service.schemas.Movement> |

## Splitting large services

A service with many operations can be spread over several pages by adding a built-in template extension to `template`:

| Template | Pages |
| --- | --- |
| `rest.tagpage` | An overview page with servers, an index of operations, and schemas, plus one page per tag. |
| `rest.operationpage` | An overview page plus one page per operation. |

Both can be listed together, which gives a page per tag that links to a page per operation.

```json
"template": ["default", "rest.tagpage", "template"]
```

Split pages are written to a folder named after the overview page. For `inventory-service.yml`, the tag pages are `inventory-service/items.html` and `inventory-service/movements.html`.

> [!NOTE]
> The template extensions change every HTTP API page of the site. This site keeps the single-page layout so that the whole sample service is visible on one page.
