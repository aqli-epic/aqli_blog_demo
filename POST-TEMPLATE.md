---
title: "A claim, not a topic"
section: "Exposure"
author: "Your Name"
standfirst: "One or two sentences saying what the piece found. Not what it will explore."
place: "Example District A"
pm25: 55
tags: [pm2.5, life-expectancy]
reading_time: 4
---

Open with a word, not a number — the first letter becomes a drop cap. The figure belongs in this
paragraph or the next one, with its unit, so a reader who leaves after thirty seconds still leaves
with something.

The arithmetic, shown. The WHO guideline is {{ site.who_guideline }} µg/m³. This place sits at
{{ page.pm25 }}. The gap is {{ page.pm25 | minus: site.who_guideline }} µg/m³, which the AQLI
coefficient of {{ site.aqli_coefficient }} converts into
**{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years** of
life expectancy. Never type these numbers. Derive them, as above, so the post cannot go stale.

## What the number means

The translation into something a reader can hold.

## What the number is not

What your figure does not claim. Every post has this section. It is not hedging; it is the reason
the figure can be trusted.

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year:

Target:

Geographic unit:

Weighting:

Source:

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³.

Uncertainty:
</div>

## Where to be sceptical

Two or three specific weaknesses in your own analysis, named. The baseline. The linearity. The
counterfactual. Whichever they actually are.

## The lever

End on the decision that sets the number, not on a call to action.

<!--
  Before opening the pull request:
    /write/       — the editorial guide
    /formatting/  — components and markup
-->
