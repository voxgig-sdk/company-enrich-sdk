-- Typed models for the CompanyEnrich SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class CompanyEnrichment
---@field data? table
---@field success? boolean

---@class CompanyEnrichmentLoadMatch
---@field data? table
---@field success? boolean

---@class CompanySearch
---@field company_id? string
---@field domain? string
---@field employee_count? number
---@field industry? string
---@field location? string
---@field logo_url? string
---@field name? string

---@class CompanySearchListMatch
---@field company_id? string
---@field domain? string
---@field employee_count? number
---@field industry? string
---@field location? string
---@field logo_url? string
---@field name? string

---@class Similar
---@field company_id? string
---@field domain? string
---@field employee_count? number
---@field industry? string
---@field location? string
---@field logo_url? string
---@field name? string
---@field similarity_score? number

---@class SimilarListMatch
---@field company_id? string
---@field domain? string
---@field employee_count? number
---@field industry? string
---@field location? string
---@field logo_url? string
---@field name? string
---@field similarity_score? number

local M = {}

return M
