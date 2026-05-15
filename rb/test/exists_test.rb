# CompanyEnrich SDK exists test

require "minitest/autorun"
require_relative "../CompanyEnrich_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = CompanyEnrichSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
