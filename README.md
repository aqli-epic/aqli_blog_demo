# Air Quality Life Index Blog — GitHub Pages Demo

This is a minimal Jekyll-powered GitHub Pages blog built mostly with Markdown.

## Local preview

```bash
bundle install
bundle exec jekyll serve
```

Open:

```text
http://127.0.0.1:4000/aqli-blog/
```

## GitHub Pages deployment

1. Create a GitHub repository, for example `aqli-blog`.
2. Upload/push these files to the repository root.
3. Edit `_config.yml`:
   - `url: "https://YOUR-USERNAME.github.io"`
   - `baseurl: "/aqli-blog"` if the repo is named `aqli-blog`
4. Go to repository **Settings → Pages**.
5. Under **Build and deployment**, choose:
   - Source: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/root**
6. Save.
7. Your site should appear at:

```text
https://YOUR-USERNAME.github.io/aqli-blog/
```

## Add a new blog post

Create a file in `_posts/` using this naming pattern:

```text
YYYY-MM-DD-short-title.md
```

Example:

```text
_posts/2026-07-01-delhi-air-pollution-life-expectancy.md
```

Every post starts with YAML front matter:

```yaml
---
title: "Your Post Title"
date: 2026-07-01
excerpt: "One-sentence summary."
tags: [India, PM2.5, policy]
---
```
