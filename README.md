# Billy Box Homebrew Tap

Homebrew tap for Billy Box command-line tools.

This repository is the public Homebrew distribution point for selected open-source CLI releases from `billybox1926-jpg`.

## Install with Homebrew

Install a formula directly from this tap:

```bash
brew install billybox1926-jpg/tap/<formula-name>
```

For example:

```bash
brew install billybox1926-jpg/tap/cargo-feature-lens
```

You can also tap the repository first:

```bash
brew tap billybox1926-jpg/tap
brew install cargo-feature-lens
```

## Windows and Rust install

Homebrew is usually used from macOS or Linux-style shell environments. If you are on Windows PowerShell and see an error like this:

```text
brew : The term 'brew' is not recognized
```

that means Homebrew is not installed or is not available on your `PATH` in that shell.

For Rust-based tools, the simplest Windows path is usually Cargo:

```powershell
cargo install cargo-feature-lens
cargo-feature-lens --help
```

If Cargo installs the executable successfully, the tool is ready to use from PowerShell as long as Cargo's bin directory is on your `PATH`.

## Available formulae

- `cargo-feature-lens` — audit and visualize Cargo dependency feature footprints
- `terraform-plan-parser` — turn Terraform plan JSON into clean human-readable summaries

## Planned formulae

Likely next candidates:

- `mdguard`

## Contributing and formula policy

Contribution guidance is documented in [CONTRIBUTING.md](CONTRIBUTING.md).

Formula inclusion and platform support rules are documented in [FORMULA_POLICY.md](FORMULA_POLICY.md).

Security policy and reporting guidance are documented in [SECURITY.md](SECURITY.md).

In short, formulae should only be added when the upstream project has:

- a tagged release
- a stable downloadable source archive or binary artifact
- a verified `sha256`
- a working install/test block for Homebrew

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
4. Add or update the formula under `Formula/`.
5. Run local Homebrew validation:

```bash
brew audit --strict --online billybox1926-jpg/tap/<formula-name>
brew test billybox1926-jpg/tap/<formula-name>
```

When local Homebrew is unavailable, rely on the repository's GitHub Actions tap check.

## Update process

Formula updates are currently manual and release-driven.

For each version bump:

1. Wait for the upstream project to publish a tagged release.
2. Download the exact source archive or release artifact that Homebrew will use.
3. Calculate the new `sha256`.
4. Update the formula `url`, `sha256`, and any test details if needed.
5. Let Tap CI run on GitHub Actions.

Automated bumps can be added later if the tap grows, but manual updates are safer while the formula set is small.

## Notes

This tap should stay boring, conservative, and release-driven. No placeholder formulae should be added with guessed URLs, guessed checksums, or unreleased package metadata.
