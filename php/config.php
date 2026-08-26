<?php
declare(strict_types=1);

// CompanyEnrich SDK configuration

class CompanyEnrichConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "CompanyEnrich",
                "slug" => "company-enrich",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://api.companyenrich.com",
                "auth" => [
                    "prefix" => "",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "company_enrichment" => [],
                    "company_search" => [],
                    "similar" => [],
                ],
            ],
            "entity" => [
        'company_enrichment' => [
          'fields' => [
            [
              'name' => 'company_id',
              'short' => 'Unique identifier for the company',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'description',
              'short' => 'Company description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'domain',
              'short' => 'Company website domain',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'email',
              'short' => 'Company contact email',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'employee_count',
              'short' => 'Number of employees',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'founded_year',
              'short' => 'Year the company was founded',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'industry',
              'short' => 'Primary industry',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'location',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'logo_url',
              'short' => 'URL to company logo',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'name',
              'short' => 'Company name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'phone',
              'short' => 'Company phone number',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'revenue',
              'short' => 'Estimated revenue range',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'social_profiles',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'technologies',
              'short' => 'List of technologies used by the company',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'company_enrichment',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'company_id',
                        'orig' => 'company_id',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 'example.com',
                        'kind' => 'query',
                        'name' => 'domain',
                        'orig' => 'domain',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 'Example Inc',
                        'kind' => 'query',
                        'name' => 'name',
                        'orig' => 'name',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/enrich',
                  'parts' => [
                    'v1',
                    'enrich',
                  ],
                  'select' => [
                    'exist' => [
                      'company_id',
                      'domain',
                      'name',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.data`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'company_search' => [
          'fields' => [
            [
              'name' => 'company_id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'domain',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'employee_count',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'industry',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'location',
              'short' => 'Location summary',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'logo_url',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'name',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'company_search',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'example' => 1000,
                        'kind' => 'query',
                        'name' => 'employee_count_max',
                        'orig' => 'employee_count_max',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 100,
                        'kind' => 'query',
                        'name' => 'employee_count_min',
                        'orig' => 'employee_count_min',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 'Technology',
                        'kind' => 'query',
                        'name' => 'industry',
                        'orig' => 'industry',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 20,
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 'San Francisco',
                        'kind' => 'query',
                        'name' => 'location',
                        'orig' => 'location',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 0,
                        'kind' => 'query',
                        'name' => 'offset',
                        'orig' => 'offset',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 'technology company',
                        'kind' => 'query',
                        'name' => 'query',
                        'orig' => 'query',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/search',
                  'parts' => [
                    'v1',
                    'search',
                  ],
                  'select' => [
                    'exist' => [
                      'employee_count_max',
                      'employee_count_min',
                      'industry',
                      'limit',
                      'location',
                      'offset',
                      'query',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.data`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'similar' => [
          'fields' => [
            [
              'name' => 'company_id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'domain',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'employee_count',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'industry',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'location',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'logo_url',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'similarity_score',
              'short' => 'Similarity score (0-1)',
              'type' => '`$NUMBER`',
            ],
          ],
          'name' => 'similar',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'company_id',
                        'orig' => 'company_id',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 'example.com',
                        'kind' => 'query',
                        'name' => 'domain',
                        'orig' => 'domain',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 10,
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/similar',
                  'parts' => [
                    'v1',
                    'similar',
                  ],
                  'select' => [
                    'exist' => [
                      'company_id',
                      'domain',
                      'limit',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return CompanyEnrichFeatures::make_feature($name);
    }
}
