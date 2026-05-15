# CompanyEnrich SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

CompanyEnrichUtility.registrar = ->(u) {
  u.clean = CompanyEnrichUtilities::Clean
  u.done = CompanyEnrichUtilities::Done
  u.make_error = CompanyEnrichUtilities::MakeError
  u.feature_add = CompanyEnrichUtilities::FeatureAdd
  u.feature_hook = CompanyEnrichUtilities::FeatureHook
  u.feature_init = CompanyEnrichUtilities::FeatureInit
  u.fetcher = CompanyEnrichUtilities::Fetcher
  u.make_fetch_def = CompanyEnrichUtilities::MakeFetchDef
  u.make_context = CompanyEnrichUtilities::MakeContext
  u.make_options = CompanyEnrichUtilities::MakeOptions
  u.make_request = CompanyEnrichUtilities::MakeRequest
  u.make_response = CompanyEnrichUtilities::MakeResponse
  u.make_result = CompanyEnrichUtilities::MakeResult
  u.make_point = CompanyEnrichUtilities::MakePoint
  u.make_spec = CompanyEnrichUtilities::MakeSpec
  u.make_url = CompanyEnrichUtilities::MakeUrl
  u.param = CompanyEnrichUtilities::Param
  u.prepare_auth = CompanyEnrichUtilities::PrepareAuth
  u.prepare_body = CompanyEnrichUtilities::PrepareBody
  u.prepare_headers = CompanyEnrichUtilities::PrepareHeaders
  u.prepare_method = CompanyEnrichUtilities::PrepareMethod
  u.prepare_params = CompanyEnrichUtilities::PrepareParams
  u.prepare_path = CompanyEnrichUtilities::PreparePath
  u.prepare_query = CompanyEnrichUtilities::PrepareQuery
  u.result_basic = CompanyEnrichUtilities::ResultBasic
  u.result_body = CompanyEnrichUtilities::ResultBody
  u.result_headers = CompanyEnrichUtilities::ResultHeaders
  u.transform_request = CompanyEnrichUtilities::TransformRequest
  u.transform_response = CompanyEnrichUtilities::TransformResponse
}
