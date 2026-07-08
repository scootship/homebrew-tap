# homebrew-tap

Homebrew formulae for tools in the [scootship](https://github.com/scootship) org — the
`scoot` agent daemon, the `scootship` fleet management center, `scootlens`, and related
tools.

## Install

```sh
brew install scootship/tap/<formula>
```

## How this repository works

One shared `Formula/` directory hosts formulae for several unrelated `scootship`-org
projects, the same shared-repository model used by
[`apt-tap`](https://github.com/scootship/apt-tap) for `.deb` packages.

Each source project's own release workflow is responsible for adding or updating its
formula here on every tagged release, authenticated with a PAT stored as a secret in
that project's own repository (e.g. `scootship/scootship` uses `SCOOTSHIP_RELEASE_TOKEN`).
This repository itself has no build step — a formula update is just a normal commit to
a `.rb` file under `Formula/`.

## Adding a new package from another project

1. Cut a release in your own project that publishes the platform archives Homebrew
   formulae expect (with published SHA-256 checksums).
2. From your project's own release workflow, write or update
   `Formula/<name>.rb` here and push it to `main`, authenticated with a PAT stored as a
   secret in your project (not here).
3. `brew install scootship/tap/<name>` then resolves against this repository.
