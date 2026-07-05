// Typed models for the CompanyEnrich SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface CompanyEnrichment {
  data?: Record<string, any>
  success?: boolean
}

export interface CompanyEnrichmentLoadMatch {
  data?: Record<string, any>
  success?: boolean
}

export interface CompanySearch {
  company_id?: string
  domain?: string
  employee_count?: number
  industry?: string
  location?: string
  logo_url?: string
  name?: string
}

export interface CompanySearchListMatch {
  company_id?: string
  domain?: string
  employee_count?: number
  industry?: string
  location?: string
  logo_url?: string
  name?: string
}

export interface Similar {
  company_id?: string
  domain?: string
  employee_count?: number
  industry?: string
  location?: string
  logo_url?: string
  name?: string
  similarity_score?: number
}

export interface SimilarListMatch {
  company_id?: string
  domain?: string
  employee_count?: number
  industry?: string
  location?: string
  logo_url?: string
  name?: string
  similarity_score?: number
}

