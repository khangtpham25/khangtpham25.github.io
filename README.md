# Personal Website

This GitHub website use [Chirpy theme](https://chirpy.cotes.page/) with some minor modifications.

## Features
- Auto reload after changes
- Experiences list in `_tabs/about.md`
- Image grid
- Allow emoji

# Development

Requires [Nix](https://nixos.org/download) with flakes enabled. Enter the dev shell (Ruby 3.3, Bundler, [prek](https://github.com/j178/prek) and the libraries needed to build native gems):

```sh
nix develop
bundle install
```

Install the git hook once so prek checks and formats files (prettier, rubocop, shellcheck, whitespace) on every commit

```sh
prek install
```

Gems are installed into `vendor/bundle` (git-ignored). Then test run the website

```sh
bash tools/run.sh
```

or build and check links the same way CI does

```sh
bash tools/test.sh
```

Alternatively, a devcontainer is available in `.devcontainer/` (e.g. with `devpod`).

```sh
devpod up . --devcontainer-path .devcontainer/devcontainer.json --ide=none --id=khangtpham25 
ssh khangtpham25.devpod
```

## TODO
- [ ] Add logos of skills (might be too much ?)
