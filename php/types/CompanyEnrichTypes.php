<?php
declare(strict_types=1);

// Typed models for the CompanyEnrich SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** CompanyEnrichment entity data model. */
class CompanyEnrichment
{
    public ?array $data = null;
    public ?bool $success = null;
}

/** Match filter for CompanyEnrichment#load (any subset of CompanyEnrichment fields). */
class CompanyEnrichmentLoadMatch
{
    public ?array $data = null;
    public ?bool $success = null;
}

/** CompanySearch entity data model. */
class CompanySearch
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?int $employee_count = null;
    public ?string $industry = null;
    public ?string $location = null;
    public ?string $logo_url = null;
    public ?string $name = null;
}

/** Match filter for CompanySearch#list (any subset of CompanySearch fields). */
class CompanySearchListMatch
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?int $employee_count = null;
    public ?string $industry = null;
    public ?string $location = null;
    public ?string $logo_url = null;
    public ?string $name = null;
}

/** Similar entity data model. */
class Similar
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?int $employee_count = null;
    public ?string $industry = null;
    public ?string $location = null;
    public ?string $logo_url = null;
    public ?string $name = null;
    public ?float $similarity_score = null;
}

/** Match filter for Similar#list (any subset of Similar fields). */
class SimilarListMatch
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?int $employee_count = null;
    public ?string $industry = null;
    public ?string $location = null;
    public ?string $logo_url = null;
    public ?string $name = null;
    public ?float $similarity_score = null;
}

