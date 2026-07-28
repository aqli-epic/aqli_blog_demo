# Changelog

## Unreleased — institutional design system

The visual layer was replaced with the AQLI research-blog design (UChicago maroon, Georgia display,
monospaced metadata, bordered cards, sticky header). All content, the exposure ruler, the standing
figures and the engineering work below were kept.

**Changed**

- `assets/css/main.css` is now the institutional system plus an appended block of AQLI data
  components: the exposure ruler, the ramp swatches, data tables, the methods box and the equation
  band. The design system shipped no table styles at all, and this site is largely tables.
- Layouts rebuilt on the new structure — `.shell`, `.hero`, `.post-card`, `.article-hero` with a
  sticky metadata rail. Post front matter is unchanged (`standfirst`, `section`, `place`, `pm25`),
  so `/write/`, `/formatting/` and the linter still describe the site accurately.
- On a story about a place, the article hero's second column carries that place's exposure panel
  instead of a decorative image, and the sticky rail carries place, concentration and years at stake.
- Added client-side story search. It is hidden until the `js` class is set, so a reader without
  JavaScript is never shown a control that cannot do anything.
- Dark mode was dropped — the design it belonged to is gone, and the new palette needs its own.

**Fixed**

- `overflow: hidden` on the ruler track (added for the border radius) clipped the marks and removed
  the WHO and value labels entirely. Corners are rounded on the end bands instead.
- `text-transform: uppercase` on mark labels rendered **µg/m³ as MG/M³** — a thousand-fold unit
  error — and on table headers rendered **β as Greek capital Β**, renaming the coefficient. Both
  now use small monospaced type with letter-spacing instead.
- Topic rows are `<a>` elements inside `.prose`, so `.prose a { font-weight: 650 }` was bolding
  every description and count.

---

## Unreleased — repository hardening

The site itself was already sound. This pass made the rules it describes executable, and made the
repository legible to someone arriving at it cold.

**Added**

- `.github/workflows/ci.yml` — every push and pull request now lints posts, builds the site, and
  resolves every internal link, image and stylesheet with HTMLProofer. `baseurl` is read out of
  `_config.yml` at check time rather than hardcoded, so the two cannot drift apart.
- `script/lint-posts.rb` — the editorial contract in `/write/` and `/formatting/` was written down
  but not enforced. It now is: filename shape, future dates, required front matter, the fixed
  `section` vocabulary, the fixed tag list, `place`/`pm25` pairing, implausible units, hedging verbs
  in the standfirst, and constants typed into prose instead of referenced. Each error names the
  documentation page it comes from.
- `LICENSE` — MIT for the site machinery, CC BY 4.0 for the writing and data.
- `CONTRIBUTING.md` — local setup, what CI enforces, and the six editorial rules it cannot.
- Issue forms for story pitches and site problems; a pull request template carrying the seven-line
  disclosure as a table.
- `.github/dependabot.yml`, `.editorconfig`, `robots.txt`.
- Three demonstration posts, so the homepage, register, topic counts and exposure ruler render
  populated rather than empty.
- Dark mode, keyed to `prefers-color-scheme`, with the exposure ramp lifted for contrast against a
  dark ground rather than recoloured — each band keeps its hue and its order.
- Reading time derived from word count instead of typed into front matter by hand.
- An Open Graph card image, so shared links render as something other than a bare URL.
- Print styles that force the light palette (a reader in dark mode was printing a near-black page),
  expand link URLs, and keep figures and methods boxes off page breaks.

**Changed — typography**

The site was set like a magazine and read like one. Measured against the page rather than guessed
at, the numbers were unambiguous: a 50px headline over a 19px body at 1.68 leading, giving a
57-character measure. That ratio is a feature spread, not a research publication.

- **Typeface.** Newsreader → **Source Serif 4**, Libre Franklin → **Source Sans 3**. A metric-
  compatible superfamily drawn for long-form scholarly reading, with optical sizing and tabular
  figures. Newsreader is a news face and was doing exactly what it was designed to do.
- **Scale.** Article headline 50px → 34px; homepage lead 4rem → 2.75rem; section headings 24px →
  19px. The display type no longer overpowers the argument underneath it.
- **Measure and leading.** Body 19px/1.68 → 17px/1.62, moving the measure from 57 to **70
  characters** — the range long-form reading research settles on.
- **Dropped the drop cap.** A magazine device. The opening paragraph is set one step larger instead.
- **The standfirst reads as an abstract** — upright rather than italic, on the body serif.
- **Sections, figures and tables number themselves** via CSS counters (`1.`, `Figure 1.`,
  `Table 1.`), which is the clearest signal that a piece is meant to be cited and referred back to.

**Fixed**

- The ruler's arrival animation started from a hardcoded `left: 5%`. `who_guideline` is
  configurable; revise it and the mark animated from the wrong place. It now reads a custom
  property set from the same Liquid value as the guideline mark itself.
- `timezone` was unset, so post dates rendered against the build machine's zone — a post could
  appear to publish a day early or late depending on where it was built.
- `_posts/` was absent from the repository (git cannot track an empty directory), so a fresh clone
  had nowhere to put a post.

**Changed**

- The README's closing audit of a previous revision moved here, out of the front door.

---

## Previous revision — corrections to the original site

Kept for the record. These were fixed before this repository's first commit.

### Build-breaking

1. **`index - Copy.md`** — a duplicate homepage with a *space in the filename*. Jekyll builds it to
   `/index%20-%20Copy.html`; it had also drifted out of sync with `index.md`. Deleted.
2. **`_gitignore` should be `.gitignore`** — with no leading dot it ignores nothing, so `_site/`
   and `.jekyll-cache/` get committed.
3. **No `webrick` in the Gemfile** — Ruby 3.0 removed it from the standard library, so
   `bundle exec jekyll serve` dies with `cannot load such file -- webrick`. Added.
4. **No layouts or includes existed for what the pages reference.** Every page declares
   `layout: home | page | post` and `blog.md` called `{% include post-card.html %}`. Without those
   files, and with no `theme:` in `_config.yml`, the build fails with *"Could not find layout"*.

### Configuration

5. **`baseurl` contradicted the README**, which told you to use `/aqli-blog` while the config said
   `/aqli_blog_demo`. Whichever is wrong, every `relative_url` on the site breaks.
6. **`collections: posts: output: true`** — `posts` is a built-in collection. Redeclaring it is
   redundant and can interfere with `defaults` scoping. Removed.
7. **`defaults` scoped to `path: ""` with no `type`** applied `layout: page` to *every* document,
   including posts, and was rescued only by the second rule. Now scoped by type.
8. **No `plugins:`** — no RSS feed, no `<title>`/Open Graph/canonical tags, no sitemap. Added
   `jekyll-feed`, `jekyll-seo-tag`, `jekyll-sitemap`.

### Content

9. **The maths in `methods.md` never rendered.** It used `\[ … \]` and `\( … \)`, but kramdown
   expects `$$ … $$`, and no MathJax was loaded anywhere. Readers saw literal backslashes.
10. **`data.md` named `assets/data/aqli_demo.csv` but never linked to it** — and the file was not in
    the repository.
11. **`about.md` used trailing `<br>` inside a paragraph** for the author list. It is a list.
12. **Naming drifted three ways** — "Air Quality Life Index Blog", "AQLI blog", "AQLI Blog Demo".
13. **The README advertised two demo posts** that did not exist, so `/blog/` rendered as a bare
    heading with nothing under it.

### Design

14. **Emoji as visual identity** (📊 🏛️ 🔬) on a public-health data site. Removed.
15. **`01 / 02 / 03` numbered cards** implied a sequence where none existed. Numbering now appears
    only where order carries meaning.
16. **The palette was decorative.** The pollution-to-clean-air ramp was used for card backgrounds
    and buttons, spending the exact colour vocabulary that should encode exposure. The ramp is now
    used only on data marks.
17. **No `lang` attribute, no skip link, no focus styles, no `prefers-reduced-motion` handling, no
    favicon.** All added.
