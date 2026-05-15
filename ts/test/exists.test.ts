
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { CompanyEnrichSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await CompanyEnrichSDK.test()
    equal(null !== testsdk, true)
  })

})
