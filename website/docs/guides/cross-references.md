---
uid: guides.cross-references
description: Link pages and declarations by identity, check every link at build time, and exchange cross-reference maps with other sites.
---

# Links and cross references

Links between pages can be written in two ways: as relative links to Markdown files, or as cross references to an identity (a **uid**). Both are checked when the site is built.

## Relative links

A relative link names the source file, not the published page:

```markdown
See the [configuration reference](configuration.md#build-settings).
```

The build rewrites `configuration.md` to the published `configuration.html` and checks that:

- the target file is published (`DG123` when it is not, `DG125` for a missing image);
- the fragment names a heading or element on the target page (`DG127`);
- the path stays inside the site (`DG122`) and uses a safe scheme (`DG121`).

## Identities

Every page and declaration can carry a uid:

| Source | Uid |
| --- | --- |
| An article | The `uid` in its front matter, such as `guides.markdown`. |
| A Pudu module | Its module name, such as `PuduLangDocgen.Docset`. |
| A declaration in a module | The module name and the declaration name, such as `PuduLangDocgen.Docset.build`. |
| A field, variant, or method | The type's uid and the member name, such as `PuduLangDocgen.Build.Extensions.pages`. |
| An HTTP service | The `uid` in the page metadata, or a slug of the service title. |
| An HTTP operation or schema | `<service>.<operationId>` and `<service>.schemas.<Name>`. |

Two pages that declare the same uid stop the build with `DG301`.

## Cross-reference forms

| Form | Example | Renders as |
| --- | --- | --- |
| Autolink | `<xref:PuduLangDocgen.Docset.build>` | <xref:PuduLangDocgen.Docset.build> |
| Full name | `<xref:PuduLangDocgen.Docset.build?displayProperty=fullName>` | <xref:PuduLangDocgen.Docset.build?displayProperty=fullName> |
| Custom text | `<xref:PuduLangDocgen.Docset.build?text=the+build+entry+point>` | <xref:PuduLangDocgen.Docset.build?text=the+build+entry+point> |
| Link | `[build a project](xref:PuduLangDocgen.Docset.build)` | [build a project](xref:PuduLangDocgen.Docset.build) |
| Element | `<xref uid="guides.markdown" text="Markdown guide"/>` | <xref uid="guides.markdown" text="Markdown guide"/> |
| Shorthand | `@guides.concepts` | @guides.concepts |
| Quoted shorthand | `@"inventory-service.getItem"` | @"inventory-service.getItem" |

The shorthand form starts at an `@` that follows a space or an opening bracket, so addresses such as `team@example.org` are not read as references.

An identity that no page and no cross-reference map declares is reported as `DG124` and rendered as plain text.

## Cross-reference maps

Every build publishes `xrefmap.yml` at the root of the site. It lists each uid with its name, full name, address, and kind, sorted by uid. When `sitemap.baseUrl` or the `_baseUrl` metadata is set, the map records it as `baseUrl` so that its addresses resolve from anywhere.

```yaml
### YamlMime:XRefMap
sorted: true
baseUrl: https://www.pudu-lang-docgen.com
references:
- uid: PuduLangDocgen.Docset.build
  name: build
  fullName: PuduLangDocgen.Docset.build
  href: api/PuduLangDocgen.Docset.html#build
  type: function
```

To link to another site's identities, list its map in `build.xref`. Entries may be project paths or web addresses, in YAML or JSON:

```json
"xref": [
  "https://www.pudu-lang-docgen.com/xrefmap.yml",
  "maps/partner.json"
]
```

Identities declared by the site itself take precedence over identities from maps. A map that cannot be fetched or read is reported as `DG904`.

The [download](commands/download.md) and [merge](commands/merge.md) commands save a remote map locally and combine several maps into one, which keeps builds independent of the network.
