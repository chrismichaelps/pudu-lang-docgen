---
type: module
path: "@root/src/PuduLangDocgen/Rest/OpenApi.pudu"
fidelity: Active
grammar: "[[grammar/pudu]]"
depth_status: DEEP
tags: [module, deep]
---

# PuduLangDocgen.Rest.OpenApi

> /** @Docgen.Rest.OpenApi — HTTP interface descriptions read into operations and schemas */

## Purpose

Reads OpenAPI 3 and Swagger 2 descriptions, in JSON or YAML, into a service: operations with
tags, parameters, bodies, and responses, and schemas with properties, required names, and
enumerated values, following local references.

## Interface

### Signatures

```pudu
export type Parameter = { name: Str, location: Str, required: Bool, kind: Str, description: Str }
export type Payload = { media: Str, kind: Str }
export type Response = { status: Str, description: Str, payloads: Array[Payload] }
export type Operation = {
  id: Str,
  method: Str,
  path: Str,
  summary: Str,
  description: Str,
  tags: Array[Str],
  parameters: Array[Parameter],
  body: Array[Payload],
  bodyRequired: Bool,
  responses: Array[Response],
  deprecated: Bool
}
export type Property = { name: Str, kind: Str, required: Bool, description: Str }
export type Schema = { name: Str, kind: Str, description: Str, properties: Array[Property], values: Array[Str] }
export type Service = { title: Str, version: Str, description: Str, servers: Array[Str], operations: Array[Operation], schemas: Array[Schema] }
export fn recognizes(value: &Docgen.Meta) -> Bool
export fn read(value: &Docgen.Meta) -> Result[Service, Str]
export fn describe(value: &Docgen.Meta) -> Str
export fn refName(reference: Str) -> Str
```

### Linkage

- **Requires:** [[src/PuduLangDocgen]] · [[src/PuduLangDocgen/Meta]]
- **Consumed by:** [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Rest/Pages]] · [[test/PuduLangDocgen/RestTest]]

## Algorithm

- `recognizes` — Whether metadata is an HTTP interface description.
- `read` — The service a description declares.
- `describe` — A short description of a schema's type, naming referenced schemas by name.
- `refName` — The schema name at the end of a local reference such as `#/components/schemas/Pet`.

## Negative Logic (Prohibited Paths)

- Do not follow remote references.
- Do not drop path-level parameters an operation does not redeclare.

## Edge Cases

- Swagger `schema` payloads and OpenAPI `content` maps read the same way.
- Methods keep the order a path lists them in.

## Depth

DEEP. Two description formats, one model.

## Grill Log

- Q: Fetch remote references? A: Local references only; builds stay offline. Rejected: network access while reading a file.

## Referenced by

[[src/PuduLangDocgen/Rest/_MOC]] · [[src/PuduLangDocgen/Build]] · [[src/PuduLangDocgen/Build/Sources]] · [[src/PuduLangDocgen/Rest/Pages]]
