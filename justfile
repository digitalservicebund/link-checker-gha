# Test the action on a provided SITEMAP_URL
test SITEMAP_URL:
    act workflow_dispatch -W .github/workflows/test.yml --input sitemap_url="{{SITEMAP_URL}}" --bind

# Preview changelog for unreleased changes
changelog:
    git-cliff --unreleased

