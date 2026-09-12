"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'CompanyEnrich',
        slug: "company-enrich",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://api.companyenrich.com",
        auth: {
            prefix: '',
        },
        headers: {
            "content-type": "application/json"
        },
        entity: {
            company_enrichment: {},
            company_search: {},
            similar: {},
        }
    };
    entity = {
        "company_enrichment": {
            "fields": [
                {
                    "name": "company_id",
                    "short": "Unique identifier for the company",
                    "type": "`$STRING`"
                },
                {
                    "name": "description",
                    "short": "Company description",
                    "type": "`$STRING`"
                },
                {
                    "name": "domain",
                    "short": "Company website domain",
                    "type": "`$STRING`"
                },
                {
                    "name": "email",
                    "short": "Company contact email",
                    "type": "`$STRING`"
                },
                {
                    "name": "employee_count",
                    "short": "Number of employees",
                    "type": "`$INTEGER`"
                },
                {
                    "name": "founded_year",
                    "short": "Year the company was founded",
                    "type": "`$INTEGER`"
                },
                {
                    "name": "industry",
                    "short": "Primary industry",
                    "type": "`$STRING`"
                },
                {
                    "name": "location",
                    "type": "`$OBJECT`"
                },
                {
                    "name": "logo_url",
                    "short": "URL to company logo",
                    "type": "`$STRING`"
                },
                {
                    "name": "name",
                    "short": "Company name",
                    "type": "`$STRING`"
                },
                {
                    "name": "phone",
                    "short": "Company phone number",
                    "type": "`$STRING`"
                },
                {
                    "name": "revenue",
                    "short": "Estimated revenue range",
                    "type": "`$STRING`"
                },
                {
                    "name": "social_profiles",
                    "type": "`$OBJECT`"
                },
                {
                    "name": "technologies",
                    "short": "List of technologies used by the company",
                    "type": "`$ARRAY`"
                }
            ],
            "name": "company_enrichment",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {
                                "query": [
                                    {
                                        "kind": "query",
                                        "name": "company_id",
                                        "orig": "company_id",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": "example.com",
                                        "kind": "query",
                                        "name": "domain",
                                        "orig": "domain",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": "Example Inc",
                                        "kind": "query",
                                        "name": "name",
                                        "orig": "name",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/v1/enrich",
                            "segments": [
                                {
                                    "lit": "v1"
                                },
                                {
                                    "lit": "enrich"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "company_id",
                                    "domain",
                                    "name"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.data`"
                            },
                            "parts": [
                                "v1",
                                "enrich"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "company_search": {
            "fields": [
                {
                    "name": "company_id",
                    "type": "`$STRING`"
                },
                {
                    "name": "domain",
                    "type": "`$STRING`"
                },
                {
                    "name": "employee_count",
                    "type": "`$INTEGER`"
                },
                {
                    "name": "industry",
                    "type": "`$STRING`"
                },
                {
                    "name": "location",
                    "short": "Location summary",
                    "type": "`$STRING`"
                },
                {
                    "name": "logo_url",
                    "type": "`$STRING`"
                },
                {
                    "name": "name",
                    "type": "`$STRING`"
                }
            ],
            "name": "company_search",
            "op": {
                "list": {
                    "input": "data",
                    "name": "list",
                    "points": [
                        {
                            "args": {
                                "query": [
                                    {
                                        "example": 1000,
                                        "kind": "query",
                                        "name": "employee_count_max",
                                        "orig": "employee_count_max",
                                        "type": "`$INTEGER`"
                                    },
                                    {
                                        "example": 100,
                                        "kind": "query",
                                        "name": "employee_count_min",
                                        "orig": "employee_count_min",
                                        "type": "`$INTEGER`"
                                    },
                                    {
                                        "example": "Technology",
                                        "kind": "query",
                                        "name": "industry",
                                        "orig": "industry",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": 20,
                                        "kind": "query",
                                        "name": "limit",
                                        "orig": "limit",
                                        "type": "`$INTEGER`"
                                    },
                                    {
                                        "example": "San Francisco",
                                        "kind": "query",
                                        "name": "location",
                                        "orig": "location",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": 0,
                                        "kind": "query",
                                        "name": "offset",
                                        "orig": "offset",
                                        "type": "`$INTEGER`"
                                    },
                                    {
                                        "example": "technology company",
                                        "kind": "query",
                                        "name": "query",
                                        "orig": "query",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/v1/search",
                            "segments": [
                                {
                                    "lit": "v1"
                                },
                                {
                                    "lit": "search"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "employee_count_max",
                                    "employee_count_min",
                                    "industry",
                                    "limit",
                                    "location",
                                    "offset",
                                    "query"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.data`"
                            },
                            "parts": [
                                "v1",
                                "search"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "similar": {
            "fields": [
                {
                    "name": "company_id",
                    "type": "`$STRING`"
                },
                {
                    "name": "domain",
                    "type": "`$STRING`"
                },
                {
                    "name": "employee_count",
                    "type": "`$INTEGER`"
                },
                {
                    "name": "industry",
                    "type": "`$STRING`"
                },
                {
                    "name": "location",
                    "type": "`$STRING`"
                },
                {
                    "name": "logo_url",
                    "type": "`$STRING`"
                },
                {
                    "name": "name",
                    "type": "`$STRING`"
                },
                {
                    "format": "float",
                    "name": "similarity_score",
                    "short": "Similarity score (0-1)",
                    "type": "`$NUMBER`"
                }
            ],
            "name": "similar",
            "op": {
                "list": {
                    "input": "data",
                    "name": "list",
                    "points": [
                        {
                            "args": {
                                "query": [
                                    {
                                        "kind": "query",
                                        "name": "company_id",
                                        "orig": "company_id",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": "example.com",
                                        "kind": "query",
                                        "name": "domain",
                                        "orig": "domain",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": 10,
                                        "kind": "query",
                                        "name": "limit",
                                        "orig": "limit",
                                        "type": "`$INTEGER`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/v1/similar",
                            "segments": [
                                {
                                    "lit": "v1"
                                },
                                {
                                    "lit": "similar"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "company_id",
                                    "domain",
                                    "limit"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "v1",
                                "similar"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map