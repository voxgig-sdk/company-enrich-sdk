export interface CompanyEnrichment {
    company_id?: string;
    description?: string;
    domain?: string;
    email?: string;
    employee_count?: number;
    founded_year?: number;
    industry?: string;
    location?: Record<string, any>;
    logo_url?: string;
    name?: string;
    phone?: string;
    revenue?: string;
    social_profiles?: Record<string, any>;
    technologies?: any[];
}
export interface CompanyEnrichmentLoadMatch {
    company_id?: string;
    domain?: string;
    name?: string;
}
export interface CompanySearch {
    company_id?: string;
    domain?: string;
    employee_count?: number;
    industry?: string;
    location?: string;
    logo_url?: string;
    name?: string;
}
export interface CompanySearchListMatch {
    employee_count_max?: number;
    employee_count_min?: number;
    industry?: string;
    limit?: number;
    location?: string;
    offset?: number;
    query?: string;
}
export interface Similar {
    company_id?: string;
    domain?: string;
    employee_count?: number;
    industry?: string;
    location?: string;
    logo_url?: string;
    name?: string;
    similarity_score?: number;
}
export interface SimilarListMatch {
    company_id?: string;
    domain?: string;
    limit?: number;
}
