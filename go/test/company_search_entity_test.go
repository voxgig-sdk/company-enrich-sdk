package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/company-enrich-sdk"
	"github.com/voxgig-sdk/company-enrich-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestCompanySearchEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.CompanySearch(nil)
		if ent == nil {
			t.Fatal("expected non-nil CompanySearchEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := company_searchBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "company_search." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set COMPANYENRICH_TEST_COMPANY_SEARCH_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		companySearchRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.company_search", setup.data)))
		var companySearchRef01Data map[string]any
		if len(companySearchRef01DataRaw) > 0 {
			companySearchRef01Data = core.ToMapAny(companySearchRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = companySearchRef01Data

		// LIST
		companySearchRef01Ent := client.CompanySearch(nil)
		companySearchRef01Match := map[string]any{}

		companySearchRef01ListResult, err := companySearchRef01Ent.List(companySearchRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, companySearchRef01ListOk := companySearchRef01ListResult.([]any)
		if !companySearchRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", companySearchRef01ListResult)
		}

	})
}

func company_searchBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "company_search", "CompanySearchTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read company_search test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse company_search test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"company_search01", "company_search02", "company_search03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("COMPANYENRICH_TEST_COMPANY_SEARCH_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"COMPANYENRICH_TEST_COMPANY_SEARCH_ENTID": idmap,
		"COMPANYENRICH_TEST_LIVE":      "FALSE",
		"COMPANYENRICH_TEST_EXPLAIN":   "FALSE",
		"COMPANYENRICH_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["COMPANYENRICH_TEST_COMPANY_SEARCH_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["COMPANYENRICH_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["COMPANYENRICH_APIKEY"],
			},
			extra,
		})
		client = sdk.NewCompanyEnrichSDK(core.ToMapAny(mergedOpts))
	}

	live := env["COMPANYENRICH_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["COMPANYENRICH_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
