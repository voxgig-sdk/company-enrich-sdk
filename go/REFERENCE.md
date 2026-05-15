# CompanyEnrich Golang SDK Reference

Complete API reference for the CompanyEnrich Golang SDK.


## CompanyEnrichSDK

### Constructor

```go
func NewCompanyEnrichSDK(options map[string]any) *CompanyEnrichSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `TestSDK(testopts, sdkopts map[string]any) *CompanyEnrichSDK`

Create a test client with mock features active. Both arguments may be `nil`.

```go
client := sdk.TestSDK(nil, nil)
```


### Instance Methods

#### `CompanyEnrichment(data map[string]any) CompanyEnrichEntity`

Create a new `CompanyEnrichment` entity instance. Pass `nil` for no initial data.

#### `CompanySearch(data map[string]any) CompanyEnrichEntity`

Create a new `CompanySearch` entity instance. Pass `nil` for no initial data.

#### `Similar(data map[string]any) CompanyEnrichEntity`

Create a new `Similar` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## CompanyEnrichmentEntity

```go
company_enrichment := client.CompanyEnrichment(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.CompanyEnrichment(nil).Load(map[string]any{"id": "company_enrichment_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CompanyEnrichmentEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CompanySearchEntity

```go
company_search := client.CompanySearch(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `company_id` | ``$STRING`` | No |  |
| `domain` | ``$STRING`` | No |  |
| `employee_count` | ``$INTEGER`` | No |  |
| `industry` | ``$STRING`` | No |  |
| `location` | ``$STRING`` | No |  |
| `logo_url` | ``$STRING`` | No |  |
| `name` | ``$STRING`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.CompanySearch(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CompanySearchEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SimilarEntity

```go
similar := client.Similar(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `company_id` | ``$STRING`` | No |  |
| `domain` | ``$STRING`` | No |  |
| `employee_count` | ``$INTEGER`` | No |  |
| `industry` | ``$STRING`` | No |  |
| `location` | ``$STRING`` | No |  |
| `logo_url` | ``$STRING`` | No |  |
| `name` | ``$STRING`` | No |  |
| `similarity_score` | ``$NUMBER`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Similar(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SimilarEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewCompanyEnrichSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

