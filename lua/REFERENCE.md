# CompanyEnrich Lua SDK Reference

Complete API reference for the CompanyEnrich Lua SDK.


## CompanyEnrichSDK

### Constructor

```lua
local sdk = require("company-enrich_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `CompanyEnrichment(data)`

Create a new `CompanyEnrichment` entity instance. Pass `nil` for no initial data.

#### `CompanySearch(data)`

Create a new `CompanySearch` entity instance. Pass `nil` for no initial data.

#### `Similar(data)`

Create a new `Similar` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## CompanyEnrichmentEntity

```lua
local company_enrichment = client:CompanyEnrichment(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `table` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:CompanyEnrichment():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompanyEnrichmentEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CompanySearchEntity

```lua
local company_search = client:CompanySearch(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `company_id` | `string` | No |  |
| `domain` | `string` | No |  |
| `employee_count` | `number` | No |  |
| `industry` | `string` | No |  |
| `location` | `string` | No |  |
| `logo_url` | `string` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:CompanySearch():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompanySearchEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SimilarEntity

```lua
local similar = client:Similar(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `company_id` | `string` | No |  |
| `domain` | `string` | No |  |
| `employee_count` | `number` | No |  |
| `industry` | `string` | No |  |
| `location` | `string` | No |  |
| `logo_url` | `string` | No |  |
| `name` | `string` | No |  |
| `similarity_score` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Similar():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SimilarEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

