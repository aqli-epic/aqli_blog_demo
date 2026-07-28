# Air Quality Life Index — editorial Jekyll site

[![CI](https://github.com/aqli-epic/aqli_blog_demo/actions/workflows/ci.yml/badge.svg)](https://github.com/aqli-epic/aqli_blog_demo/actions/workflows/ci.yml)
[![Deploy](https://github.com/aqli-epic/aqli_blog_demo/actions/workflows/pages.yml/badge.svg)](https://github.com/aqli-epic/aqli_blog_demo/actions/workflows/pages.yml)

A GitHub Pages research blog for AQLI data stories, in the institutional register: UChicago maroon,
Georgia display type, monospaced metadata, bordered cards on a warm paper ground — and one
governing rule:

> **The brand palette and the data palette are different things.**
> Maroon, gold, blue and green are chrome. The exposure ramp (`--pm-0` … `--pm-6`) encodes
> µg/m³ and appears only on data marks — the ruler and table swatches. They are never swapped.

**Live site:** https://aqli-epic.github.io/aqli_blog_demo/

---

## Run it locally

Requires **Ruby 3.1 or newer**. macOS ships an old system Ruby; `brew install ruby` and reopen your
shell, or use a version manager.

```bash
bundle install
bundle exec jekyll serve
# http://127.0.0.1:4000/aqli_blog_demo/
```

Before opening a pull request, run exactly what CI runs:

```bash
ruby script/lint-posts.rb
bundle exec jekyll build
bundle exec htmlproofer _site --disable-external --allow-hash-href \
  --checks Links,Images,Scripts,OpenGraph --swap-urls "^/aqli_blog_demo:"
```

> On a non-UTF-8 locale, Nokogiri fails to parse every page and HTMLProofer still exits 0 — having
> checked nothing. If you see `Checking 0 internal links`, set `LANG=en_US.UTF-8`.

> Stop `jekyll serve` before proofing. It rewrites `_site` continuously with `url` overridden to
> `http://localhost:4000`, so every canonical tag comes out `http://` and HTMLProofer reports one
> "is not an HTTPS link" failure per page. Those failures are an artefact of the running server, not
> a fault in the site. CI never hits this — it builds from a clean checkout with no server.

## Deployment

The site is built and deployed by **GitHub Actions** ([`pages.yml`](.github/workflows/pages.yml)),
not by the legacy branch builder. This needs one repository setting:

> **Settings → Pages → Source: GitHub Actions**

It deliberately does not use the `github-pages` gem. That gem pins Jekyll 3.9 and Liquid 4.0.3, and
Liquid 4.0.3 calls `Object#tainted?`, which Ruby removed in 3.2 — so on any currently supported Ruby
the site cannot be built at all:

```
Liquid Exception: undefined method 'tainted?' for an instance of Integer
```

Building in Actions removes that ceiling, and means what deploys is byte-for-byte what CI checked.
`baseurl` is taken from the Pages deployment itself, so renaming the repository cannot 404 the site.

## Structure

```
_config.yml            site settings + the two standing figures (WHO guideline, β)
_layouts/              default, page, post
_includes/             head, header, footer, ruler, post-card
_posts/                published stories
POST-TEMPLATE.md       copy into _posts/ as YYYY-MM-DD-slug.md
script/lint-posts.rb   the editorial contract, executable
assets/css/main.css    the whole visual system, one file, no preprocessor
assets/js/main.js      nav toggle + client-side story search
assets/data/           aqli_demo.csv
assets/images/         hero and card artwork
```

## How the site works

### Standing figures live in `_config.yml`

`who_guideline: 5` and `aqli_coefficient: 0.098` are set once and referenced as
`{{ site.who_guideline }}` / `{{ site.aqli_coefficient }}` in prose, tables and layouts. Change the
coefficient and every derived figure on the site follows. No stale numbers left behind in copy —
and `script/lint-posts.rb` fails the build if a post types a constant instead of referencing it.

### The exposure ruler

[`_includes/ruler.html`](_includes/ruler.html) is the signature component. It renders the same
0–100+ µg/m³ scale everywhere, banded with the AQLI colour ramp, with the WHO guideline marked:

```liquid
{% include ruler.html value=55 label="Example District A" animate=true %}
{% include ruler.html value=post.pm25 inline=true %}
```

Give a post `place:` and `pm25:` in its front matter and the ruler appears automatically — on the
homepage, in the story register, and at the top of the article, all from one number.

### Post front matter

```yml
---
title: "The years hidden in one district's air"
section: "Exposure"          # kicker — Exposure, Policy, Method, Data or Comment
author: "Your Name"
standfirst: "One district. Fifty-five micrograms..."
place: "Example District A"  # optional — drives the ruler
pm25: 55                     # optional — drives the ruler
tags: [pm2.5, life-expectancy, india]
math: true                   # optional — loads MathJax only where needed
---
```

Reading time is derived from the text; set `reading_time:` only to override it.

## Writing a post

```bash
cp POST-TEMPLATE.md _posts/2026-07-21-my-slug.md
```

Write, then open a pull request. The homepage, the register at `/blog/`, and the topic counts fill
themselves in from the front matter — no page needs to be edited to add a story.

Two contributor articles are the real specification, and they live on the site itself:

- **[`/write/`](https://aqli-epic.github.io/aqli_blog_demo/write/)** — the editorial guide. The
  shape of a post, the headline test, the seven-line disclosure, the words we do not use.
- **[`/formatting/`](https://aqli-epic.github.io/aqli_blog_demo/formatting/)** — the formatting
  reference. Front matter, the ruler, methods boxes, tables, figures, maths.

[`CONTRIBUTING.md`](CONTRIBUTING.md) covers what CI enforces mechanically and the six editorial
rules it cannot.

## Licence

MIT for the site machinery, CC BY 4.0 for the writing and data. See [LICENSE](LICENSE).

Figures in this repository are **illustrative demonstration values**, not published AQLI estimates.
Published estimates are at [aqli.epic.uchicago.edu](https://aqli.epic.uchicago.edu).
