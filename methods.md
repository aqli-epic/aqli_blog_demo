---
layout: page
title: "Methods"
section: "Documentation"
permalink: /methods/
standfirst: "The equation, the coefficient, and the seven things every post has to declare before it goes up."
math: true
---

AQLI-style communication connects long-term particulate exposure to life expectancy through a
single linear translation. It is deliberately simple, which is its strength as a communication
device and its weakness as a model. Both are worth saying out loud.

## The calculation

$$
\Delta LE = \left( PM_{2.5}^{\text{baseline}} - PM_{2.5}^{\text{target}} \right) \times \beta
$$

| Symbol | Meaning | Units |
|---|---|---|
| $$PM_{2.5}^{\text{baseline}}$$ | Baseline annual average concentration | µg/m³ |
| $$PM_{2.5}^{\text{target}}$$ | WHO guideline, national standard, or policy target | µg/m³ |
| $$\beta$$ | Life-expectancy gain per 1 µg/m³ reduction | years per µg/m³ |
| $$\Delta LE$$ | Estimated life-expectancy gain | years |

This site uses $$\beta = {{ site.aqli_coefficient }}$$ and a WHO guideline of
{{ site.who_guideline }} µg/m³ throughout. Both are set once, in `_config.yml`, so a single edit
propagates to every page rather than leaving stale numbers behind in prose.

<div class="note" markdown="1">
**What the equation does not do**

It is linear. It assumes the relationship holds across the full range of concentrations, that
exposure is sustained, and that the population is comparable to the one the coefficient was
estimated on. Where a story leans on any of those assumptions harder than usual, the story has
to say so.
</div>

## Minimum reporting checklist

Every post declares, in order:

1. Baseline year
2. Pollution target used (guideline, national standard, or policy commitment)
3. Geographic unit
4. Population-weighting method
5. PM₂.₅ data source
6. Life-expectancy coefficient
7. Uncertainty and caveats

A post that cannot fill all seven is not finished. It is a draft with a headline.
