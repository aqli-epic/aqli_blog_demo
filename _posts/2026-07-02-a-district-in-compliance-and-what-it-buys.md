---
title: "A district in compliance, and what compliance buys"
section: "Policy"
author: "AQLI data team"
standfirst: "Example District B meets its national standard and has done for years. Measured against the WHO guideline, that clean bill of health is still worth 3.23 years of life expectancy per resident."
place: "Example District B"
pm25: 38
national_standard: 40
tags: [policy, life-expectancy]
---

Compliance is a word that does a great deal of quiet work. Example District B is in compliance. Its
annual mean concentration of {{ page.pm25 }} µg/m³ sits below the national standard of
{{ page.national_standard }} µg/m³, and has for several years. On every dashboard that reports
against that standard, the district is green.

Held against the WHO annual guideline of {{ site.who_guideline }} µg/m³, the same district is
{{ page.pm25 | minus: site.who_guideline }} µg/m³ over — a gap worth
**{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years** of
life expectancy. The district is not failing a test. The test is the thing that needs looking at.

## What a target is worth, in years

A target is not a health outcome. It is a line, and the only honest way to compare two lines is to
price them in the same units the harm is measured in.

{% assign interim_3 = 15 %}

<div class="table-scroll" markdown="0">
  <table>
    <caption class="datum" style="text-align:left; padding-bottom:1rem;">
      What each target would be worth to Example District B, at {{ page.pm25 }} µg/m³.
      Illustrative demonstration values.
    </caption>
    <thead>
      <tr>
        <th scope="col">Target</th>
        <th scope="col">Level</th>
        <th scope="col">Gap from {{ page.pm25 }}</th>
        <th scope="col">Years bought</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td data-pm="3">National standard</td>
        <td>{{ page.national_standard }}</td>
        <td>already met</td>
        <td>0.00</td>
      </tr>
      <tr>
        <td data-pm="2">WHO interim target 3</td>
        <td>{{ interim_3 }}</td>
        <td>{{ page.pm25 | minus: interim_3 }}</td>
        <td>{{ page.pm25 | minus: interim_3 | times: site.aqli_coefficient | round: 2 }}</td>
      </tr>
      <tr>
        <td data-pm="0">WHO guideline</td>
        <td>{{ site.who_guideline }}</td>
        <td>{{ page.pm25 | minus: site.who_guideline }}</td>
        <td>{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }}</td>
      </tr>
    </tbody>
  </table>
</div>

The first row is the point. A standard set at {{ page.national_standard }} µg/m³, in a district
already at {{ page.pm25 }}, buys nothing at all. It is not a weak target; it is an inactive one. It
imposes no obligation this district is not already meeting, and it will impose none until the air
gets worse.

## What the number means

The gap between the first row and the last —
{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }} years — is not
a measure of how polluted Example District B is. It is a measure of how much of the district's
pollution its own standard has decided not to be about.

That is a choice, and it was made once, in a document, by people who could have chosen a different
number. Standards are usually justified as achievable rather than as protective, which is a
defensible way to set policy and an indefensible way to describe it afterwards. A district reported
as compliant is not a district reported as safe, and the two words are used interchangeably in
almost every summary that reaches a resident.

## What the number is not

It is not an argument that the national standard should be {{ site.who_guideline }} µg/m³ tomorrow.
Standards balance health against what an economy can deliver on a timetable, and a target nobody can
hit does its own kind of damage to the credibility of the system that set it.

It is not a claim that compliance is worthless. A binding standard, enforced, prevents the air from
degrading — and the counterfactual where District B drifts to 55 µg/m³ is real. What this figure
says is narrower and harder to argue with: at this district's current concentration, this particular
standard is not currently asking for anything.

<div class="note" markdown="1">
**Reporting checklist for this post**

Baseline year: 2026, annual mean.

Target: three compared — national standard ({{ page.national_standard }} µg/m³), WHO interim
target 3 ({{ interim_3 }} µg/m³), WHO guideline ({{ site.who_guideline }} µg/m³).

Geographic unit: district (Example District B, illustrative).

Weighting: population-weighted district mean.

Source: `assets/data/aqli_demo.csv` — illustrative demonstration values, not published estimates.

Coefficient: β = {{ site.aqli_coefficient }} years per µg/m³.

Uncertainty: single-year baseline; the coefficient's confidence interval is not propagated into the
years column; interim target 3 is used as an illustrative intermediate, not as a recommendation.
</div>

## Where to be sceptical

**"Years bought" assumes the target is reached and held.** Every figure in the last column describes
sustained exposure at that level, indefinitely. A standard that is met in 2040 and then relaxed
delivers a fraction of what the table implies, and the table cannot tell you which fraction.

**A district mean is the wrong unit for a compliance question.** Standards are usually enforced
against monitoring stations, not against population-weighted district means. A district can be
compliant at every station and above the standard where most people actually live, depending
entirely on where the monitors were sited.

**Comparing a national standard to the WHO guideline flatters the guideline.** The guideline is a
health-evidence threshold with no feasibility constraint attached. Treating the difference as pure
policy failure ignores that some of it is arithmetic nobody knows how to solve yet.

## The lever

The number that decides this story is not {{ page.pm25 }}. It is
{{ page.national_standard }} — a figure in a regulation, revisable by the body that wrote it,
attached to no physical constraint whatsoever.

Concentrations are hard to move. Standards are one meeting.
