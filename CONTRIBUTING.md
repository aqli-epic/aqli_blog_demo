# Contributing

Two kinds of contribution: a **story**, or a fix to the **site**. They have different bars.

## Before anything

The editorial rules live on the site itself and are the real specification:

- [`/write/`](https://aqli-epic.github.io/aqli_blog_demo/write/) — the shape of a post, the headline
  test, the seven-line disclosure, the words we do not use.
- [`/formatting/`](https://aqli-epic.github.io/aqli_blog_demo/formatting/) — front matter,
  the exposure ruler, methods boxes, tables, figures, maths.

Read `/write/` once. Keep `/formatting/` open.

## Adding a story

```bash
cp POST-TEMPLATE.md _posts/2026-07-21-my-slug.md
bundle exec jekyll serve --livereload
ruby script/lint-posts.rb
```

Then open a pull request. The homepage, the register at `/blog/`, and the topic counts fill
themselves in from your front matter — no other file needs to be edited to publish.

### The rules CI will enforce

`script/lint-posts.rb` runs on every pull request and checks the mechanical half of the contract:

| Rule | Why |
|---|---|
| `_posts/YYYY-MM-DD-slug.md`, lowercase, date not in the future | Jekyll silently skips future-dated posts — the commonest "my post didn't appear" |
| `title`, `section`, `author`, `standfirst` all present | Every layout reads them; a missing one renders as a blank or a default |
| `section` ∈ Exposure, Policy, Method, Data, Comment | The kicker is a fixed vocabulary, not free text |
| `tags` ⊆ the [topics list](https://aqli-epic.github.io/aqli_blog_demo/topics/) | A tag off the list appears nowhere and does nothing |
| `place` and `pm25` set together, or neither | The ruler needs both; one alone renders an unlabelled mark |
| `pm25` is a plausible bare number in µg/m³ | Catches unit errors before they reach a reader |
| The coefficient is not typed into prose | `{{ site.aqli_coefficient }}` instead, so a revision cannot leave a stale number behind |
| Standfirst reports rather than previews | No "explores", "examines", "looks at", "dives into" |

Run it locally before pushing; it is the same command CI runs.

### The rules CI cannot enforce

A human reviews these, and they are the ones that matter:

1. The headline is a claim, not a topic.
2. The number, with its unit, is in the first or second paragraph.
3. The arithmetic is shown — baseline, target, gap, coefficient, result.
4. There is a section saying what the number **is not**.
5. Two or three specific weaknesses are named.
6. It ends on the decision that sets the number.

## Fixing the site

Local setup:

```bash
bundle install
bundle exec jekyll serve
# http://127.0.0.1:4000/aqli_blog_demo/
```

Requires **Ruby 3.1+** — the `github-pages` gem no longer supports 2.x, and macOS ships an old
system Ruby. `brew install ruby` or a version manager, then reopen your shell.

Before opening a pull request, run what CI runs:

```bash
ruby script/lint-posts.rb
bundle exec jekyll build
bundle exec htmlproofer _site --disable-external --swap-urls "^/aqli_blog_demo:"
```

Two traps in that last command, both of which report the wrong answer rather than an error:

- **Stop `jekyll serve` first.** It regenerates `_site` on a watch loop with `url` overridden to
  `http://localhost:4000`, so every page's canonical tag becomes `http://` and you get one
  "is not an HTTPS link" failure per page. Nothing is actually wrong with the site.
- **Use a UTF-8 locale.** Under `LANG=C`, Nokogiri fails to parse every page — and HTMLProofer
  still exits 0. `Checking 0 internal links` in the output means it checked nothing.

### Two conventions that are not negotiable

**The brand palette and the data palette are separate.** Maroon, gold, blue and green are chrome:
buttons, rules, links, the wordmark. The exposure ramp (`--pm-0` … `--pm-6`) encodes µg/m³ and
belongs only on data marks — the ruler and table swatches. Never style a button with a ramp colour,
and never plot data in maroon.

**Never `text-transform: uppercase` over a value.** It maps `µg/m³` to `MG/M³` and `β` to Greek
capital `Β`, silently changing a unit by a factor of a thousand and renaming the coefficient. Small
monospaced type with letter-spacing gives the same effect without touching the characters.

**Standing figures live in `_config.yml`.** `who_guideline` and `aqli_coefficient` are set once and
referenced everywhere, in prose as much as in layouts. Derive downstream values with Liquid filters
rather than typing the result. Revise the coefficient once and the whole site follows.

## Style

- One stylesheet, no preprocessor, no framework. `assets/css/main.css` is the whole visual system.
- No JavaScript dependency. `assets/js/main.js` is a nav toggle and one scroll reveal; the site is
  fully readable without it.
- No emoji in site chrome or headlines.
- Two-space indentation in HTML, CSS, YAML and Liquid.

## Commit messages

Present tense, lower case, and say what changed rather than which file changed:

```
add register entry for districts without a pm25 figure
fix ruler animation ignoring a revised who guideline
```
