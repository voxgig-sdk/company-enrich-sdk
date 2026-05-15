# CompanyEnrich Python SDK Reference

Complete API reference for the CompanyEnrich Python SDK.


## CompanyEnrichSDK

### Constructor

```python
from company-enrich_sdk import CompanyEnrichSDK

client = CompanyEnrichSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CompanyEnrichSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = CompanyEnrichSDK.test()
```


### Instance Methods

#### `CompanyEnrichment(data=None)`

Create a new `CompanyEnrichmentEntity` instance. Pass `None` for no initial data.

#### `CompanySearch(data=None)`

Create a new `CompanySearchEntity` instance. Pass `None` for no initial data.

#### `Similar(data=None)`

Create a new `SimilarEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> tuple`

Make a direct HTTP request to any API endpoint. Returns `(result, err)`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `(result_dict, err)`

#### `prepare(fetchargs=None) -> tuple`

Prepare a fetch definition without sending. Returns `(fetchdef, err)`.


---

## CompanyEnrichmentEntity

```python
company_enrichment = client.CompanyEnrichment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.CompanyEnrichment().load({"id": "company_enrichment_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompanyEnrichmentEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CompanySearchEntity

```python
company_search = client.CompanySearch()
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.CompanySearch().list({})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompanySearchEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SimilarEntity

```python
similar = client.Similar()
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.Similar().list({})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SimilarEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = CompanyEnrichSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

