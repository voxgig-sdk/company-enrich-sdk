# CompanyEnrich SDK feature factory

from feature.base_feature import CompanyEnrichBaseFeature
from feature.test_feature import CompanyEnrichTestFeature


def _make_feature(name):
    features = {
        "base": lambda: CompanyEnrichBaseFeature(),
        "test": lambda: CompanyEnrichTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
