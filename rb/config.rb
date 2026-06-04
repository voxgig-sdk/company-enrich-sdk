# CompanyEnrich SDK configuration

module CompanyEnrichConfig
  def self.make_config
    {
      "main" => {
        "name" => "CompanyEnrich",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.companyenrich.com",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "company_enrichment" => {},
          "company_search" => {},
          "similar" => {},
        },
      },
      "entity" => {
        "company_enrichment" => {
          "fields" => [
            {
              "name" => "data",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 1,
            },
          ],
          "name" => "company_enrichment",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "company_id",
                        "orig" => "company_id",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "example.com",
                        "kind" => "query",
                        "name" => "domain",
                        "orig" => "domain",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "Example Inc",
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/enrich",
                  "parts" => [
                    "v1",
                    "enrich",
                  ],
                  "select" => {
                    "exist" => [
                      "company_id",
                      "domain",
                      "name",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "company_search" => {
          "fields" => [
            {
              "name" => "company_id",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "domain",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "employee_count",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "industry",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "location",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "logo_url",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 6,
            },
          ],
          "name" => "company_search",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => 1000,
                        "kind" => "query",
                        "name" => "employee_count_max",
                        "orig" => "employee_count_max",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                      {
                        "example" => 100,
                        "kind" => "query",
                        "name" => "employee_count_min",
                        "orig" => "employee_count_min",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                      {
                        "example" => "Technology",
                        "kind" => "query",
                        "name" => "industry",
                        "orig" => "industry",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => 20,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                      {
                        "example" => "San Francisco",
                        "kind" => "query",
                        "name" => "location",
                        "orig" => "location",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "offset",
                        "orig" => "offset",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                      {
                        "example" => "technology company",
                        "kind" => "query",
                        "name" => "query",
                        "orig" => "query",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/search",
                  "parts" => [
                    "v1",
                    "search",
                  ],
                  "select" => {
                    "exist" => [
                      "employee_count_max",
                      "employee_count_min",
                      "industry",
                      "limit",
                      "location",
                      "offset",
                      "query",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "similar" => {
          "fields" => [
            {
              "name" => "company_id",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "domain",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "employee_count",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "industry",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "location",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "logo_url",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "similarity_score",
              "req" => false,
              "type" => "`$NUMBER`",
              "active" => true,
              "index$" => 7,
            },
          ],
          "name" => "similar",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "company_id",
                        "orig" => "company_id",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "example.com",
                        "kind" => "query",
                        "name" => "domain",
                        "orig" => "domain",
                        "reqd" => false,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/similar",
                  "parts" => [
                    "v1",
                    "similar",
                  ],
                  "select" => {
                    "exist" => [
                      "company_id",
                      "domain",
                      "limit",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    CompanyEnrichFeatures.make_feature(name)
  end
end
