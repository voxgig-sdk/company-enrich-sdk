package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewCompanyEnrichmentEntityFunc func(client *CompanyEnrichSDK, entopts map[string]any) CompanyEnrichEntity

var NewCompanySearchEntityFunc func(client *CompanyEnrichSDK, entopts map[string]any) CompanyEnrichEntity

var NewSimilarEntityFunc func(client *CompanyEnrichSDK, entopts map[string]any) CompanyEnrichEntity

