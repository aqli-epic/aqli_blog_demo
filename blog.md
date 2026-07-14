---
layout: page
title: "Stories"
section: "Register"
permalink: /blog/
standfirst: "Everything published, newest first, with the exposure each story describes."
wide: true
---

{%- if site.posts.size > 0 -%}
<div class="register">
  {%- for post in site.posts -%}
  <article class="entry reveal">
    <div class="entry__date">
      <p class="kicker kicker--mute">{{ post.section | default: "Story" }}</p>
      <p class="datum"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%d.%m.%Y" }}</time></p>
    </div>

    <div>
      <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
      <p>{{ post.standfirst | default: post.excerpt | strip_html | truncate: 200 }}</p>
      <p class="byline" style="margin-top:.75rem">{{ post.author | default: site.author.name }}</p>
    </div>

    <div class="entry__data">
      {%- if post.pm25 -%}
        <span class="datum">{{ post.place }} · {{ post.pm25 }} µg/m³</span>
        {% include ruler.html value=post.pm25 inline=true %}
      {%- else -%}
        <span class="datum">No place-level exposure</span>
      {%- endif -%}
    </div>
  </article>
  {%- endfor -%}
</div>
{%- else -%}
<div class="register">
  <div class="empty">
    <p class="empty__lede">The register is empty.</p>
    <p>
      Nothing has been published yet. When it is, each story will appear here as a dated entry: the
      section it belongs to, the headline, the standfirst, and — for any story about a place — that
      place's position on the exposure ruler, so the register can be read as a scale rather than a list.
    </p>
    <p class="datum">
      To add the first one:
      <a href="{{ '/write/' | relative_url }}">editorial guide</a> ·
      <a href="{{ '/formatting/' | relative_url }}">formatting reference</a>
    </p>
  </div>

  <div class="entry entry--ghost" aria-hidden="true">
    <div class="entry__date">
      <p class="kicker kicker--mute">Section</p>
      <p class="datum">DD.MM.YYYY</p>
    </div>
    <div>
      <h2>Headline goes here, and it should be a claim</h2>
      <p>The standfirst sits here: one or two sentences that say what the piece found, not what it is about.</p>
      <p class="byline" style="margin-top:.75rem">Author name</p>
    </div>
    <div class="entry__data">
      <span class="datum">Place · NN µg/m³</span>
      {% include ruler.html value=45 inline=true %}
    </div>
  </div>
</div>
{%- endif -%}
