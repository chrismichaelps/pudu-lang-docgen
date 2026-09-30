---
uid: guides.diagnostics
description: Every diagnostic code pudu-lang-docgen reports, what it means, and how to fix it.
---

# Diagnostics reference

Every problem the build finds is reported as a diagnostic with a stable code:

```text
docs/guides/markdown.md:42: warning DG123: link target not found: docs/guides/missing.md
```

The line names the file, the one-based line, the severity, the code, and a message. **Errors** stop the build before anything is written. **Warnings** are reported and the site is still published, unless `warningsAsErrors` is set. The level of any code can be changed with `build.rules`:

```json
"rules": { "DG211": "error", "DG107": "off" }
```

Library callers receive the same values as <xref:PuduLangDocgen.Diagnostic>; the codes are the constants of <xref:PuduLangDocgen.Constants.Codes>.

## Articles

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG101` | Warning | A code fence or a `$$` math block runs to the end of the file or container. | Add the closing fence or `$$` line. |
| `DG102` | Error | An included file does not exist. | Correct the path, relative to the including file. |
| `DG103` | Error | Files include one another in a cycle. | Remove one of the includes in the cycle named by the message. |
| `DG104` | Warning | Content nests more than 24 levels deep and is shown as text. | Flatten nested quotes, lists, or includes. |
| `DG105` | Error | A code excerpt names a file that does not exist. | Correct the path, relative to the article. |
| `DG106` | Error | A code excerpt's region, line range, or options cannot be applied. | Check that the region is opened and closed in the file, and that ranges are written like `3-9`. |
| `DG107` | Warning | A quote names an alert kind that is not configured; it is shown as a quote. | Use a built-in kind or declare it in `markdownEngineProperties.alerts`. |
| `DG108` | Error or warning | An image directive has no `source` (error), or a `:::` directive is not supported (warning). | Add the attribute, or use a supported directive: `code`, `image`, `video`, `row`, `column`. |
| `DG109` | Error | Front matter is not closed or is not a mapping of keys to values. | Close the header with a `---` line and write it as `key: value` pairs. |
| `DG110` | Error | A container directive has no matching end line. | Add `:::row-end:::`, `:::column-end:::`, or `:::image-end:::`. |
| `DG111` | Error | An include or excerpt path is absolute, encoded, or not portable. | Write a relative path with `/` separators and no `%` escapes. |

## Links and references

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG121` | Warning | A link uses a scheme or form that is never linked, such as `javascript:`. | Link to an `http`, `https`, or `mailto` address or a relative path. |
| `DG122` | Warning | A relative link leaves the project folder. | Link to a file inside the project, or use an absolute address. |
| `DG123` | Warning | A link names a file that is not published. | Correct the path, or add the file to `content` or `resource`. |
| `DG124` | Warning | A cross reference names a uid that no page or map declares. | Correct the uid, declare it on a page, or add the site that declares it to `xref`. |
| `DG125` | Warning | An image names a file that is not published. | Correct the path, or add the image to `resource`. |
| `DG126` | Warning | An embedded video does not use HTTPS. | Use the `https://` address of the video. |
| `DG127` | Warning | A link names a section its target page does not have. | Correct the fragment after `#`; heading fragments are lower case with dashes. |

## Tables of contents

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG201` | Error | A table of contents is not valid YAML or JSON. | Fix the syntax at the reported location. |
| `DG202` | Error | A table of contents or one of its items has the wrong shape. | Write a list of items, or an object with an `items` list; each item is a mapping. |
| `DG203` | Error | A Markdown table of contents has a heading without a title. | Give every heading a title. |
| `DG204` | Error | A table of contents destination is unsafe. | Use a relative path or an `http`, `https`, or `mailto` address. |
| `DG205` | Error | A table of contents nests more than 32 levels. | Split it into tables linked by folder. |
| `DG206` | Error | An item declares an unknown field. | Use `name`, `href`, `uid`, `items`, `expanded`, `topicHref`, or `topicUid`. |
| `DG207` | Error | An item has neither a name, a uid, nor an href. | Add a `name`. |
| `DG210` | Warning | An item names an unknown uid. | Correct the uid. |
| `DG211` | Warning | An item's destination is not published. | Correct the path, or add the file to `content`. |
| `DG212` | Error | Tables of contents link one another in a cycle, or more than 16 deep. | Remove the link that closes the cycle. |

## Identities and templates

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG301` | Error | Two pages declare the same uid. | Give one of the pages another `uid`. |
| `DG401` | Error | A layout or partial template does not parse. | Close every `{{#section}}` with a matching `{{/section}}`. |

## Configuration and content

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG501` | Error | A configuration value is missing, unknown, or of the wrong type; also reported by `init` for a folder that already has a project. | Correct the key named in the message. See the [configuration reference](configuration.md). |
| `DG502` | Error | The configuration, or a metadata file it names, cannot be read or decoded. | Check that the file exists and is valid JSON or YAML. |
| `DG601` | Error | A content file listed by the configuration cannot be read. | Check the file's permissions and encoding. |
| `DG602` | Error | A structured content file does not decode, or describes an invalid interface or page. | Fix the YAML or JSON; check the OpenAPI document or API page against its format. |
| `DG603` | Warning | A content file has a type the build does not publish, and is skipped. | List it under `resource` to copy it, or remove it from `content`. |
| `DG701` | Error | An overwrite section header is malformed or names no uid. | Start each section with a `---` block holding `uid:`. |

## Output and tools

| Code | Severity | Meaning | How to fix it |
| --- | --- | --- | --- |
| `DG801` | Error | An output path is not portable. | Rename the source file: avoid reserved names, trailing dots, and characters such as `:` or `*`. |
| `DG802` | Error | Two outputs share a path, or a file takes the path of a folder. | Rename one source, or change a mapping's `dest`. |
| `DG901` | Error | The configuration selects no content and no API sources. | Add a `content` mapping or a `metadata` source. |
| `DG902` | Error | A project file or folder cannot be read safely: it is a symbolic link, larger than 32 MiB, nested more than 64 folders deep, or the project holds more than 100,000 files. | Replace links with files, and keep large or generated files out of the project folder. |
| `DG903` | Error | Output could not be written, or a publication path is unsafe. | Check that the output folder is writable. |
| `DG904` | Error or warning | A cross-reference map could not be fetched or read. | Check the address or path in `xref`, or save the map with the [download](commands/download.md) command. |
| `DG905` | Error or warning | An external tool is missing or failed: the PDF renderer, or the local PlantUML renderer. | Install the tool, or configure `pdf.renderer` or `markdownEngineProperties.plantUml`. |
