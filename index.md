---
layout: default
title: "Home"
description: "Air pollution, translated into years of life. The Air Quality Life Index blog: evidence-led writing on PM2.5, life expectancy and clean-air policy."
---

{%- assign featured = site.posts | where_exp: "post", "post.featured == true" | first -%}
{%- unless featured -%}{%- assign featured = site.posts | first -%}{%- endunless -%}

<section class="hero">
  <div class="shell hero__grid">
    <div class="hero__content">
      <p class="eyebrow">The Air Quality Life Index</p>
      <h1>Air pollution, translated into years of life.</h1>
      <p class="hero__lede">
        Particulate pollution is the largest external risk to human health, and it is almost
        entirely invisible. This blog makes it legible: what the air holds, who breathes it, and how
        many years a cleaner standard would give back.
      </p>
      <div class="hero__actions" aria-label="Primary actions">
        <a class="button button--primary" href="{{ '/blog/' | relative_url }}">Read the stories</a>
        <a class="button button--quiet" href="{{ '/methods/' | relative_url }}">See the method</a>
      </div>
    </div>

    {%- comment -%}
      The hero's second column is the instrument, not decoration: one district's
      exposure on the same ruler every story on this site uses.
    {%- endcomment -%}
    <figure class="data-figure">
      <p class="eyebrow">The instrument</p>
      <div class="stat">
        <b>{{ 55 | minus: site.who_guideline | times: site.aqli_coefficient | round: 1 }}</b>
        <span>years of life expectancy, held in the gap between a district at 55 µg/m³ and the WHO guideline</span>
      </div>
      {% include ruler.html value=55 label="A district at 55 µg/m³" animate=true %}
      <figcaption class="data-figure__note">
        Annual mean PM<sub>2.5</sub>, µg/m³. The guideline mark sits at {{ site.who_guideline }}.
        The distance between the two marks is the whole subject of the blog. Illustrative figure.
      </figcaption>
    </figure>
  </div>
</section>

<main id="main-content">
  <section class="section section--compact shell">
    <div class="signal-strip" aria-label="What this blog publishes">
      <div>
        <strong>Exposure</strong>
        <span>Long-term PM<sub>2.5</sub> for real places — districts, states, airsheds, countries — and who sits under it.</span>
      </div>
      <div>
        <strong>Policy</strong>
        <span>Guidelines and national standards read closely. A target is only as good as the years it buys.</span>
      </div>
      <div>
        <strong>Method</strong>
        <span>Weighting, baselines, coefficients, uncertainty. Every figure here is meant to be checked, not trusted.</span>
      </div>
    </div>
  </section>

  {%- if featured -%}
  <section class="section shell">
    <div class="section-heading section-heading--split">
      <div>
        <p class="eyebrow">Featured</p>
        <h2>From the blog</h2>
      </div>
      <a class="text-link" href="{{ '/blog/' | relative_url }}">All stories</a>
    </div>

    <article class="lead-card">
      <a class="lead-card__image" href="{{ featured.url | relative_url }}" aria-label="Read {{ featured.title | escape }}">
        <img src="{{ featured.image | default: '/assets/images/aqli-particulate-field.png' | relative_url }}" alt="">
      </a>
      <div class="lead-card__body">
        <p class="meta">
          <time datetime="{{ featured.date | date_to_xmlschema }}">{{ featured.date | date: "%B %-d, %Y" }}</time>
          · {{ featured.section | default: "Story" }}
        </p>
        <h3><a href="{{ featured.url | relative_url }}">{{ featured.title }}</a></h3>
        <p>{{ featured.standfirst | default: featured.excerpt | strip_html | truncate: 190 }}</p>
        {%- if featured.pm25 -%}
        <div class="post-card__exposure">
          <p class="meta">
            <span>{{ featured.place }}</span>
            <span>{{ featured.pm25 }} µg/m³</span>
          </p>
          {% include ruler.html value=featured.pm25 inline=true %}
        </div>
        {%- endif -%}
        {%- if featured.tags -%}
        <div class="tag-row">
          {%- for tag in featured.tags limit: 4 -%}<span>{{ tag }}</span>{%- endfor -%}
        </div>
        {%- endif -%}
      </div>
    </article>
  </section>
  {%- endif -%}

  <section class="section section--muted">
    <div class="shell">
      <div class="section-heading section-heading--split">
        <div>
          <p class="eyebrow">Latest</p>
          <h2>Recent stories</h2>
        </div>
        {%- if site.posts.size > 1 -%}
        <div class="filter-box">
          <label for="post-search">Search stories</label>
          <input id="post-search" data-post-search type="search" placeholder="Search by place, topic, author…">
        </div>
        {%- endif -%}
      </div>

      {%- if site.posts.size > 0 -%}
      <div class="post-grid">
        {%- for post in site.posts limit: 6 -%}
          {% include post-card.html post=post %}
        {%- endfor -%}
      </div>
      <p class="empty-state" data-empty-state hidden>No stories match that search.</p>
      {%- else -%}
      <p class="empty-state">
        No stories published yet. This is where the most recent pieces will sit, each with the
        exposure it describes marked on the ruler.
        <a class="text-link" href="{{ '/write/' | relative_url }}">Start with the editorial guide</a>.
      </p>
      {%- endif -%}
    </div>
  </section>

  <section class="section shell">
    <div class="section-heading">
      <p class="eyebrow">The calculation</p>
      <h2>The equation, in full</h2>
    </div>

    <div class="equation-band">
      <p class="equation">
        <span>ΔLE</span>
        <b>=</b>
        <span>( PM<sub>2.5</sub><sup>baseline</sup> − PM<sub>2.5</sub><sup>target</sup> )</span>
        <b>×</b>
        <span>β</span>
      </p>
      <p class="data-figure__note">
        β = {{ site.aqli_coefficient }} years of life expectancy per 1 µg/m³ of sustained reduction ·
        WHO annual guideline = {{ site.who_guideline }} µg/m³ ·
        both set once in <code>_config.yml</code> and referenced site-wide, so a revision cannot
        leave a stale number behind in copy.
      </p>
    </div>
  </section>

  <section class="section section--muted">
    <div class="shell">
      <div class="section-heading">
        <p class="eyebrow">For contributors</p>
        <h2>How a story gets published</h2>
      </div>

      <div class="workflow-grid">
        <a class="workflow-card" href="{{ '/write/' | relative_url }}">
          <span class="workflow-card__mark">01</span>
          <h3>Write the piece</h3>
          <p>The editorial guide covers the shape of a post, the headline test, the seven-line disclosure, and the words we do not use.</p>
        </a>
        <a class="workflow-card" href="{{ '/formatting/' | relative_url }}">
          <span class="workflow-card__mark">02</span>
          <h3>Format the piece</h3>
          <p>The formatting reference is the copy-and-paste list: front matter, the exposure ruler, methods boxes, tables, figures, maths.</p>
        </a>
        <a class="workflow-card" href="{{ '/blog/' | relative_url }}">
          <span class="workflow-card__mark">03</span>
          <h3>Publish it</h3>
          <p>Copy the post template into <code>_posts/</code>, open a pull request. CI checks the front matter against the editorial contract before it merges.</p>
        </a>
      </div>
    </div>
  </section>
</main>
