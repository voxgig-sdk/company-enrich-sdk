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
    public ?string $company_id = null;
    public ?string $description = null;
    public ?string $domain = null;
    public ?string $email = null;
    public ?int $employee_count = null;
    public ?int $founded_year = null;
    public ?string $industry = null;
    public ?array $location = null;
    public ?string $logo_url = null;
    public ?string $name = null;
    public ?string $phone = null;
    public ?string $revenue = null;
    public ?array $social_profiles = null;
    public ?array $technologies = null;
}

/** Request payload for CompanyEnrichment#load. */
class CompanyEnrichmentLoadMatch
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?string $name = null;
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

/** Request payload for CompanySearch#list. */
class CompanySearchListMatch
{
    public ?int $employee_count_max = null;
    public ?int $employee_count_min = null;
    public ?string $industry = null;
    public ?int $limit = null;
    public ?string $location = null;
    public ?int $offset = null;
    public ?string $query = null;
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

/** Request payload for Similar#list. */
class SimilarListMatch
{
    public ?string $company_id = null;
    public ?string $domain = null;
    public ?int $limit = null;
}

