# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal site built with Jekyll and the [Chirpy](https://chirpy.cotes.page/) theme (`jekyll-theme-chirpy` gem), deployed to GitHub Pages.

## Build and run

- Ruby/`bundle` are not installed on the host; use the Nix flake: `nix develop` (or prefix commands with `nix develop --command`), then `bundle install` once. Gems go to `vendor/bundle`. `.devcontainer/` is an alternative.
- `flake.nix` pins nixpkgs `nixos-26.05`; only x86_64-linux is tested. It is only visible to Nix once tracked by git (`git add -N flake.nix`); commit `flake.lock` with it.
- Serve with live reload: `bash tools/run.sh` (or `bundle exec jekyll serve`).
- Build + link check (same as CI): `bash tools/test.sh`. CI runs `htmlproofer --disable-external` on the production build.
- Lint/format is `prek` (drop-in `pre-commit` replacement, reads `.pre-commit-config.yaml`; prettier, shellcheck, rubocop, html-lint, whitespace). Run `prek install` once per clone to enable the commit hook, and `prek run --files <files>` to check files manually.
- Pushing to `main` triggers `.github/workflows/pages-deploy.yml`, which deploys the site.

## Content conventions

- New posts: copy `_posts/template.md` to `_posts/YYYY-MM-DD-slug.md`. Max 2 `categories`.
- Post images live in `assets/img/<post>/`, each with a same-named low-quality placeholder in `assets/img/<post>/lqip/`. Set `media_subpath` in front matter and reference images relative to it, with `lqip='lqip/<file>'`.
- Image grids: `{% include img-row.html per_row=2 src_1='a.jpg' alt_1='...' src_2='b.jpg' alt_2='...' %}`.
- About page experience timeline is data-driven from `_data/experiences.yml` (rendered by `_includes/experiences.html`). Use `01` for an unknown month or day.
- Custom styles go in `assets/css/*.scss` and are `@use`d at the bottom of `assets/css/jekyll-theme-chirpy.scss`. Do not edit the theme's own partials.
- `assets/lib` is a git submodule (chirpy-static-assets); leave it alone.

## Style

- `.editorconfig`: 2-space indent, LF, final newline; single quotes in JS/CSS/SCSS, double quotes in YAML.
- Commit messages use Conventional Commits (`feat(post): ...`, `fix(experience): ...`, `chore: ...`).
