# Air Quality Life Index Blog — Colorful GitHub Pages Demo

This is a Markdown-first AQLI blog built with Jekyll and GitHub Pages.

## What is included

- Colorful editorial homepage
- Elegant fonts using Source Serif 4 + Inter
- Responsive navigation
- Blog listing page
- Topics page
- Methods page
- Data page
- Two demo blog posts
- Reusable layouts and includes
- CSS-only visual identity
- Small JavaScript enhancement for navigation and reveal animations

## Publish on GitHub Pages

1. Create a repo, for example `aqli-blog`.
2. Upload all files to the repo root.
3. Edit `_config.yml`:
   - `url: "https://YOUR-USERNAME.github.io"`
   - `baseurl: "/aqli-blog"`
4. Go to **Settings → Pages**.
5. Choose:
   - Source: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/root**
6. Save.

Your demo should appear at:

```text
https://YOUR-USERNAME.github.io/aqli-blog/
```

## Local preview

```bash
bundle install
bundle exec jekyll serve
```

Open:

```text
http://127.0.0.1:4000/aqli-blog/
```
