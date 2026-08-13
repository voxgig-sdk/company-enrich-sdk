# Typed models for the CompanyEnrich SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class CompanyEnrichment(TypedDict, total=False):
    company_id: str
    description: str
    domain: str
    email: str
    employee_count: int
    founded_year: int
    industry: str
    location: dict
    logo_url: str
    name: str
    phone: str
    revenue: str
    social_profiles: dict
    technologies: list


class CompanyEnrichmentLoadMatch(TypedDict, total=False):
    company_id: str
    description: str
    domain: str
    email: str
    employee_count: int
    founded_year: int
    industry: str
    location: dict
    logo_url: str
    name: str
    phone: str
    revenue: str
    social_profiles: dict
    technologies: list


class CompanySearch(TypedDict, total=False):
    company_id: str
    domain: str
    employee_count: int
    industry: str
    location: str
    logo_url: str
    name: str


class CompanySearchListMatch(TypedDict, total=False):
    company_id: str
    domain: str
    employee_count: int
    industry: str
    location: str
    logo_url: str
    name: str


class Similar(TypedDict, total=False):
    company_id: str
    domain: str
    employee_count: int
    industry: str
    location: str
    logo_url: str
    name: str
    similarity_score: float


class SimilarListMatch(TypedDict, total=False):
    company_id: str
    domain: str
    employee_count: int
    industry: str
    location: str
    logo_url: str
    name: str
    similarity_score: float
