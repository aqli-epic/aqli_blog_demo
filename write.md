---
layout: page
title: "How to write for this blog"
section: "Editorial guide"
permalink: /write/
standfirst: "The shape of a post, the headline test, the seven lines every piece must disclose, and the words we do not use."
---

This blog has one job: to make an invisible quantity legible, and to be checkable while doing it.
Everything below follows from that. Read it once before your first post; after that, the
[formatting reference]({{ '/formatting/' | relative_url }}) is the page you will actually keep open.

## The shape of a post

Six moves, in this order. Not a template to fill, but a structure that has to be there somewhere.

1. **The number, immediately.** First or second paragraph. A reader who stops after thirty seconds
   should leave with one figure and its unit. Not a scene, not a history of the region, not a
   throat-clearing paragraph about how air pollution is a growing concern.
2. **The arithmetic, shown.** Baseline, target, gap, coefficient, result. Five short clauses.
   If it takes a paragraph to explain how you got the number, the number is doing too much work.
3. **What the number means.** The translation into something a person can hold: years, a policy gap,
   a difference between two places.
4. **What the number is not.** Every post says what its figure does *not* claim. This is not
   hedging. It is the reason the figure can be trusted at all.
5. **Where to be sceptical.** Name two or three specific weaknesses in your own analysis, by name.
   The baseline. The linearity. The counterfactual. Whatever they actually are.
6. **The lever.** Pollution is a symptom; the years are a price; somewhere there is a decision that
   sets it. End on the decision, not on a call to action.

Length: 700–1,200 words. A post that needs 2,500 words is usually two posts, or one post and a
methods note.

## The headline test

A headline is a claim, not a topic.

| Not this | This |
|---|---|
| Air pollution in Example District A | The years hidden in one district's air |
| Understanding PM₂.₅ standards | What a standard actually promises |
| A note on population weighting | Population weighting decides the story before you write it |

If your headline would still make sense with the district name swapped out, it is a topic, not a
claim. Write the claim.

## The standfirst

One or two sentences, in the `standfirst:` field. It says what the piece **found**. It does not
preview what the piece will "explore", "examine", "look at" or "dive into". A standfirst that could
sit above any post on the site is not a standfirst.

## The seven-line disclosure

Every post that reports a place-level figure carries a methods box, and the box has seven lines.
Not six. Seven.

<div class="note" markdown="1">
**Reporting checklist**

Baseline year.

Pollution target used — guideline, national standard, or a specific policy commitment.

Geographic unit.

Population-weighting method.

PM₂.₅ data source, with vintage.

Life-expectancy coefficient.

Uncertainty and caveats.
</div>

A post that cannot fill all seven is not finished. It is a draft with a headline. The markup for the
box is in the [formatting reference]({{ '/formatting/' | relative_url }}#the-methods-box).

## Numbers

- **Units, always.** µg/m³. Never a bare concentration.
- **Round honestly.** Two significant figures for a life-expectancy gain; a third implies a
  precision the coefficient does not have.
- **Never restate a standing figure in prose.** The WHO guideline and β live in `_config.yml`.
  Write `{% raw %}{{ site.who_guideline }}{% endraw %}` and `{% raw %}{{ site.aqli_coefficient }}{% endraw %}`, so
  that when a value is revised your post updates with it instead of quietly going stale.
- **Derive, don't retype.** A gain of 4.9 years should be computed in the page, not typed:
  `{% raw %}{{ page.pm25 | minus: site.who_guideline | times: site.aqli_coefficient | round: 2 }}{% endraw %}`.
- **Label demo data as demo data.** In the standfirst or the first figure caption, not in a footnote.

## Colour

Colour on this site means a measurement. The exposure ramp belongs to the ruler, to data swatches in
tables, and to charts. It does not belong to headings, buttons, callouts, or decoration. If you find
yourself wanting an accent colour to make a section feel important, the section is not important
enough.

## Words we do not use

**"Silent killer", "toxic cocktail", "airpocalypse", "gasping", "choking".** They spend the reader's
attention on the writer's vocabulary. The number is more frightening than the adjective.

**"Studies show" / "experts say".** Name the study. Link it. If you cannot, cut the sentence.

**"Worse than smoking N cigarettes a day."** It is a rhetorical conversion, not a finding, and it
ages badly the moment someone checks it.

**"Simply" / "just" / "of course".** They tell a reader who does not follow that they should have.

**"Explore", "delve", "dive into", "unpack".** Say what you found.

## Before you open the pull request

- The headline is a claim.
- The first figure appears above the fold, with its unit.
- The methods box has seven lines and all seven are filled.
- Every standing figure is a Liquid reference, not a typed number.
- `place:` and `pm25:` are in the front matter if the post is about a place, so the ruler renders.
- Nothing in the piece is coloured that is not measuring something.
- Someone who disagrees with you could reproduce your figure from what is on the page.

That last one is the whole standard. Everything above is a way of meeting it.
