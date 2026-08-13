# CompanyEnrich SDK utility: make_context

from companyenrich_sdk.core.context import CompanyEnrichContext


def make_context_util(ctxmap, basectx):
    return CompanyEnrichContext(ctxmap, basectx)
