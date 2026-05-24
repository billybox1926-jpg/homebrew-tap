# Contributing

Thanks for helping keep this tap tidy and useful.

This repository is intentionally conservative: formulae should be release-backed, checksum-verified, and easy to test.

## Related docs

- [FORMULA_POLICY.md](FORMULA_POLICY.md) — formula inclusion, platform support, and release requirements
- [SECURITY.md](SECURITY.md) — reporting checksum, URL, and supply-chain concerns

## Formula policy

Before adding or updating a formula, read [FORMULA_POLICY.md](FORMULA_POLICY.md).

For security reporting and scope, see [SECURITY.md](SECURITY.md).

The short version:

- use tagged upstream releases
- verify the exact `sha256` for the artifact Homebrew downloads
- keep formula tests local, safe, and non-destructive
- document platform support honestly
- avoid placeholder formulae with guessed metadata

## Propose a new formula

Before proposing a new formula, confirm that the upstream project has:

- a public repository or project homepage
- a tagged release
- a stable source archive or release artifact URL
- a license suitable for redistribution
- a command that can be used in a safe Homebrew `test do` block

Open an issue with:

- the upstream repository URL
- the release tag
- the planned formula name
- the target platforms
- any known install or runtime limitations

Do not add placeholder formulae with guessed URLs, guessed checksums, or unreleased metadata.

## Submit a version bump

For a formula bump:

1. Confirm the upstream release tag.
2. Confirm the source archive or artifact URL.
3. Download the exact artifact Homebrew will fetch.
4. Calculate the `sha256`.
5. Update the formula under `Formula/`.
6. Update the test block if the CLI behavior changed.
7. Run Homebrew validation locally when possible.
8. Let GitHub Actions run the tap check.

## Run the tap check locally

From a machine with Homebrew installed:

```bash
brew tap billybox1926-jpg/tap /path/to/homebrew-tap
brew audit --strict --online billybox1926-jpg/tap/<formula-name>
brew install --build-from-source billybox1926-jpg/tap/<formula-name>
brew test billybox1926-jpg/tap/<formula-name>
```

For example:

```bash
brew audit --strict --online billybox1926-jpg/tap/cargo-feature-lens
brew test billybox1926-jpg/tap/cargo-feature-lens
```

If local Homebrew is unavailable, use the repository's GitHub Actions tap check.

## Windows note

This is a Homebrew tap, so formulae target Homebrew-supported environments. Windows install instructions may be documented separately when an upstream tool supports Cargo or another Windows-friendly installer.
