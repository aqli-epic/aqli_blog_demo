source "https://rubygems.org"

# Jekyll 4, built and deployed by GitHub Actions (.github/workflows/pages.yml).
#
# This deliberately does NOT use the `github-pages` gem. That gem pins Jekyll 3.9
# and Liquid 4.0.3, and Liquid 4.0.3 calls Object#tainted?, which Ruby removed in
# 3.2. The practical effect is that on any currently supported Ruby the site
# cannot be built at all:
#
#   Liquid Exception: undefined method 'tainted?' for an instance of Integer
#
# Building with Actions instead of the legacy branch builder costs one repository
# setting (Settings → Pages → Source: GitHub Actions) and removes the version
# ceiling entirely.
gem "jekyll", "~> 4.4"

# Ruby 3.0+ removed webrick from the standard library. Without it,
# `bundle exec jekyll serve` dies with `cannot load such file -- webrick`.
gem "webrick", "~> 1.8"

# _config.yml sets `input: GFM`. Jekyll 4 does not ship that parser.
gem "kramdown-parser-gfm", "~> 1.1"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-sitemap", "~> 1.4"
end

# Link and markup checking. Not needed to build or serve the site — only to run
# the same check CI runs:
#   bundle exec htmlproofer _site --disable-external --swap-urls "^/aqli_blog_demo:"
group :test do
  gem "html-proofer", "~> 5.0"
end
