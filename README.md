# CompanyEnrich SDK

Enrich, search, and find lookalike companies from a domain, name, or social URL

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Company Enrich API

The Company Enrich API is a B2B data service operated by [CompanyEnrich](https://companyenrich.com) that returns company profiles, search results, and lookalike-account suggestions over a REST interface served at `https://api.companyenrich.com`.

What you get from the API:
- Company enrichment from a domain, name, or social URL
- Company search across a large index of companies using filters
- Similar-company discovery for finding lookalike accounts

Access is token-based: requests carry an API token, and the vendor publishes OpenAPI and rate-limit/credits guides at [docs.companyenrich.com](https://docs.companyenrich.com). Community sources have at times reported the public endpoint as intermittent, so check the docs for the current base URL and quota policy before integrating.

## Try it

**TypeScript**
```bash
npm install company-enrich
```

**Python**
```bash
pip install company-enrich-sdk
```

**PHP**
```bash
composer require voxgig/company-enrich-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/company-enrich-sdk/go
```

**Ruby**
```bash
gem install company-enrich-sdk
```

**Lua**
```bash
luarocks install company-enrich-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { CompanyEnrichSDK } from 'company-enrich'

const client = new CompanyEnrichSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o company-enrich-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "company-enrich": {
      "command": "/abs/path/to/company-enrich-mcp"
    }
  }
}
```

## Entities

The API exposes 3 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **CompanyEnrichment** | Company profile lookup that resolves a domain, company name, or social URL to an enriched company record. | `/v1/enrich` |
| **CompanySearch** | Filtered search across CompanyEnrich's company index, used to retrieve companies matching attribute criteria. | `/v1/search` |
| **Similar** | Lookalike / similar-company discovery that returns companies ranked as comparable to a given company. | `/v1/similar` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from companyenrich_sdk import CompanyEnrichSDK

client = CompanyEnrichSDK({})


# Load a specific companyenrichment
companyenrichment, err = client.CompanyEnrichment(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'companyenrich_sdk.php';

$client = new CompanyEnrichSDK([]);


// Load a specific companyenrichment
[$companyenrichment, $err] = $client->CompanyEnrichment(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/company-enrich-sdk/go"

client := sdk.NewCompanyEnrichSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "CompanyEnrich_sdk"

client = CompanyEnrichSDK.new({})


# Load a specific companyenrichment
companyenrichment, err = client.CompanyEnrichment(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("company-enrich_sdk")

local client = sdk.new({})


-- Load a specific companyenrichment
local companyenrichment, err = client:CompanyEnrichment(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = CompanyEnrichSDK.test()
const result = await client.CompanyEnrichment().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = CompanyEnrichSDK.test(None, None)
result, err = client.CompanyEnrichment(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = CompanyEnrichSDK::test(null, null);
[$result, $err] = $client->CompanyEnrichment(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.CompanyEnrichment(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = CompanyEnrichSDK.test(nil, nil)
result, err = client.CompanyEnrichment(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:CompanyEnrichment(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Company Enrich API

- Upstream: [https://companyenrich.com](https://companyenrich.com)
- API docs: [https://docs.companyenrich.com](https://docs.companyenrich.com)

- Proprietary, vendor-operated API; no open-source licence applies to the data.
- Access requires a CompanyEnrich account and an API token.
- Usage, redistribution, and storage of returned company data are subject to CompanyEnrich's terms of service.
- Consult the official docs for the current rate limits and credit policy.

---

Generated from the Company Enrich API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
