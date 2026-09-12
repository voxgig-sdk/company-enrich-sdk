import { CompanyEnrichEntityBase } from '../CompanyEnrichEntityBase';
import type { CompanyEnrichSDK } from '../CompanyEnrichSDK';
import type { Control } from '../types';
import type { CompanySearch, CompanySearchListMatch } from '../CompanyEnrichTypes';
declare class CompanySearchEntity extends CompanyEnrichEntityBase<CompanySearch> {
    constructor(client: CompanyEnrichSDK, entopts: any);
    make(this: CompanySearchEntity): CompanySearchEntity;
    list(this: any, reqmatch?: CompanySearchListMatch, ctrl?: Control): Promise<CompanySearchEntity[]>;
}
export { CompanySearchEntity };
