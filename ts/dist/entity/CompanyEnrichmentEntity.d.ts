import { CompanyEnrichEntityBase } from '../CompanyEnrichEntityBase';
import type { CompanyEnrichSDK } from '../CompanyEnrichSDK';
import type { Control } from '../types';
import type { CompanyEnrichment, CompanyEnrichmentLoadMatch } from '../CompanyEnrichTypes';
declare class CompanyEnrichmentEntity extends CompanyEnrichEntityBase<CompanyEnrichment> {
    constructor(client: CompanyEnrichSDK, entopts: any);
    make(this: CompanyEnrichmentEntity): CompanyEnrichmentEntity;
    load(this: any, reqmatch?: CompanyEnrichmentLoadMatch, ctrl?: Control): Promise<CompanyEnrichmentEntity>;
}
export { CompanyEnrichmentEntity };
