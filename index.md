---
layout: home
title: "Home"
description: "Air pollution, translated into years of life. The Air Quality Life Index blog: evidence-led writing on PM2.5, life expectancy and clean-air policy."
---

<section class="lead">
  <div class="lead__copy reveal">
    <p class="kicker">The Air Quality Life Index</p>
    <h1>Air pollution, translated into years of life.</h1>
    <p class="standfirst">
      Particulate pollution is the largest external risk to human health, and it is almost entirely
      invisible. This blog makes it legible: what the air holds, who breathes it, and how many years
      a cleaner standard would give back.
    </p>
    <p class="byline">
      Written by the AQLI data team at the Energy Policy Institute at the University of Chicago
    </p>
    <p style="margin-top:1.5rem">
      <a class="cta" href="{{ '/blog/' | relative_url }}">Read the stories</a>
      <a class="cta cta--quiet" href="{{ '/methods/' | relative_url }}">See the method</a>
    </p>
  </div>

  <figure class="lead__figure reveal">
    <p class="kicker kicker--mute">The instrument</p>

    <div class="lead__stat">
      <b>{{ 55 | minus: site.who_guideline | times: site.aqli_coefficient | round: 1 }}</b>
      <span>years of life expectancy, held in the gap between a district at 55 µg/m³ and the WHO guideline</span>
    </div>

    {% include ruler.html value=55 label="A district at 55 µg/m³" animate=true %}

    <figcaption>
      One scale, used on every story on this site: annual mean PM<sub>2.5</sub>, µg/m³. The guideline
      mark sits at {{ site.who_guideline }}. The distance between the two marks is the whole subject
      of the blog. Illustrative figure.
    </figcaption>
  </figure>
</section>

<section class="section">
  <div class="section__head">
    <h2>Latest</h2>
    <a href="{{ '/blog/' | relative_url }}">All stories</a>
  </div>

  {%- if site.posts.size > 0 -%}
  <div class="columns">
    {%- for post in site.posts limit: 3 -%}
      {% include story.html post=post %}
    {%- endfor -%}
  </div>
  {%- else -%}
  <div class="empty reveal">
    <p class="empty__lede">No stories published yet.</p>
    <p>
      This is where the three most recent pieces will sit, each with the exposure it describes marked
      on the ruler above. The first one is being written.
    </p>
    <p class="datum">
      Writing for the blog?
      <a href="{{ '/write/' | relative_url }}">Start with the editorial guide</a> ·
      <a href="{{ '/formatting/' | relative_url }}">then the formatting reference</a>
    </p>
  </div>
  {%- endif -%}
</section>

<section class="section">
  <div class="section__head">
    <h2>What this blog publishes</h2>
    <a href="{{ '/topics/' | relative_url }}">Topics</a>
  </div>

  <div class="columns">
    <div class="story reveal">
      <p class="kicker kicker--mute">Exposure</p>
      <h3>What the air actually holds</h3>
      <p>
        Long-term PM<sub>2.5</sub> concentrations for real places: districts, states, airsheds,
        countries. Where the burden sits, how it has moved, and who is under it.
      </p>
    </div>

    <div class="story reveal">
      <p class="kicker kicker--mute">Policy</p>
      <h3>What a standard is worth</h3>
      <p>
        Guidelines, national standards, and clean-air commitments, read closely. A target is only as
        good as the years it buys, and some targets buy none.
      </p>
    </div>

    <div class="story reveal">
      <p class="kicker kicker--mute">Method</p>
      <h3>How the number was made</h3>
      <p>
        Weighting, baselines, coefficients, and uncertainty. Every figure here is meant to be
        checked, not trusted.
      </p>
    </div>
  </div>
</section>

<section class="section">
  <div class="section__head">
    <h2>The equation, in full</h2>
    <a href="{{ '/methods/' | relative_url }}">Methods</a>
  </div>

  <div class="equation-band reveal">
    <p class="equation">
      <span>ΔLE</span>
      <b>=</b>
      <span>( PM<sub>2.5</sub><sup>baseline</sup> − PM<sub>2.5</sub><sup>target</sup> )</span>
      <b>×</b>
      <span>β</span>
    </p>
    <p class="datum">
      β = {{ site.aqli_coefficient }} years of life expectancy per 1 µg/m³ of sustained reduction ·
      WHO annual guideline = {{ site.who_guideline }} µg/m³ ·
      both set once in <code>_config.yml</code> and used site-wide
    </p>
  </div>
</section>

<section class="section">
  <div class="section__head">
    <h2>For contributors</h2>
    <a href="{{ '/write/' | relative_url }}">Editorial guide</a>
  </div>

  <div class="columns">
    <div class="story reveal">
      <p class="kicker kicker--mute">01</p>
      <h3>Write the piece</h3>
      <p>
        The <a href="{{ '/write/' | relative_url }}">editorial guide</a> covers the shape of a post,
        the headline test, the seven-line disclosure, and the words we do not use.
      </p>
    </div>

    <div class="story reveal">
      <p class="kicker kicker--mute">02</p>
      <h3>Format the piece</h3>
      <p>
        The <a href="{{ '/formatting/' | relative_url }}">formatting reference</a> is the
        copy-and-paste list: front matter, the ruler, methods boxes, tables, figures, footnotes,
        maths.
      </p>
    </div>

    <div class="story reveal">
      <p class="kicker kicker--mute">03</p>
      <h3>Publish it</h3>
      <p>
        Copy <code>POST-TEMPLATE.md</code> into <code>_posts/</code>, rename it
        <code>YYYY-MM-DD-slug.md</code>, open a pull request. The post appears here on merge.
      </p>
    </div>
  </div>
</section>
