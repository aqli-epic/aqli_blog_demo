---
layout: page
title: "Data"
section: "Corner"
permalink: /data/
standfirst: "Small, downloadable, and honest about being a demonstration."
wide: true
---

<div class="prose" markdown="1">
Everything on this site is reproducible from one file. It contains illustrative demo values, not
published estimates, and it exists so the layout can be designed against real structure rather
than against a placeholder.

[Download `aqli_demo.csv`]({{ '/assets/data/aqli_demo.csv' | relative_url }}) — 5 rows, 5 columns, 1 kB.
</div>

<div class="table-scroll">
  <table>
    <caption class="datum" style="text-align:left; padding-bottom:1rem;">
      Life-expectancy gain if each district met the WHO guideline of {{ site.who_guideline }} µg/m³.
      Swatches follow the exposure ruler used across the site.
    </caption>
    <thead>
      <tr>
        <th scope="col">Region</th>
        <th scope="col">Baseline PM₂.₅</th>
        <th scope="col">Target PM₂.₅</th>
        <th scope="col">β</th>
        <th scope="col">Gain (years)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td data-pm="4">Example District A</td>
        <td>55</td><td>5</td><td>0.098</td><td>4.90</td>
      </tr>
      <tr>
        <td data-pm="3">Example District B</td>
        <td>38</td><td>5</td><td>0.098</td><td>3.23</td>
      </tr>
      <tr>
        <td data-pm="2">Example District C</td>
        <td>22</td><td>5</td><td>0.098</td><td>1.67</td>
      </tr>
      <tr>
        <td data-pm="1">Example District D</td>
        <td>12</td><td>5</td><td>0.098</td><td>0.69</td>
      </tr>
      <tr>
        <td data-pm="0">Example District E</td>
        <td>6</td><td>5</td><td>0.098</td><td>0.10</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="prose" markdown="1">
## What belongs here next

- District and state CSVs, versioned, with a changelog
- Static PNG and SVG charts, so the page renders without JavaScript
- A data dictionary: one row per column, units declared
- Source notes and vintage for every dataset
- The R or Python script that produced each table, in full
- A caveat box on every file, not just the ones where it feels necessary
</div>
