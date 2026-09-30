---
uid: guide.start
---

# Getting started

The library keeps stock as <xref:Inventory.Item> values and changes them with <xref:Inventory.apply>.

> [!TIP]
> Counts replace quantities; receipts and sales adjust them.

## Install

# [pudu.toml](#tab/toml)

```toml
[dependencies]
"@example/inventory" = "0.1.0"
```

# [Command line](#tab/cli)

```bash
pudu add @example/inventory
```

---

## Record a sale

```pudu
let item = Inventory.apply(Inventory.empty("A-1"), Inventory.Received(5))
let after = Inventory.apply(item, Inventory.Sold(2))
```

| Change | Effect |
|:--|:--|
| `Received(n)` | adds *n* units |
| `Sold(n)` | removes *n* units |
| `Counted(n)` | sets the quantity to *n* |

The quantity after a sale is $q - n$.[^units]

[^units]: Quantities are whole units.

## Next steps

Read about [reports](reports.md).
