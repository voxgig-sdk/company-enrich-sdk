<?php
declare(strict_types=1);

// CompanyEnrich SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class CompanyEnrichFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new CompanyEnrichBaseFeature();
            case "test":
                return new CompanyEnrichTestFeature();
            default:
                return new CompanyEnrichBaseFeature();
        }
    }
}
