---
title: "How to Read an AQLI-Style Life Expectancy Estimate"
date: 2026-06-23
excerpt: "A simple walkthrough of how PM₂.₅ concentration can be translated into a life-expectancy metric."
tags: [India, methods, policy]
---

Suppose a district has a long-term population-weighted PM₂.₅ concentration of
55 µg/m³. Suppose the target is 5 µg/m³.

The concentration gap is:

\[
55 - 5 = 50 \ \mu g/m^3
\]

If the life-expectancy response coefficient is 0.098 years per 1 µg/m³ reduction,
then the estimated gain is:

\[
50 \times 0.098 = 4.9 \text{ years}
\]

## Demo calculation

| Region | Baseline PM₂.₅ | Target PM₂.₅ | Gain coefficient | Estimated gain |
|---|---:|---:|---:|---:|
| Example District A | 55 | 5 | 0.098 | 4.90 years |
| Example District B | 38 | 5 | 0.098 | 3.23 years |
| Example District C | 22 | 5 | 0.098 | 1.67 years |

## What readers must know

This calculation is simple, but the public explanation should never be careless.

Always disclose:

- whether PM₂.₅ is population-weighted
- whether the target is WHO, national standard, or user-defined
- what year the baseline represents
- whether the estimate is district, state, country, or regional
- whether the calculation uses gridded satellite-derived PM₂.₅, monitor data, or a fused product
