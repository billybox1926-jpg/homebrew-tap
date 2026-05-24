# Billy Box Homebrew Tap

Homebrew tap for Billy Box command-line tools.

This repository is the public Homebrew distribution point for selected open-source CLI releases from `billybox1926-jpg`.

## Install

Once a formula is available, install tools with:

```bash
brew install billybox1926-jpg/tap/<formula-name>
```

For example, after `cargo-feature-lens` is added:

```bash
brew install billybox1926-jpg/tap/cargo-feature-lens
```

You can also tap the repository first:

```bash
brew tap billybox1926-jpg/tap
brew install <formula-name>
```

## Current status

This tap has been initialized and is ready for formula additions.

Formulae should only be added when the upstream project has:

- a tagged release
- a stable downloadable source archive or binary artifact
- a verified `sha256`
- a working install/test block for Homebrew

## Planned formulae

Likely first candidates:

- `cargo-feature-lens`
- `mdguard`
- `terraform-plan-parser`

## Formula layout

Formula files live in:

```text
Formula/<formula-name>.rb
```

Example:

```text
Formula/cargo-feature-lens.rb
```

## Maintainer workflow

For each new formula:

1. Confirm the upstream GitHub release tag.
2. Confirm the artifact URL.
3. Calculate the artifact SHA256.
4. Add the formula under `Formula/`.
5. Run local Homebrew validation:

```bash
brew audit --strict --online billybox1926-jpg/tap/<formula-name>
brew test billybox1926-jpg/tap/<formula-name>
```

## Notes

This tap should stay boring, conservative, and release-driven. No placeholder formulae should be added with guessed URLs, guessed checksums, or unreleased package metadata.
