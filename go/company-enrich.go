package voxgigcompanyenrichsdk

import (
	"github.com/voxgig-sdk/company-enrich-sdk/go/core"
	"github.com/voxgig-sdk/company-enrich-sdk/go/entity"
	"github.com/voxgig-sdk/company-enrich-sdk/go/feature"
	_ "github.com/voxgig-sdk/company-enrich-sdk/go/utility"
)

// Type aliases preserve external API.
type CompanyEnrichSDK = core.CompanyEnrichSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type CompanyEnrichEntity = core.CompanyEnrichEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type CompanyEnrichError = core.CompanyEnrichError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCompanyEnrichmentEntityFunc = func(client *core.CompanyEnrichSDK, entopts map[string]any) core.CompanyEnrichEntity {
		return entity.NewCompanyEnrichmentEntity(client, entopts)
	}
	core.NewCompanySearchEntityFunc = func(client *core.CompanyEnrichSDK, entopts map[string]any) core.CompanyEnrichEntity {
		return entity.NewCompanySearchEntity(client, entopts)
	}
	core.NewSimilarEntityFunc = func(client *core.CompanyEnrichSDK, entopts map[string]any) core.CompanyEnrichEntity {
		return entity.NewSimilarEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewCompanyEnrichSDK = core.NewCompanyEnrichSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
