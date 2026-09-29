# Capability ledger

Status: design/research. Each row requires implementation, failure and regression checks,
output evidence, and independent review before release. No row is implicitly complete.

| Capability | Acceptance boundary | State |
| --- | --- | --- |
| Configuration | typed options, defaults, unknown/malformed refusal, files/globs/excludes, locale/base URL | Pending |
| Articles | headings, inline formatting, lists, tables, quotes, fences, escaping and source diagnostics | Pending |
| Authoring | front matter, includes, code snippets, tabs, alerts, images and equations | Pending |
| Metadata | compiler declaration catalog, filtering, types/members/signatures/docs, source provenance | Pending |
| HTTP API | operation/schema reference models, validation and reference resolution | Pending |
| Navigation | nested TOC, breadcrumbs, local/page navigation, landing pages | Pending |
| References | UID catalogs, external maps, relative links/fragments and duplicate/broken detection | Pending |
| Templates | original enterprise shell, extension hooks, accessibility, responsive/dark/print modes | Pending |
| Search | deterministic index, browser filtering, Unicode and safe DOM rendering | Pending |
| Resources | binary copying, collision/security checks, source/edit links | Pending |
| Build | deterministic manifest, strict mode, diagnostic aggregation, no partial success claims | Pending |
| Incremental | content/dependency cache, stale output handling, forced rebuild | Pending |
| CLI | initialize, build, metadata, serve/watch, help, exit statuses | Pending |
| Export | JSON model and printable/PDF output with explicit tool errors | Pending |
| Extensions | processors, postprocessors, metadata transforms, custom templates | Pending |
| Release | full tests, mutation, package archive/install, wiki and platform CI | Pending |

Pudu declarations are the native metadata input. Runtime-specific assembly reflection and
compiler-project loading require a separately designed importer rather than a claimed native API.

## Referenced by

[[architecture/_MOC]] · [[handoffs/2026-09-29-docgen]]
