---
uid: guides.commands.template
description: List the built-in templates or export the default template's files for customizing.
---

# template

Lists the built-in templates or copies the default template into a folder so it can be customized.

```text
docgen template list
docgen template export [folder] [options]
```

## template list

Prints the names of the built-in templates, one per line:

```text
default
modern
```

`modern` is another name for `default`.

## template export

Writes the default template's files into a folder:

| File | Description |
| --- | --- |
| `layout.html` | The page layout. |
| `partials/*.html` | Every partial: `actions`, `affix`, `breadcrumb`, `footer`, `head`, `header`, `pager`, `scripts`, `sidebar`. |
| `reference/site.css`, `reference/site.js` | The default stylesheet and script, for reference. They are not loaded from the template folder. |
| `public/main.css`, `public/main.js` | Empty files that are loaded after the defaults. |

| Argument or option | Description |
| --- | --- |
| `folder` | Where to write the files. |
| `-o`, `--output <folder>` | The same, when no folder argument is given. Defaults to `_exported_templates/default`. |

Add the folder to `build.template` after `default`, then delete every file you do not change, so that later versions of the default template still apply to them.

## Example

```bash
pudu run Docgen.pudu template export docs/template
```

```json
"template": ["default", "template"]
```
