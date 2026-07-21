source "https://rubygems.org"

# Mirrors the exact gem versions GitHub Pages runs.
gem "github-pages", group: :jekyll_plugins

# Ruby 3.0+ removed webrick from the standard library.
# Without this, `bundle exec jekyll serve` dies with:
#   cannot load such file -- webrick
gem "webrick", "~> 1.8"

# Plugins declared here AND in _config.yml.
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
end
