-- CompanyEnrich SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "CompanyEnrich",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.companyenrich.com",
      auth = {
        prefix = "",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["company_enrichment"] = {},
        ["company_search"] = {},
        ["similar"] = {},
      },
    },
    entity = {
      ["company_enrichment"] = {
        ["fields"] = {
          {
            ["name"] = "company_id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "description",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "employee_count",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "founded_year",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "industry",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "location",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "logo_url",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "phone",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "revenue",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "social_profiles",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "technologies",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "company_enrichment",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "company_id",
                      ["orig"] = "company_id",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "example.com",
                      ["kind"] = "query",
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "Example Inc",
                      ["kind"] = "query",
                      ["name"] = "name",
                      ["orig"] = "name",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/enrich",
                ["parts"] = {
                  "v1",
                  "enrich",
                },
                ["select"] = {
                  ["exist"] = {
                    "company_id",
                    "domain",
                    "name",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["company_search"] = {
        ["fields"] = {
          {
            ["name"] = "company_id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "employee_count",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "industry",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "location",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "logo_url",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "company_search",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = 1000,
                      ["kind"] = "query",
                      ["name"] = "employee_count_max",
                      ["orig"] = "employee_count_max",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = 100,
                      ["kind"] = "query",
                      ["name"] = "employee_count_min",
                      ["orig"] = "employee_count_min",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "Technology",
                      ["kind"] = "query",
                      ["name"] = "industry",
                      ["orig"] = "industry",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 20,
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "San Francisco",
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 0,
                      ["kind"] = "query",
                      ["name"] = "offset",
                      ["orig"] = "offset",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "technology company",
                      ["kind"] = "query",
                      ["name"] = "query",
                      ["orig"] = "query",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/search",
                ["parts"] = {
                  "v1",
                  "search",
                },
                ["select"] = {
                  ["exist"] = {
                    "employee_count_max",
                    "employee_count_min",
                    "industry",
                    "limit",
                    "location",
                    "offset",
                    "query",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["similar"] = {
        ["fields"] = {
          {
            ["name"] = "company_id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "employee_count",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "industry",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "location",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "logo_url",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "similarity_score",
            ["type"] = "`$NUMBER`",
          },
        },
        ["name"] = "similar",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "company_id",
                      ["orig"] = "company_id",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "example.com",
                      ["kind"] = "query",
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 10,
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/similar",
                ["parts"] = {
                  "v1",
                  "similar",
                },
                ["select"] = {
                  ["exist"] = {
                    "company_id",
                    "domain",
                    "limit",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
