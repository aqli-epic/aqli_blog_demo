---
title: "The years hidden in one district's air"
section: "Exposure"
author: "AQLI data team"
standfirst: "Example District A sits at 55 µg/m³. Against the WHO guideline that gap is worth 4.9 years of life expectancy — more than the district loses to any single named disease."
place: "Example District A"
pm25: 55
tags: [pm2.5, life-expectancy]
---

Nothing about the air in Example District A announces itself. There is no smell on most days, no
visible plume, no siren. The annual mean concentration of fine particulate matter is
{{ page.pm25 }} µg/m³, and that number is the whole story.

The arithmetic is short. The WHO annual guideline is {{ site.who_guideline }} µg/m³. This district
sits {{ page.pm25 | minus: site.who_guideline }} µg/m³ above it. The AQLI coefficient of
{{ site.aqli_coefficient }} years per µg/m³ turns that gap into
**{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years** of
life expectancy, held by the difference between the air people here breathe and the air the
guideline describes.

## What the number means

Nearly five years is not a rounding error in a life. It is the difference between meeting a
grandchild and not. Set against causes of death that have names, budgets and awareness campaigns,
particulate pollution in this district outweighs most of them — and unlike them it has no diagnosis,
no clinic, and no moment at which anyone is told they have it.

It is also worth being precise about who holds the years. This is not a prediction about any
particular resident. It is a statement about a population: if everyone in Example District A
breathed air at {{ site.who_guideline }} µg/m³ for the rest of their lives, average life expectancy
across that population would be about
{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years higher
than it is on current air. The years are distributed unevenly, and they are not owed to anyone in
particular.

## What the number is not

It is not a measurement. It is a translation of a measurement through a coefficient estimated
elsewhere, on a different population, under assumptions that this district was never checked
against.

It is not a forecast. It describes a counterfactual — sustained exposure at the guideline, starting
now — that no policy currently on the table would deliver on that timetable. A district that halves
its concentration over fifteen years does not collect
{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years, or half
of them, on any schedule this figure can tell you.

And it is not a claim about a cause of death. Nobody dies of 55 µg/m³. They die of the
cardiovascular and respiratory conditions that sustained exposure makes more likely and more severe,
which is a different sentence with different evidence behind it.

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: 2026, annual mean.

Target: WHO annual guideline, {{ site.who_guideline }} µg/m³.

Geographic unit: district (Example District A, illustrative).

Weighting: population-weighted district mean.

Source: `assets/data/aqli_demo.csv` — illustrative demonstration values, not published estimates.

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³.

Uncertainty: the coefficient carries a confidence interval this post does not propagate; the
district mean conceals within-district variation that is likely larger than the mean itself.
</div>

## Where to be sceptical

**The baseline is a single year.** One annual mean is a thin baseline for a figure expressed in
decades. A year with unusual meteorology — a long inversion, an early monsoon — moves the mean by
several µg/m³ without anything changing about what is emitted. A three-year rolling mean would be
the honest input, and this post does not use one.

**The linearity is doing heavy lifting.** A constant β means the first microgram removed and the
fiftieth are worth the same. At {{ page.pm25 }} µg/m³ the district sits well above the range where
that assumption is most comfortable, and the true relationship may flatten at high concentrations.
If it does, this figure is too high.

**The district mean hides the exposure that matters.** Population-weighting corrects for where
people live, not for how they live. A roadside household and a household two kilometres upwind
receive the same number here, and their actual exposures may differ by more than the gap this whole
post is about.

## The lever

Concentration is not weather. Roughly speaking, this district's 55 µg/m³ is the sum of decisions
made somewhere: what the power fleet burns, whether the brick kilns are converted, whether crop
residue has an economic alternative to burning, how freight moves through the district and on what
fuel.

Each of those has a number attached, and the numbers add up to this one. The years are the price;
the decisions are the invoice. Whether the district pays it is not a question about air.
