import { CompanyEnrichmentEntity } from './entity/CompanyEnrichmentEntity';
import { CompanySearchEntity } from './entity/CompanySearchEntity';
import { SimilarEntity } from './entity/SimilarEntity';
export type * from './CompanyEnrichTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { CompanyEnrichEntityBase } from './CompanyEnrichEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class CompanyEnrichSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    CompanyEnrichment(entopts?: Record<string, any>): CompanyEnrichmentEntity;
    CompanySearch(entopts?: Record<string, any>): CompanySearchEntity;
    Similar(entopts?: Record<string, any>): SimilarEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): CompanyEnrichSDK;
    tester(testopts?: any, sdkopts?: any): CompanyEnrichSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof CompanyEnrichSDK;
export { stdutil, config, BaseFeature, CompanyEnrichEntityBase, CompanyEnrichSDK, SDK, };
