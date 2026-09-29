# Security policy

## Reporting a vulnerability

Report a suspected vulnerability privately through GitHub's
[security advisory form](https://github.com/chrismichaelps/pudu-lang-log/security/advisories/new),
or by email to <chrisperezsantiago1@gmail.com> with `SECURITY` in the subject.

Please do not open a public issue for a vulnerability. Include the package version, the `pudu`
version, the platform, and the smallest program that shows the problem.

You can expect an acknowledgement within seven days and a decision on whether the report is
accepted within thirty.

## What is in scope

A logger receives values from the program that uses it, and those values often come from
untrusted input. A report is in scope when the package does more with them than its configuration
allows:

- A formatter writing output that breaks its own format: an unescaped quote or control character
  in JSON, or a line break that forges a second event in a line-oriented text sink.
- A message template, filter expression, or settings document that crashes the program, loops
  without end, or grows memory without a bound.
- A queue or buffer growing past its configured limit, or a file sink writing past its size limit
  or keeping more files than its retention allows.
- A file sink writing outside the directory its path names.
- A logging failure escaping to the caller from a sink that is not an audit sink.

## What is not in scope

- Values the program chooses to log. The package records what it is given; keeping secrets out of
  events is the caller's decision, helped by destructuring policies and filters.
- Vulnerabilities in the Pudu compiler or standard library; report those to
  [pudu-lang](https://github.com/chrismichaelps/pudu-lang/security).

## Supported versions

| Version | Supported |
| ------- | --------- |
| 0.1.x   | Yes       |
