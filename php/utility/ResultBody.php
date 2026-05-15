<?php
declare(strict_types=1);

// CompanyEnrich SDK utility: result_body

class CompanyEnrichResultBody
{
    public static function call(CompanyEnrichContext $ctx): ?CompanyEnrichResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
