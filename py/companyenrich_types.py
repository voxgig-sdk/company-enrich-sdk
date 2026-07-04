# Typed models for the CompanyEnrich SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class CompanyEnrichment:
    data: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class CompanyEnrichmentLoadMatch:
    data: Optional[dict] = None
    success: Optional[bool] = None


@dataclass
class CompanySearch:
    company_id: Optional[str] = None
    domain: Optional[str] = None
    employee_count: Optional[int] = None
    industry: Optional[str] = None
    location: Optional[str] = None
    logo_url: Optional[str] = None
    name: Optional[str] = None


@dataclass
class CompanySearchListMatch:
    company_id: Optional[str] = None
    domain: Optional[str] = None
    employee_count: Optional[int] = None
    industry: Optional[str] = None
    location: Optional[str] = None
    logo_url: Optional[str] = None
    name: Optional[str] = None


@dataclass
class Similar:
    company_id: Optional[str] = None
    domain: Optional[str] = None
    employee_count: Optional[int] = None
    industry: Optional[str] = None
    location: Optional[str] = None
    logo_url: Optional[str] = None
    name: Optional[str] = None
    similarity_score: Optional[float] = None


@dataclass
class SimilarListMatch:
    company_id: Optional[str] = None
    domain: Optional[str] = None
    employee_count: Optional[int] = None
    industry: Optional[str] = None
    location: Optional[str] = None
    logo_url: Optional[str] = None
    name: Optional[str] = None
    similarity_score: Optional[float] = None

