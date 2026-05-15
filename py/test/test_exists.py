# ProjectName SDK exists test

import pytest
from companyenrich_sdk import CompanyEnrichSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = CompanyEnrichSDK.test(None, None)
        assert testsdk is not None
