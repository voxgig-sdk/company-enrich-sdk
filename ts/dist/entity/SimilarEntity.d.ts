import { CompanyEnrichEntityBase } from '../CompanyEnrichEntityBase';
import type { CompanyEnrichSDK } from '../CompanyEnrichSDK';
import type { Control } from '../types';
import type { Similar, SimilarListMatch } from '../CompanyEnrichTypes';
declare class SimilarEntity extends CompanyEnrichEntityBase<Similar> {
    constructor(client: CompanyEnrichSDK, entopts: any);
    make(this: SimilarEntity): SimilarEntity;
    list(this: any, reqmatch?: SimilarListMatch, ctrl?: Control): Promise<SimilarEntity[]>;
}
export { SimilarEntity };
