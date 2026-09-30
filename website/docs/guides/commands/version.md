---
uid: guides.commands.version
description: Print the package name and version.
---

# version

Prints the package name and version, then exits with status `0`.

```text
docgen version
```

```bash
pudu run examples/Cli.pudu version
```

```text
pudu-lang-docgen 0.1.0
```

The same version is recorded as the generator in every build's `manifest.json`. The version of Pudu itself is printed by `pudu version`.
