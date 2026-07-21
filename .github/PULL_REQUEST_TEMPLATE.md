<!--
  For a new story, fill in everything. For a fix to the site itself, delete the
  editorial sections and say what broke.
-->

## What this is

<!-- One sentence. For a story, this is close to your standfirst. -->

## Type

- [ ] New story
- [ ] Edit to a published story
- [ ] Site, tooling or docs

---

<!-- Delete everything below this line if it is not a story. -->

## The seven-line disclosure

Every post reporting a place-level figure carries these, in the methods box, in this order.
A post that cannot fill all seven is not finished — it is a draft with a headline.

| # | Line | Value |
|---|---|---|
| 1 | Baseline year | |
| 2 | Target used (guideline / national standard / commitment) | |
| 3 | Geographic unit | |
| 4 | Population-weighting method | |
| 5 | PM₂.₅ data source | |
| 6 | Life-expectancy coefficient | β = `site.aqli_coefficient` |
| 7 | Uncertainty and caveats | |

## Editorial check

- [ ] The headline is a **claim**, not a topic — it would not still make sense with the place name swapped out
- [ ] The figure and its unit appear in the first or second paragraph
- [ ] The arithmetic is shown: baseline, target, gap, coefficient, result
- [ ] There is a "what the number is not" section
- [ ] Two or three specific weaknesses are named, not gestured at
- [ ] It ends on the decision that sets the number, not a call to action
- [ ] 700–1,200 words

## Mechanical check

- [ ] File is `_posts/YYYY-MM-DD-slug.md`, date not in the future
- [ ] `section:` is one of Exposure, Policy, Method, Data, Comment
- [ ] `tags:` are drawn from the topics list only
- [ ] `place:` and `pm25:` are both set, or neither is
- [ ] No standing figure is typed into the prose — `{{ site.who_guideline }}` and `{{ site.aqli_coefficient }}` are referenced instead
- [ ] Any table with an exposure value carries its `data-pm` swatch

CI runs `script/lint-posts.rb` and will check the mechanical list for you.
