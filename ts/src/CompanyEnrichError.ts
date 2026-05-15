
import { Context } from './Context'


class CompanyEnrichError extends Error {

  isCompanyEnrichError = true

  sdk = 'CompanyEnrich'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  CompanyEnrichError
}

