-- CompanyEnrich SDK error

local CompanyEnrichError = {}
CompanyEnrichError.__index = CompanyEnrichError


function CompanyEnrichError.new(code, msg, ctx)
  local self = setmetatable({}, CompanyEnrichError)
  self.is_sdk_error = true
  self.sdk = "CompanyEnrich"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function CompanyEnrichError:error()
  return self.msg
end


function CompanyEnrichError:__tostring()
  return self.msg
end


return CompanyEnrichError
