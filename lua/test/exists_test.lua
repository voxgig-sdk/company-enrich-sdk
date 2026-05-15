-- ProjectName SDK exists test

local sdk = require("company-enrich_sdk")

describe("CompanyEnrichSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
