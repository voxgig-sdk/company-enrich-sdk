package core

type CompanyEnrichError struct {
	IsCompanyEnrichError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewCompanyEnrichError(code string, msg string, ctx *Context) *CompanyEnrichError {
	return &CompanyEnrichError{
		IsCompanyEnrichError: true,
		Sdk:              "CompanyEnrich",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *CompanyEnrichError) Error() string {
	return e.Msg
}
