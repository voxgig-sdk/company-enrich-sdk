# CompanyEnrich PHP SDK Reference

Complete API reference for the CompanyEnrich PHP SDK.


## CompanyEnrichSDK

### Constructor

```php
require_once __DIR__ . '/company-enrich_sdk.php';

$client = new CompanyEnrichSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CompanyEnrichSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = CompanyEnrichSDK::test();
```


### Instance Methods

#### `CompanyEnrichment($data = null)`

Create a new `CompanyEnrichmentEntity` instance. Pass `null` for no initial data.

#### `CompanySearch($data = null)`

Create a new `CompanySearchEntity` instance. Pass `null` for no initial data.

#### `Similar($data = null)`

Create a new `SimilarEntity` instance. Pass `null` for no initial data.

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. Returns `[$result, $err]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array [$result, $err]`

#### `prepare(array $fetchargs = []): array`

Prepare a fetch definition without sending the request. Returns `[$fetchdef, $err]`.


---

## CompanyEnrichmentEntity

```php
$company_enrichment = $client->CompanyEnrichment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->CompanyEnrichment()->load(["id" => "company_enrichment_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): CompanyEnrichmentEntity`

Create a new `CompanyEnrichmentEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## CompanySearchEntity

```php
$company_search = $client->CompanySearch();
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

#### `list(array $reqmatch, ?array $ctrl = null): array`

List entities matching the given criteria. Returns an array.

```php
[$results, $err] = $client->CompanySearch()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): CompanySearchEntity`

Create a new `CompanySearchEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SimilarEntity

```php
$similar = $client->Similar();
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

#### `list(array $reqmatch, ?array $ctrl = null): array`

List entities matching the given criteria. Returns an array.

```php
[$results, $err] = $client->Similar()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SimilarEntity`

Create a new `SimilarEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new CompanyEnrichSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

