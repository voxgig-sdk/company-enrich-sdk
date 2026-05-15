<?php
declare(strict_types=1);

// CompanyEnrich SDK utility: feature_add

class CompanyEnrichFeatureAdd
{
    public static function call(CompanyEnrichContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
