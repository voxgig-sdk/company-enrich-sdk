// Typed models for the CompanyEnrich SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface CompanyEnrichment {
  company_id?: string
  description?: string
  domain?: string
  email?: string
  employee_count?: number
  founded_year?: number
  industry?: string
  location?: Record<string, any>
  logo_url?: string
  name?: string
  phone?: string
  revenue?: string
  social_profiles?: Record<string, any>
  technologies?: any[]
}

export interface CompanyEnrichmentLoadMatch {
  company_id?: string
  description?: string
  domain?: string
  email?: string
  employee_count?: number
  founded_year?: number
  industry?: string
  location?: Record<string, any>
  logo_url?: string
  name?: string
  phone?: string
  revenue?: string
  social_profiles?: Record<string, any>
  technologies?: any[]
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

