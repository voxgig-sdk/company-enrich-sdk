// Typed models for the CompanyEnrich SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/company-enrich-sdk/go/core"
)

// CompanyEnrichment is the typed data model for the company_enrichment entity.
type CompanyEnrichment struct {
	CompanyId *string `json:"company_id,omitempty"`
	Description *string `json:"description,omitempty"`
	Domain *string `json:"domain,omitempty"`
	Email *string `json:"email,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	FoundedYear *int `json:"founded_year,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
	Phone *string `json:"phone,omitempty"`
	Revenue *string `json:"revenue,omitempty"`
	SocialProfiles *map[string]any `json:"social_profiles,omitempty"`
	Technologies *[]any `json:"technologies,omitempty"`
}

// CompanyEnrichmentLoadMatch is the typed request payload for CompanyEnrichment.LoadTyped.
type CompanyEnrichmentLoadMatch struct {
	CompanyId *string `json:"company_id,omitempty"`
	Description *string `json:"description,omitempty"`
	Domain *string `json:"domain,omitempty"`
	Email *string `json:"email,omitempty"`
	EmployeeCount *int `json:"employee_count,omitempty"`
	FoundedYear *int `json:"founded_year,omitempty"`
	Industry *string `json:"industry,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	LogoUrl *string `json:"logo_url,omitempty"`
	Name *string `json:"name,omitempty"`
	Phone *string `json:"phone,omitempty"`
	Revenue *string `json:"revenue,omitempty"`
	SocialProfiles *map[string]any `json:"social_profiles,omitempty"`
	Technologies *[]any `json:"technologies,omitempty"`
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

// CompanySearchListMatch is the typed request payload for CompanySearch.ListTyped.
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

// SimilarListMatch is the typed request payload for Similar.ListTyped.
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

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
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

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
