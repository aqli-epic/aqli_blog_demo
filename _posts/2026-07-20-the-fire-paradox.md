---
title: "Global burned area is falling. The fires that matter most are rising."
section: "Exposure"
author: "Hrishikesh Chandra Gautam and Purushottam Gupta"
standfirst: "Twenty-three years of satellite data show the planet burning about a sixth less than it did in 2002. It is also true that the fires nearest to human lungs are increasing. Both facts come from the same file."
tags: [global, india, data, pm2.5]
reading_time: 12
---

Every summer now brings a familiar headline: record wildfires, orange skies, evacuation orders. It
would be reasonable to assume that the planet is burning more than it used to. Twenty-three years of
satellite-derived burned-area data say otherwise — at the global level.

Between 2002 and 2024, the total area burned by fire worldwide fell from roughly 184 million hectares
to 162 million hectares, a decline of about 16–17% comparing the early-2000s average to the 2020–24
average. That is broadly consistent with the landmark 2017 *Science* study by Andela and colleagues,
which found a 24% drop in global burned area between 1998 and 2015, driven overwhelmingly by the
mechanization of agriculture in the African and South American savannas that do most of the planet's
burning.

So the headline "wildfires are rising" is, globally, wrong if measured in hectares. But it is right in
almost every place people actually live near forests, and it is right in the way that matters most for
human health: the fires that are increasing are concentrated in the forested, populated, carbon-dense
regions where a burning hectare does far more damage — to lungs, to climate, to property — than a
burning hectare of savanna grass. This piece uses country-level GLOBFIRE burned-area data to unpack
that divergence, and connects it to the AQLI's core concern: what all of this means for the air people
breathe and the years it costs them.

![Burned area by region, 2002 to 2024, log scale. Central and West Africa and Eastern and Southern Africa sit far above every other region and both decline. United States and Canada and South Asia are the only lines rising.]({{ '/assets/img/fire-regional-trends.gif' | relative_url }})
*Central & West Africa and Eastern & Southern Africa dwarf every other region in raw hectares — and both are declining. United States & Canada and South Asia are the two regions moving the wrong way. Note the log scale: the gap is larger than it looks. Source: GLOBFIRE annual country-level burned area, 2002–2024; regions follow AQLI report groupings.*

## About the data

The underlying file is GLOBFIRE's annual, country-level burned-area product for 2002–2024, covering
183 countries and territories with two variables per year: total burned area in hectares
(`ba_area_ha`) and the number of discrete burned-area patches, i.e. fire events (`ba_count`).
GLOBFIRE derives individual fire perimeters from MODIS burned-area imagery (500 m resolution) and
reconstructs each fire's spatial and temporal extent, which is then aggregated to country-year totals
— a different methodology from simple active-fire "hotspot" counts (like FIRMS/VIIRS alerts), and one
that is more directly comparable to the burned-area literature (GFED, Andela et al.).

Three things are worth flagging for anyone working with this file:

- **It is burned area, not "forest fire" area.** GLOBFIRE captures all vegetation fire — savanna and
  grassland burning, agricultural residue burning, shrubland fire, and forest fire alike. This matters
  enormously for interpretation: the countries with the largest totals (Angola, the DRC, Zambia) are
  burning mostly savanna and woodland, not closed-canopy forest, and much of that burning is
  deliberate, managed, and ecologically routine rather than "wildfire" in the disaster sense.
- **Missing data is real but modest.** Between 24 and 39 countries (out of 183) have a missing value
  in any given year, mostly small island states and a handful of countries with incomplete satellite
  coverage in specific years. Global and regional totals here are sums over available countries, so
  they are slight underestimates, consistently across the time series.
- **Area burned and fire severity are not the same thing.** A country can burn less area with more
  destructive, higher-intensity individual fires. Dividing burned area by fire count gives an implied
  average fire size, which globally has been roughly flat (~330–340 hectares per event across the
  period) — but this masks sharp upward spikes in specific country-years, most visibly Canada's 2023
  season.

## Where the burning actually happens

Sub-Saharan Africa is, by a wide margin, the fire capital of the planet. Central & West Africa
(Angola, the DRC, Congo-Brazzaville, and the Sahel belt) and Eastern & Southern Africa (Zambia,
Mozambique, Tanzania) together account for roughly two-thirds of all burned area on Earth in a typical
recent year. Angola alone burns an average of over 20 million hectares annually — more than the entire
land area of the United Kingdom. This is overwhelmingly savanna and agricultural fire, set
deliberately for land clearing and pasture management, and it has been *declining*, not rising, for
the same reasons Andela et al. identified: as farming intensifies and populations urbanize, the
traditional burn-to-clear cycle recedes.

![Animated ranking of the top 12 countries by annual burned area, 2002 to 2024. African savanna nations including Angola, the Democratic Republic of Congo and Zambia hold the top positions in almost every year, with Australia, Brazil and Kazakhstan appearing intermittently.]({{ '/assets/img/fire-top-countries-race.gif' | relative_url }})
*The top 12 countries by annual burned area. The list is dominated, year after year, by the same African savanna and woodland nations — with occasional intrusions from Australia, Brazil, and Kazakhstan. Bar colour marks the region each country belongs to. Source: GLOBFIRE annual country-level burned area, 2002–2024.*

That single fact reframes the entire "wildfires are getting worse" narrative. When people picture
rising wildfires, they are picturing something else entirely: temperate and boreal *forest* fire in
North America, the Mediterranean, and increasingly South Asia — a small share of global burned
hectares, but a rapidly growing one, occurring in exactly the places with dense populations, valuable
infrastructure, and (in North America and Europe) decades of hard-won air quality gains now at risk of
reversal.

## The regions moving the wrong way

Comparing the 2002–06 average to the 2020–24 average by region:

<div class="table-scroll" markdown="1">

| Region | Change in burned area | Share of 2020–24 global total |
|---|---:|---:|
| United States & Canada | **+20%** | 1.3% |
| South Asia | **+39%** | 1.2% |
| China | +9% | 0.6% |
| Middle East & North Africa | −5% | 8.1% |
| Central & West Africa | −12% | 43.5% |
| Oceania | −12% | 5.7% |
| Eastern & Southern Africa | −18% | 23.1% |
| Latin America & Caribbean | −20% | 11.6% |
| Southeast Asia | −30% | 1.9% |
| Europe | −41% | 0.7% |
| Russia, Central & East Asia | −61% | 2.3% |

</div>

Only two regions in this dataset are unambiguously burning more hectares than they were two decades
ago — and they are the two regions that combine forest ecosystems with large exposed populations:
North America and South Asia.

![Burned area for selected countries indexed so each country's 2002 to 2004 average equals 100. Canada and India trend above the baseline while Indonesia and Russia fall well below it. Syria's line leaves the top of the chart in 2019 and 2020, marked with triangles carrying its true index values.]({{ '/assets/img/fire-indexed-trajectories.gif' | relative_url }})
*Burned area indexed to each country's 2002–04 average (=100). Canada and India trend upward against falling trajectories in Indonesia and Russia. Syria's 2019–20 spike is so large — index values of 2,390 and 1,104 — that it leaves the chart; the ▲ markers carry its true value. That spike is not fire weather. See below. Source: GLOBFIRE, 2002–2024; index base is the mean of 2002, 2003 and 2004.*

## Country deep dives

**Canada** more than doubled its average annual burned area between the early 2000s and 2020–24
(+100%), and the underlying yearly data shows why: 2023 alone burned an estimated 1.58 million
hectares in this dataset — more than six times Canada's 2002 total — as boreal forest fires across
Quebec, British Columbia, and the Northwest Territories produced smoke plumes that reached New York
and Washington, D.C. Independent Canadian government tallies put the full 2023 national season above
15 million hectares (GLOBFIRE's per-country figures track burned-area patches attributable to specific
countries and years and are not directly comparable to national agency totals, but the direction and
scale of the anomaly agree). Canada's 2024 and 2025 seasons, both outside this dataset's 2024 endpoint
or right at its edge, were respectively affected by the destructive Jasper wildfire in Alberta and
ranked as the second-worst fire season on record nationally — evidence that 2023 was not an isolated
outlier but the start of a new baseline.

**India** shows a smaller but steady climb: average annual burned area rose about 41% from the early
2000s to the 2020–24 period, concentrated in forest states along the Himalayan foothills and central
India. This adds a fire-smoke dimension to a country whose particulate pollution problem is already
the world's most severe by AQLI's accounting — South Asia alone accounts for roughly 45% of all
life-years lost to air pollution globally, and India's national PM₂.₅ standard (40 µg/m³) is still
exceeded by something like 40–46% of the population even after recent improvement.

**The Democratic Republic of Congo and the wider Central African basin** present a genuinely difficult
case for the "fires are declining" story to sit alongside AQLI's own findings. Burned area here has
been essentially flat to slightly declining over 20+ years — the DRC alone averages nearly 18 million
hectares of burned savanna and woodland annually — yet Central & West Africa remains one of the most
polluted and least-monitored regions on the AQLI, with residents in the DRC losing roughly 2.9 years
of life expectancy to particulate pollution, a burden AQLI's own analysis finds larger than HIV/AIDS
in that country. The lesson is that raw burned-area trends and health burden are not the same axis:
this is a region where the *level* of fire-driven pollution, not its *trend*, is the crisis,
compounded by almost no ground-based air quality monitoring to track it.

**Indonesia** tells almost the opposite story: burned area fell roughly 82% from the early 2000s to
2020–24, from a base heavily driven by peatland and forest-clearing fires that produced the infamous
2015 and 2019 regional haze crises across Singapore and Malaysia (both years are visible spikes in the
underlying series). Better peatland-fire suppression policy and El Niño variability both play a role,
but the trend is real and represents one of the genuine wildfire success stories in this dataset.

**Syria and Iraq** show the largest percentage increases of any sizable country — burned area up 471%
and 355% respectively comparing early-2000s to 2020–24 averages — and Syria's underlying year-by-year
data is the most extreme single anomaly in this entire dataset. Burned area jumped from 8,200 hectares
in 2018 to 544,000 hectares in 2019 (a 66-fold increase in one year, with the fire-event count rising
in similar proportion, from 50 to over 1,700 discrete fires) before staying elevated at 251,000
hectares in 2020 and then subsiding. This was not a wildfire season in the conventional sense. Through
May and June 2019, vast wheat and barley fields across Al-Hasakah, Raqqa, and Deir ez-Zor governorates
— Syria's breadbasket — burned in what local officials, farmers, and aid agencies documented as
overwhelmingly deliberate arson: ISIS remnants publicly claimed responsibility for a wave of crop
fires in the group's own newsletter, while other burned areas were blamed on pro-government agents and
on the general breakdown of firefighting capacity in a war zone, compounded by an unusually wet spring
that had produced an exceptionally large crop to burn. Displacement from renewed fighting near the
Turkish border later that year left many of the affected fields abandoned altogether. It is a clean
illustration of the caveat above: GLOBFIRE measures burned vegetation, not "wildfire" in the disaster
sense, and in a conflict zone a spike in burned hectares can be a proxy for arson and collapsed
governance rather than for drought or heat.

## From burned hectares to breathed air

None of this matters to the AQLI mission unless it changes the air someone breathes — and
increasingly, it does, in places that had assumed the fine-particulate problem was a solved, or at
least steadily improving, one.

A 2023 *Nature* study led by Stanford's Marshall Burke quantified exactly this reversal for the United
States. Ambient PM₂.₅ concentrations had declined in as many as 41 of the lower 48 states between 2000
and 2016, the direct product of Clean Air Act policy. Since 2016, wildfire smoke has slowed or fully
reversed that trend in 35 states, and across the affected states as a group, smoke has erased roughly
a quarter of the air-quality progress made since 2000 — equivalent to wiping out about four years of
regulatory gains, and more than half of all progress in several western states. This is pollution
moving entirely outside the regulatory system that AQLI's own life-expectancy framework was built to
track: nobody permits a wildfire, and nobody can fine it.

The 2024–25 global fire season, tracked by the Copernicus Atmosphere Monitoring Service's State of
Wildfires project, makes the same point at planetary scale: total burned area was *below* the
2003–2024 average that year, yet fire-related carbon emissions were 9% above average — the sixth-
highest on record — because the fires that did burn were concentrated in carbon-dense forests,
wetlands, and boreal ecosystems in Canada, Bolivia, Brazil, and Venezuela, rather than in grassland.
Los Angeles's January 2025 fires, driven by an unusual wet-then-drought whiplash pattern, destroyed
thousands of structures, forced roughly 200,000 evacuations, and pushed local PM₂.₅ to hazardous
levels even as most of the smoke plume was carried out over the Pacific — a vivid, if geographically
lucky, illustration of how a single fire event can dominate months of a region's particulate-pollution
story. (Both the LA fires and Canada's 2025 season, its second-worst on record, fall after this
dataset's 2024 endpoint and are cited here as external context rather than as part of the GLOBFIRE
series itself.)

For AQLI specifically, the implication is that fire deserves to be tracked as a distinct, worsening
*source* of particulate exposure layered on top of the existing region-by-region pollution picture —
not folded silently into ambient PM₂.₅ trends where it can mask genuine progress on other sources
(transport, industry, cooking fuel) or, conversely, get credited to policy success it didn't earn. A
South Asian or North American PM₂.₅ decline that is quietly being eaten from below by wildfire smoke
is a different story, and a different policy problem, than one that is holding steady on its own.

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: 2002, with 2002–06 and 2020–24 five-year means used for all change comparisons.

Target: not applicable — this post reports burned area, not a PM₂.₅ target. Where AQLI figures are cited they use the WHO annual guideline of {{ site.who_guideline }} µg/m³.

Geographic unit: country, aggregated to AQLI report regions.

Weighting: none. Burned area is summed, not population-weighted; unlike a concentration, hectares do not average.

Source: GLOBFIRE annual country-level burned area, 2002–2024, derived from MODIS 500 m imagery. 183 countries; 24–39 have a missing value in any given year, so totals are consistent slight underestimates.

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³, referenced for context but not applied — this post computes no life-expectancy estimate of its own.

Uncertainty: not propagated. Country-year totals are point estimates and are not directly comparable to national agency tallies, which use different perimeter definitions. Events after 2024 are cited as external context, not as data.
</div>

## The takeaway

Two things are simultaneously true in this data, and both deserve to survive contact with a single
headline: global burned area has fallen by roughly a sixth over 22 years, driven by less agricultural
and savanna burning across Africa and South America — and the specific fires that most directly
threaten human lungs, life expectancy, and the credibility of decades of clean-air policy are
increasing, concentrated in exactly the temperate and boreal forest regions, plus South Asia, where
population density meets flammable biomass.

Both stories are real. Only one of them shows up if you only look at the global total.

---

*Regional groupings follow AQLI's report regions (South Asia, Southeast Asia, Central & West Africa,
Middle East & North Africa, Latin America & Caribbean, China, United States & Canada, Europe,
Oceania), supplemented here with an "Eastern & Southern Africa" grouping for countries — Zambia,
Mozambique, Tanzania, South Africa among them — not covered by AQLI's Central & West Africa definition
but material to the global burned-area picture. Code and a tidy, region-tagged version of the dataset
are available on request.*
