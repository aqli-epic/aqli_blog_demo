# Air Quality Life Index — editorial Jekyll site

A newsroom-style GitHub Pages blog for AQLI data stories. Serif headlines, hairline rules,
a strict typographic hierarchy — and one governing rule:

> **The interface is black, white and grey. Colour is reserved for data.**
> If something on this site is coloured, it is measuring something.

## Publish on GitHub Pages

1. Create a repository — say `aqli-blog`.
2. Upload everything in this folder to the repository root.
3. Open `_config.yml` and set the two lines that must match the repo:
   ```yml
   url:     "https://YOUR-USERNAME.github.io"
   baseurl: "/aqli-blog"     # exact repo name, hyphens and underscores included
   ```
   Get `baseurl` wrong and every link, stylesheet and image on the site 404s. It is the single
   most common way a GitHub Pages site breaks.
4. **Settings → Pages** → Source: *Deploy from a branch* → Branch: `main` → Folder: `/ (root)`.
5. The site appears at `https://YOUR-USERNAME.github.io/aqli-blog/`.

## Preview locally

```bash
bundle install
bundle exec jekyll serve
# http://127.0.0.1:4000/aqli-blog/
```

## Structure

```
_config.yml            site settings + the two standing figures (WHO guideline, β)
_layouts/              default, home, page, post
_includes/             head, masthead, footer, ruler, story
_posts/                empty — the first story goes here
POST-TEMPLATE.md       copy this into _posts/ as YYYY-MM-DD-slug.md
assets/css/main.css    the whole visual system, one file, no preprocessor
assets/js/main.js      nav toggle + one scroll reveal, reduced-motion aware
assets/data/           aqli_demo.csv
```

### The exposure ruler

`_includes/ruler.html` is the signature component. It renders the same 0–100+ µg/m³ scale
everywhere, banded with the AQLI colour ramp, with the WHO guideline marked:

```liquid
{% include ruler.html value=55 label="Example District A" animate=true %}
{% include ruler.html value=post.pm25 inline=true %}
```

Give a post `place:` and `pm25:` in its front matter and the ruler appears automatically — on the
homepage, in the story register, and at the top of the article, all from one number.

### Standing figures live in `_config.yml`

`who_guideline: 5` and `aqli_coefficient: 0.098` are set once and referenced as
`{{ site.who_guideline }}` / `{{ site.aqli_coefficient }}` in prose, tables and layouts. Change the
coefficient and every derived figure on the site updates. No stale numbers left behind in copy.

### Writing a post

The site ships with **no posts**. It is a landing page with the space held open, and two contributor
articles that say how to fill it:

- **`/write/` — the editorial guide.** The shape of a post, the headline test, the seven-line
  disclosure, the words we do not use.
- **`/formatting/` — the formatting reference.** Front matter, the ruler, methods boxes, tables,
  figures, maths, and the pre-flight checklist.

To publish: copy `POST-TEMPLATE.md` into `_posts/`, rename it `YYYY-MM-DD-slug.md`, write, open a PR.
The homepage, the register at `/blog/`, and the topic counts all fill themselves in from the front
matter — no page needs to be edited to add a story.

### Post front matter

```yml
---
title: "The years hidden in one district's air"
section: "Exposure"          # kicker
author: "Hrishikesh Chandra Gautam"
standfirst: "One district. Fifty-five micrograms..."
place: "Example District A"  # optional — drives the ruler
pm25: 55                     # optional — drives the ruler
tags: [pm2.5, life-expectancy, india]
math: true                   # optional — loads MathJax only where needed
---
```

---

## Errors found in the original site

### Build-breaking

1. **`index - Copy.md`** — a duplicate homepage with a *space in the filename*. Jekyll builds it to
   `/index%20-%20Copy.html`; it also drifted out of sync with `index.md` (different final section).
   Deleted.
2. **`_gitignore` should be `.gitignore`** — with no leading dot it ignores nothing, so `_site/`
   and `.jekyll-cache/` get committed.
3. **No `webrick` in the Gemfile** — Ruby 3.0 removed it from the standard library, so
   `bundle exec jekyll serve` dies with `cannot load such file -- webrick`. Added.
4. **No layouts or includes existed for what the pages reference.** Every page declares
   `layout: home | page | post` and `blog.md` calls `{% include post-card.html %}`. Without those
   files, and with no `theme:` in `_config.yml`, the build fails with *"Could not find layout"*.
   All layouts and includes are now supplied.

### Configuration

5. **`baseurl: "/aqli_blog_demo"` contradicts the README**, which tells you to use `/aqli-blog` and
   previews at `http://127.0.0.1:4000/aqli-blog/`. One of the two is wrong, and whichever it is,
   every `relative_url` on the site breaks. Now stated once, with a warning.
6. **`collections: posts: output: true`** — `posts` is a built-in collection. Redeclaring it is
   redundant and can interfere with `defaults` scoping. Removed.
7. **`defaults` scoped to `path: ""` with no `type`** applied `layout: page` to *every* document,
   including posts, and was rescued only by the second rule. Now scoped by type.
8. **No `plugins:`** — no RSS feed, no `<title>`/Open Graph/canonical tags, no sitemap. Added
   `jekyll-feed`, `jekyll-seo-tag`, `jekyll-sitemap` (all whitelisted on GitHub Pages).

### Content

9. **The maths in `methods.md` never rendered.** It used `\[ ... \]` and `\( ... \)`, but kramdown
   expects `$$ ... $$`, and no MathJax or KaTeX was loaded anywhere. Readers saw literal
   backslashes. Fixed the delimiters, set `math_engine: mathjax`, and MathJax now loads only on
   pages with `math: true`.
10. **`data.md` names `assets/data/aqli_demo.csv` but never links to it** — and the file wasn't in
    the repo. It now exists and is downloadable.
11. **`about.md` used trailing `<br>` inside a paragraph** for the author list. It's a list; it's
    now marked up as one.
12. **Naming drifts three ways** — "Air Quality Life Index Blog" (`_config.yml`), "AQLI blog"
    (README), "AQLI Blog Demo" (homepage eyebrow). Settled on one.
13. **The README advertised "two demo blog posts"** that did not exist, so `site.posts` was empty and
    `/blog/` rendered as a bare heading with nothing under it. There are still no posts — by design —
    but every list now has a real empty state that says what will appear there and how to add it.

### Design

14. **Emoji as visual identity** (📊 🏛️ 🔬) on a public-health data site. Removed.
15. **`01 / 02 / 03` numbered cards** implied a sequence where none existed — the three sections
    can be read in any order. Numbering now appears only where order carries meaning (the
    seven-step reporting checklist).
16. **The palette was decorative.** A "pollution-to-clean-air" ramp was used for card backgrounds
    and buttons — spending the exact colour vocabulary that should be reserved for encoding
    exposure. The ramp is now used *only* on data marks; the chrome is monochrome.
17. **No `lang` attribute, no skip link, no focus styles, no `prefers-reduced-motion` handling,
    no favicon.** All added.
