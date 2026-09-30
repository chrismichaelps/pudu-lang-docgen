---
uid: PuduLangDocgen.Docset.build
example: *content
---
Build the project in `website` with the default options and print its diagnostics:

```pudu
match Docset.build("website/docgen.json", &Docset.options(), &Build.extensions()) {
  case Ok(report) => {
    for problem in report.diagnostics { let _said = Io.writeLine(Docgen.describe(&problem)) }
    0
  }
  case Err(problems) => {
    for problem in problems { let _said = Io.writeErrorLine(Docgen.describe(&problem)) }
    1
  }
}
```

See <xref:guides.library?text=Library+usage> for options and extensions.
