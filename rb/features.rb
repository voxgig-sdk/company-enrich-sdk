# CompanyEnrich SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module CompanyEnrichFeatures
  def self.make_feature(name)
    case name
    when "base"
      CompanyEnrichBaseFeature.new
    when "test"
      CompanyEnrichTestFeature.new
    else
      CompanyEnrichBaseFeature.new
    end
  end
end
