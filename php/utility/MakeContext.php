<?php
declare(strict_types=1);

// CompanyEnrich SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class CompanyEnrichMakeContext
{
    public static function call(array $ctxmap, ?CompanyEnrichContext $basectx): CompanyEnrichContext
    {
        return new CompanyEnrichContext($ctxmap, $basectx);
    }
}
