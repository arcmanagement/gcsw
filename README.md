# gcsw

Interactive `gcloud` configuration switcher. Pick a configuration from a fuzzy
list, activate it, and realign the ADC quota project — without re-running
`gcloud auth login` or opening a browser.

## Why

Switching between many `gcloud` configurations usually means:

```sh
gcloud config configurations list              # eyeball the list
gcloud config configurations activate <name>   # copy-paste the name
gcloud auth application-default login          # browser dance
```

`gcsw` collapses that into one interactive command. Once you've logged in, the
account stays authenticated, so activating a configuration switches the active
account for free. ADC only needs its quota project realigned, which `gcsw` does
without a browser.

## Install

```sh
brew tap arcmanagement/gcsw https://github.com/arcmanagement/gcsw
brew install gcsw
```

## Usage

```sh
gcsw                # pick a configuration interactively (fzf or numbered menu)
gcsw staging        # switch to the first configuration matching "staging"
gcsw -a             # also re-authenticate ADC in the browser (when the account changes)
gcsw --help
```

On switch, `gcsw`:

1. activates the chosen configuration (`gcloud config configurations activate`)
2. realigns the ADC quota project to the configuration's project — no browser
3. prints the resulting account and project

Use `-a` only when the underlying account changes; that's the one case that
needs a browser round-trip.

## Shell completion

Configuration names are completed dynamically — the list always reflects your
current `gcloud config configurations list`.

- **zsh** — installed automatically with Homebrew. Press <kbd>Tab</kbd> after
  `gcsw ` to pick a configuration. (Manual install: copy `completions/_gcsw`
  into a directory on your `fpath`.)
- **Kiro CLI** — Kiro loads plain `.js` specs from its Specs folder (Developer
  mode → Specs folder); `.ts` is not read. Run `gcsw update` to write the spec
  there automatically (see below). A reference copy ships at
  `completions/gcsw.js`.

### Refreshing the spec — `gcsw update`

```sh
gcsw update
```

Regenerates the Fig/Kiro spec from the current `gcloud config configurations
list` and writes it to your completion-specs folder, so the dropdown reflects
configurations you've added or removed. The spec keeps a dynamic generator too,
so tools that run it stay current automatically.

The first run asks for the specs-folder path (in Kiro CLI: settings → Developer
→ enable Dev mode, then set the Specs folder) and remembers it for next time.

## Requirements

- [Google Cloud CLI](https://cloud.google.com/sdk) (`gcloud`)
- [`fzf`](https://github.com/junegunn/fzf) — optional, installed automatically
  with Homebrew. Without it, `gcsw` falls back to a numbered menu.

## License

MIT — see [LICENSE](LICENSE).
