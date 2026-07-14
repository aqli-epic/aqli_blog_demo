---
layout: page
title: "Formatting reference"
section: "Contributor docs"
permalink: /formatting/
standfirst: "Front matter, components, and markup. Copy from here; do not invent new patterns."
math: true
wide: true
---

<div class="prose" markdown="1">

Every post is a Markdown file in `_posts/`, named `YYYY-MM-DD-slug.md`. The date in the filename is
the publication date — Jekyll will not build a post dated in the future. Copy `POST-TEMPLATE.md`
from the repository root and start there.

## Front matter

```yaml
---
title: "The years hidden in one district's air"
section: "Exposure"            # the kicker above the headline
author: "Your Name"
standfirst: "One district. Fifty-five micrograms in every cubic metre of air."
place: "Example District A"    # optional — with pm25, renders the ruler
pm25: 55                       # optional — annual mean PM2.5, µg/m³
tags: [pm2.5, life-expectancy, india]
reading_time: 4                # optional
math: true                     # optional — loads MathJax on this page only
---
```

`section` is one of: **Exposure**, **Policy**, **Method**, **Data**, **Comment**. Do not invent a
sixth without changing this line.

`tags` must come from the fixed list on the [topics page]({{ '/topics/' | relative_url }}):
`pm2.5`, `life-expectancy`, `india`, `policy`, `data`, `global`. A tag that is not on that list
appears nowhere and does nothing.

Add `place` and `pm25` and three things happen automatically, from that one number: the ruler
appears at the top of your article, your story card carries a compact ruler, and your entry in the
register is placed on the scale.

## Standing figures

Never type the WHO guideline or the coefficient. Reference them:

```liquid
{% raw %}{{ site.who_guideline }}      → 5      (µg/m³)
{{ site.aqli_coefficient }}   → 0.098  (years per µg/m³){% endraw %}
```

Derive everything downstream of them rather than typing the result:

```liquid
{% raw %}{{ page.pm25 | minus: site.who_guideline }} µg/m³ above the guideline

{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years{% endraw %}
```

Revise β once, in `_config.yml`, and every post on the site follows. Type it into prose and it is
wrong forever.

</div>

## The exposure ruler

The signature component. It renders the same 0–100+ µg/m³ scale everywhere, with the WHO guideline
marked, so two stories about two places can be read against each other.

<div class="figure-wide">
  <p class="kicker">Full ruler — used at the top of an article</p>
  <div class="lead__stat">
    <b>55</b>
    <span>µg/m³ annual mean PM<sub>2.5</sub> in Example District A</span>
  </div>
  {% include ruler.html value=55 label="Example District A" %}
</div>

<div class="prose" markdown="1">

```liquid
{% raw %}{% include ruler.html value=55 label="Example District A" animate=true %}{% endraw %}
```

| Parameter | Type | What it does |
|---|---|---|
| `value` | number, required | Annual mean PM₂.₅ in µg/m³. Values above 100 clamp to the end of the scale. |
| `label` | string | Text above the mark. Defaults to the value. |
| `inline` | `true` | Compact bar for cards and lists. Hides labels and the axis. |
| `animate` | `true` | The mark slides out from the guideline on load. Use once per page, at most. |

You will rarely call it by hand. Set `pm25` in the front matter and the layouts call it for you.

## The methods box

Every post reporting a place-level figure ends with one. `markdown="1"` is not optional — without
it, kramdown leaves the contents as raw text.

</div>

<div class="prose" markdown="1">

```markdown
<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: 2023.

Target: WHO annual guideline, {% raw %}{{ site.who_guideline }}{% endraw %} µg/m³.

Geographic unit: district.

Weighting: population-weighted district mean.

Source: <name the product, resolution and vintage>.

Coefficient: β = {% raw %}{{ site.aqli_coefficient }}{% endraw %} years per µg/m³, applied linearly.

Uncertainty: not propagated. This post reports a point estimate.
</div>
```

Blank lines between the seven items are load-bearing. Without them kramdown collapses the list into
a single run-on paragraph.

Which renders as:

</div>

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: 2023.

Target: WHO annual guideline, {{ site.who_guideline }} µg/m³.

Geographic unit: district.

Weighting: population-weighted district mean.

Source: name the product, resolution and vintage.

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³, applied linearly.

Uncertainty: not propagated. This post reports a point estimate.
</div>

<div class="prose" markdown="1">

## Tables

Plain Markdown tables are styled automatically: uppercase sans headers, monospaced tabular numerals,
right-aligned figures, hairline rules. First column left, everything else right — that is handled for
you, so do not fight it with alignment colons.

To put an exposure value on the ramp, hand-write the row and add `data-pm` (`0`–`6`, matching the six
bands of the ruler):

```html
<td data-pm="4">Example District A</td>
```

| Band | Range, µg/m³ | Use `data-pm` |
|---|---|---|
| 0 | 0–5 | at or under the guideline |
| 1 | 5–15 | |
| 2 | 15–30 | |
| 3 | 30–50 | |
| 4 | 50–75 | |
| 5 | 75–100 | |
| 6 | 100+ | |

Any table wider than the column goes inside `<div class="table-scroll">…</div>` so it scrolls on a
phone rather than breaking the grid.

## Figures and charts

```html
<figure>
  <img src="{% raw %}{{ '/assets/img/district-trend.svg' | relative_url }}{% endraw %}"
       alt="Annual mean PM2.5 in Example District A, 2000 to 2023, falling from 61 to 55 µg/m³.">
  <figcaption>
    Annual mean PM<sub>2.5</sub>, population-weighted. Source and vintage go here, not in the body text.
  </figcaption>
</figure>
```

Three rules. **Static SVG or PNG**, committed to `assets/img/` — the page must render with JavaScript
off. **Alt text states the finding**, not the chart type; "a line chart showing data" tells a screen
reader nothing. **The caption carries the source**, every time.

For a chart that needs room, wrap it in `<div class="figure-wide">` to break out of the text column.

## Callout for a wide data block

```html
<div class="figure-wide">
  … table, chart, or ruler …
</div>
```

## Maths

Set `math: true` in the front matter — MathJax loads only where it is declared. Use `$$` delimiters;
`\[ … \]` will render as literal backslashes.

```latex
$$
\Delta LE = \left( PM_{2.5}^{\text{baseline}} - PM_{2.5}^{\text{target}} \right) \times \beta
$$
```

$$
\Delta LE = \left( PM_{2.5}^{\text{baseline}} - PM_{2.5}^{\text{target}} \right) \times \beta
$$

## Quotes, code, links

```markdown
> A pull quote is for a claim someone made, not for a sentence you liked.

`inline code` for filenames, columns and units in running text.

[Link text that describes the destination](https://example.org) — never "click here",
never a bare URL.
```

## The drop cap

The first paragraph of every article gets one automatically. Which means: **do not open with a
one-word sentence, a number, or a quotation mark.** "55 µg/m³ is not a number that announces itself"
opens with a giant floating 5. Start with a word.

## Checklist before the pull request

1. Filename is `YYYY-MM-DD-slug.md` and the date is today or earlier.
2. `title`, `section`, `author`, `standfirst`, `tags` are filled.
3. `place` and `pm25` are set if the post is about a place.
4. Standing figures are Liquid references, not typed numbers.
5. The methods box has seven items, separated by blank lines.
6. Every figure has alt text and a source line.
7. `bundle exec jekyll serve` builds with no warnings, and you have looked at the page.

</div>
