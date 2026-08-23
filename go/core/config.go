package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "CompanyEnrich",
			"slug": "company-enrich",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.companyenrich.com",
			"auth": map[string]any{
				"prefix": "",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"company_enrichment": map[string]any{},
				"company_search": map[string]any{},
				"similar": map[string]any{},
			},
		},
		"entity": map[string]any{
			"company_enrichment": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "company_id",
						"short": "Unique identifier for the company",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "description",
						"short": "Company description",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "domain",
						"short": "Company website domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "email",
						"short": "Company contact email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "employee_count",
						"short": "Number of employees",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "founded_year",
						"short": "Year the company was founded",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "industry",
						"short": "Primary industry",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "logo_url",
						"short": "URL to company logo",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "Company name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "phone",
						"short": "Company phone number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "revenue",
						"short": "Estimated revenue range",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "social_profiles",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "technologies",
						"short": "List of technologies used by the company",
						"type": "`$ARRAY`",
					},
				},
				"name": "company_enrichment",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "company_id",
											"orig": "company_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "example.com",
											"kind": "query",
											"name": "domain",
											"orig": "domain",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "Example Inc",
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/enrich",
								"parts": []any{
									"v1",
									"enrich",
								},
								"select": map[string]any{
									"exist": []any{
										"company_id",
										"domain",
										"name",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"company_search": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "company_id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "employee_count",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "industry",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"short": "Location summary",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "logo_url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
				},
				"name": "company_search",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 1000,
											"kind": "query",
											"name": "employee_count_max",
											"orig": "employee_count_max",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "employee_count_min",
											"orig": "employee_count_min",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "Technology",
											"kind": "query",
											"name": "industry",
											"orig": "industry",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 20,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "San Francisco",
											"kind": "query",
											"name": "location",
											"orig": "location",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "offset",
											"orig": "offset",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "technology company",
											"kind": "query",
											"name": "query",
											"orig": "query",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/search",
								"parts": []any{
									"v1",
									"search",
								},
								"select": map[string]any{
									"exist": []any{
										"employee_count_max",
										"employee_count_min",
										"industry",
										"limit",
										"location",
										"offset",
										"query",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"similar": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "company_id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "employee_count",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "industry",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "logo_url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "similarity_score",
						"short": "Similarity score (0-1)",
						"type": "`$NUMBER`",
					},
				},
				"name": "similar",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "company_id",
											"orig": "company_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "example.com",
											"kind": "query",
											"name": "domain",
											"orig": "domain",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/similar",
								"parts": []any{
									"v1",
									"similar",
								},
								"select": map[string]any{
									"exist": []any{
										"company_id",
										"domain",
										"limit",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
