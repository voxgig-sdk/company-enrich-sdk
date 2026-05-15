<?php
declare(strict_types=1);

// CompanyEnrich SDK base feature

class CompanyEnrichBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(CompanyEnrichContext $ctx, array $options): void {}
    public function PostConstruct(CompanyEnrichContext $ctx): void {}
    public function PostConstructEntity(CompanyEnrichContext $ctx): void {}
    public function SetData(CompanyEnrichContext $ctx): void {}
    public function GetData(CompanyEnrichContext $ctx): void {}
    public function GetMatch(CompanyEnrichContext $ctx): void {}
    public function SetMatch(CompanyEnrichContext $ctx): void {}
    public function PrePoint(CompanyEnrichContext $ctx): void {}
    public function PreSpec(CompanyEnrichContext $ctx): void {}
    public function PreRequest(CompanyEnrichContext $ctx): void {}
    public function PreResponse(CompanyEnrichContext $ctx): void {}
    public function PreResult(CompanyEnrichContext $ctx): void {}
    public function PreDone(CompanyEnrichContext $ctx): void {}
    public function PreUnexpected(CompanyEnrichContext $ctx): void {}
}
