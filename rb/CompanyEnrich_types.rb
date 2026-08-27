# frozen_string_literal: true

# Typed models for the CompanyEnrich SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# CompanyEnrichment entity data model.
#
# @!attribute [rw] company_id
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] employee_count
#   @return [Integer, nil]
#
# @!attribute [rw] founded_year
#   @return [Integer, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash, nil]
#
# @!attribute [rw] logo_url
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] revenue
#   @return [String, nil]
#
# @!attribute [rw] social_profiles
#   @return [Hash, nil]
#
# @!attribute [rw] technologies
#   @return [Array, nil]
CompanyEnrichment = Struct.new(
  :company_id,
  :description,
  :domain,
  :email,
  :employee_count,
  :founded_year,
  :industry,
  :location,
  :logo_url,
  :name,
  :phone,
  :revenue,
  :social_profiles,
  :technologies,
  keyword_init: true
)

# Request payload for CompanyEnrichment#load.
#
# @!attribute [rw] company_id
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
CompanyEnrichmentLoadMatch = Struct.new(
  :company_id,
  :domain,
  :name,
  keyword_init: true
)

# CompanySearch entity data model.
#
# @!attribute [rw] company_id
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] employee_count
#   @return [Integer, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [String, nil]
#
# @!attribute [rw] logo_url
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
CompanySearch = Struct.new(
  :company_id,
  :domain,
  :employee_count,
  :industry,
  :location,
  :logo_url,
  :name,
  keyword_init: true
)

# Request payload for CompanySearch#list.
#
# @!attribute [rw] employee_count_max
#   @return [Integer, nil]
#
# @!attribute [rw] employee_count_min
#   @return [Integer, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] limit
#   @return [Integer, nil]
#
# @!attribute [rw] location
#   @return [String, nil]
#
# @!attribute [rw] offset
#   @return [Integer, nil]
#
# @!attribute [rw] query
#   @return [String, nil]
CompanySearchListMatch = Struct.new(
  :employee_count_max,
  :employee_count_min,
  :industry,
  :limit,
  :location,
  :offset,
  :query,
  keyword_init: true
)

# Similar entity data model.
#
# @!attribute [rw] company_id
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] employee_count
#   @return [Integer, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [String, nil]
#
# @!attribute [rw] logo_url
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] similarity_score
#   @return [Float, nil]
Similar = Struct.new(
  :company_id,
  :domain,
  :employee_count,
  :industry,
  :location,
  :logo_url,
  :name,
  :similarity_score,
  keyword_init: true
)

# Request payload for Similar#list.
#
# @!attribute [rw] company_id
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] limit
#   @return [Integer, nil]
SimilarListMatch = Struct.new(
  :company_id,
  :domain,
  :limit,
  keyword_init: true
)

