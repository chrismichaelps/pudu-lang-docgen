# Security policy

## Reporting a vulnerability

Report a suspected vulnerability privately through GitHub's
[security advisory form](https://github.com/chrismichaelps/pudu-lang-docgen/security/advisories/new),
or by email to <chrisperezsantiago1@gmail.com> with `SECURITY` in the subject.

Please do not open a public issue for a vulnerability. Include the package version, the `pudu`
version, the platform, and the smallest project that shows the problem.

You can expect an acknowledgement within seven days and a decision on whether the report is
accepted within thirty.

## What is in scope

A documentation project is usually written by people the site owner trusts, but its pages are
read by anyone, and parts of it (API comments, OpenAPI descriptions, cross-reference maps from
other sites) often come from elsewhere. A report is in scope when the package lets that content do
more than its configuration allows:

- Markdown, API documentation, or a structured page producing script, an event handler, or an
  executable destination such as `javascript:` in the published HTML.
- A link, include, excerpt, resource, or output path reading or writing outside the project or
  the output folder.
- The preview server answering with a file outside the folder it serves.
- A remote cross-reference map or reference service answer injecting markup or unsafe links.
- Content that crashes the build, loops without end, or grows memory without a bound.

## What is not in scope

- Template files and the scripts and styles named by `_appScript` and `_appStyle`. They are the
  site's own look and are trusted as written.
- Publishing a site that contains what its authors wrote.
- Vulnerabilities in the Pudu compiler or standard library; report those to
  [pudu-lang](https://github.com/chrismichaelps/pudu-lang/security).

## Supported versions

| Version | Supported |
| ------- | --------- |
| 0.1.x   | Yes       |
