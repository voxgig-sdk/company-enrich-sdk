package = "voxgig-sdk-company-enrich"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/company-enrich-sdk.git"
}
description = {
  summary = "CompanyEnrich SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["company-enrich_sdk"] = "company-enrich_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
