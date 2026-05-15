# CompanyEnrich SDK utility: make_context
require_relative '../core/context'
module CompanyEnrichUtilities
  MakeContext = ->(ctxmap, basectx) {
    CompanyEnrichContext.new(ctxmap, basectx)
  }
end
