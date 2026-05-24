# Contributing

Thanks for helping keep this tap tidy and useful.

This repository is intentionally conservative: formulae should be release-backed, checksum-verified, and easy to test.

## Formula policy

Before adding or updating a formula, read [FORMULA_POLICY.md](FORMULA_POLICY.md).

The short version:

- use tagged upstream releases
- verify the exact `sha256` for the artifact Homebrew downloads
- keep formula tests local, safe, and non-destructive
- document platform support honestly
- avoid placeholder formulae with guessed metadata

## Typical formula workflow

1. Confirm the upstream release tag.
2. Confirm the source archive or artifact URL.
3. Download the exact artifact.
4. Calculate the `sha256`.
5. Update or add the formula under `Formula/`.
6. Run Homebrew validation locally when possible.
7. Let GitHub Actions run the tap check.

## Windows note

This is a Homebrew tap, so formulae target Homebrew-supported environments. Windows install instructions may be documented separately when an upstream tool supports Cargo or another Windows-friendly installer.
