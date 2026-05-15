<?php
declare(strict_types=1);

// CompanyEnrich SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

CompanyEnrichUtility::setRegistrar(function (CompanyEnrichUtility $u): void {
    $u->clean = [CompanyEnrichClean::class, 'call'];
    $u->done = [CompanyEnrichDone::class, 'call'];
    $u->make_error = [CompanyEnrichMakeError::class, 'call'];
    $u->feature_add = [CompanyEnrichFeatureAdd::class, 'call'];
    $u->feature_hook = [CompanyEnrichFeatureHook::class, 'call'];
    $u->feature_init = [CompanyEnrichFeatureInit::class, 'call'];
    $u->fetcher = [CompanyEnrichFetcher::class, 'call'];
    $u->make_fetch_def = [CompanyEnrichMakeFetchDef::class, 'call'];
    $u->make_context = [CompanyEnrichMakeContext::class, 'call'];
    $u->make_options = [CompanyEnrichMakeOptions::class, 'call'];
    $u->make_request = [CompanyEnrichMakeRequest::class, 'call'];
    $u->make_response = [CompanyEnrichMakeResponse::class, 'call'];
    $u->make_result = [CompanyEnrichMakeResult::class, 'call'];
    $u->make_point = [CompanyEnrichMakePoint::class, 'call'];
    $u->make_spec = [CompanyEnrichMakeSpec::class, 'call'];
    $u->make_url = [CompanyEnrichMakeUrl::class, 'call'];
    $u->param = [CompanyEnrichParam::class, 'call'];
    $u->prepare_auth = [CompanyEnrichPrepareAuth::class, 'call'];
    $u->prepare_body = [CompanyEnrichPrepareBody::class, 'call'];
    $u->prepare_headers = [CompanyEnrichPrepareHeaders::class, 'call'];
    $u->prepare_method = [CompanyEnrichPrepareMethod::class, 'call'];
    $u->prepare_params = [CompanyEnrichPrepareParams::class, 'call'];
    $u->prepare_path = [CompanyEnrichPreparePath::class, 'call'];
    $u->prepare_query = [CompanyEnrichPrepareQuery::class, 'call'];
    $u->result_basic = [CompanyEnrichResultBasic::class, 'call'];
    $u->result_body = [CompanyEnrichResultBody::class, 'call'];
    $u->result_headers = [CompanyEnrichResultHeaders::class, 'call'];
    $u->transform_request = [CompanyEnrichTransformRequest::class, 'call'];
    $u->transform_response = [CompanyEnrichTransformResponse::class, 'call'];
});
