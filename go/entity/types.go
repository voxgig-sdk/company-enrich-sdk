// Typed models for the CompanyEnrich SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// CompanyEnrichment is the typed data model for the company_enrichment entity.
type CompanyEnrichment struct {
	Data *map[string]any `json:"data,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// CompanyEnrichmentLoadMatch mirrors the company_enrichment fields as an all-optional match
// filter (Go analog of Partial<CompanyEnrichment>).
type CompanyEnrichmentLoadMatch struct {
	Data *map[string]any `json:"data,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// CompanySearch is the typed data model for the company_search entity.
type CompanySearch struct {
	CompanyId *string `json:"company_id,omitempty"`
	Domain *string `json:"domain,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *string `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
}

// CompanySearchListMatch mirrors the company_search fields as an all-optional match
// filter (Go analog of Partial<CompanySearch>).
type CompanySearchListMatch struct {
	CompanyId *string `json:"company_id,omitempty"`
	Domain *string `json:"domain,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *string `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
}

// Similar is the typed data model for the similar entity.
type Similar struct {
	CompanyId *string `json:"company_id,omitempty"`
	Domain *string `json:"domain,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *string `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
	SimilarityScore *float64 `json:"similarity_score,omitempty"`
}

// SimilarListMatch mirrors the similar fields as an all-optional match
// filter (Go analog of Partial<Similar>).
type SimilarListMatch struct {
	CompanyId *string `json:"company_id,omitempty"`
	Domain *string `json:"domain,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *string `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
	SimilarityScore *float64 `json:"similarity_score,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
