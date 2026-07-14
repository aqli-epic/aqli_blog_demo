---
layout: page
title: "Topics"
section: "Index"
permalink: /topics/
standfirst: "The subjects this blog keeps returning to, and how many stories sit under each."
wide: true
---

{%- comment -%}
  Records separated by "|", fields by "~".
  Descriptions contain commas, so a comma cannot be the field separator.
  Fields: tag ~ display name ~ description
{%- endcomment -%}

{%- capture topic_list -%}
pm2.5~PM₂.₅~Long-term particulate exposure: concentration levels, trends, and where they fall|
life-expectancy~Life expectancy~Turning a reduction in exposure into years, and the limits of that translation|
india~India~State, district and airshed stories where the policy questions are live|
policy~Policy~Standards, targets, and whether a target is doing any work|
data~Data~Datasets, weighting choices, and the diagnostics we run before publishing|
global~Global burden~Regional comparisons and the shape of exposure worldwide
{%- endcapture -%}

<div class="topics">
  {%- assign topics = topic_list | split: "|" -%}
  {%- for topic in topics -%}
    {%- assign parts = topic | strip | split: "~" -%}
    {%- assign tag = parts[0] -%}
    {%- assign matches = site.posts | where_exp: "p", "p.tags contains tag" -%}
    <a class="topic" href="{{ '/blog/' | relative_url }}">
      <b>{{ parts[1] }}</b>
      <p>{{ parts[2] }}</p>
      <span class="datum">{% if matches.size == 0 %}—{% else %}{{ matches | size }} {% if matches.size == 1 %}story{% else %}stories{% endif %}{% endif %}</span>
    </a>
  {%- endfor -%}
</div>
