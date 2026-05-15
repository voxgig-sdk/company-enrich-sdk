<?php
declare(strict_types=1);

// CompanyEnrich SDK exists test

require_once __DIR__ . '/../companyenrich_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = CompanyEnrichSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
