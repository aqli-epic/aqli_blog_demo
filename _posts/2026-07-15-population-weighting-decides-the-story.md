---
title: "Population weighting decides the story before you write it"
section: "Method"
author: "AQLI data team"
standfirst: "Two defensible ways to average a region's air can differ by more than a decade of policy progress. The choice is made before any analysis begins, and it is rarely reported."
tags: [data]
math: true
---

Averaging is where most of the argument happens, and almost none of it is written down. A region has
a hundred grid cells and one headline number, and the step between them is a weighting decision that
will move the answer further than any other choice in the pipeline.

Take the simple version first. An unweighted regional mean treats every grid cell as one
observation:

$$
\bar{C}_{\text{area}} = \frac{1}{n} \sum_{i=1}^{n} C_i
$$

The population-weighted mean asks a different question — not *what is the air like here*, but *what
air do people here breathe*:

$$
\bar{C}_{\text{pop}} = \frac{\sum_{i=1}^{n} P_i \, C_i}{\sum_{i=1}^{n} P_i}
$$

Both are correct. They answer different questions, and for any region where people are not spread
evenly, they return different numbers.

## Why the gap is large, and which way it points

Population and pollution are correlated, and not by accident. People concentrate in cities; cities
concentrate combustion, traffic, construction and industry. So in most regions the
population-weighted mean sits above the area mean, sometimes far above.

A region that is nine-tenths sparsely populated highland at low concentrations and one-tenth dense
valley floor at high ones will report clean air by area and dirty air by population. Neither number
is wrong. Only one of them is about people.

This matters for the translation into years, because the coefficient of
{{ site.aqli_coefficient }} years per µg/m³ is applied to whichever mean you hand it. Choose the
area mean and the region's burden shrinks. Choose the population-weighted mean and it grows. Nothing
about the region changed.

## What this does to a trend

The failure that costs the most is not a wrong level. It is a wrong *change*.

Consider a region whose air improved modestly everywhere while its population moved steadily from
the countryside into its most polluted city. Measured by area, concentrations fell. Measured by
population weight, average exposure rose — because more people ended up in the dirty tenth of the
map, and that migration outweighed the improvement.

Both statements come from the same underlying data. One reports a policy success. The other reports
a public-health deterioration. A story that quotes one without naming the weighting has, in effect,
picked its conclusion in a preprocessing step.

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: not applicable — this post is methodological.

Target: not applicable.

Geographic unit: discussed generally; the argument holds at district, state and national level, and
gets stronger as the unit gets larger.

Weighting: the subject of the post. Population-weighted means are the default on this site, and any
post using an area mean has to say so in its own methods box.

Source: no dataset is analysed here. Worked illustrations only.

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³, referenced but not applied.

Uncertainty: population rasters carry their own error, and it is spatially correlated with
concentration error in ways this post does not attempt to quantify.
</div>

## What this argument is not

It is not a claim that population weighting is always right. For questions about ecosystems, crop
yields, visibility or deposition, area means are the appropriate summary and population weighting
would be the distortion. The rule is that the weighting should match the question, not that one
weighting is superior.

It is not a claim that the difference is always large. In a uniformly populated region with a
uniform pollution field, the two means converge and the choice stops mattering. The trouble is that
this is knowable only after computing both — which is the actual recommendation buried in this post.

And it is not a claim that anyone is choosing weightings dishonestly. Far more often the choice is
inherited from whatever the previous analysis did, propagated through a script nobody has reopened.

## Where to be sceptical

**Population rasters are models too.** Gridded population products disaggregate census counts using
built-up-area detection and ancillary layers. Their errors are largest exactly where the weighting
matters most: dense, rapidly changing urban edges.

**The vintage mismatch is routine and rarely disclosed.** Weighting a 2026 concentration surface
with a 2015 population grid embeds a decade of urban growth as if it had not happened — and it
biases in a predictable direction, because growth concentrates in the places already most polluted.

**Weighting cannot fix a resolution problem.** If the concentration surface is coarser than the
variation people actually experience, population weighting produces a more defensible average of a
field that was already too smooth. It improves the summary, not the input.

## The lever

The decision that sets this number is not analytical. It is editorial: whether the weighting method
appears in the piece at all.

It is line four of the seven-line disclosure on this site for that reason. A regional average with
no weighting stated is not a figure a reader can check, and a figure a reader cannot check is a
number they have been asked to take on trust — which is the one thing this blog exists not to ask
for.
