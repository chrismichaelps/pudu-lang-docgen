# Reports

Summaries such as <xref:Inventory.Report.total> read every item once.

> [!SECURITY]
> Reports never expose supplier prices.

```mermaid
flowchart LR
  Items --> Total
  Items --> Missing
```

See also: [Getting started](getting-started.md#record-a-sale).
