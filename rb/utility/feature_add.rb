# CompanyEnrich SDK utility: feature_add
module CompanyEnrichUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
