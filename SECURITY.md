# Security Policy

## Related docs

- [CONTRIBUTING.md](CONTRIBUTING.md) — proposing formulae, submitting bumps, and running tap checks
- [FORMULA_POLICY.md](FORMULA_POLICY.md) — formula inclusion, platform support, and release requirements

## Supported Versions

This repository is a Homebrew tap — it distributes formulae that install
upstream open-source tools. Security concerns may relate to:

- Formula integrity (wrong URL, tampered checksum)
- Upstream supply-chain issues in a formula's source project
- Tap CI producing a false pass on a broken formula

## Reporting a Concern

If you find a security concern with a formula in this tap:

1. Open a GitHub issue on this repository with a clear description
2. If the concern is severe and you prefer private contact, see the
   maintainers list on the organization profile at
   https://github.com/billybox1926-jpg
3. Include the formula name, expected vs. actual sha256 (if known),
   and the upstream project URL

## Scope

**In scope:**
- Formula URL or sha256 mismatch
- Upstream supply-chain concerns for a formula's source project
- Tap CI producing incorrect results

**Out of scope:**
- General Homebrew issues (report at https://github.com/Homebrew)
- Security bugs in upstream projects (report to the upstream project)

## Response

Issues will be triaged as quickly as possible. Formula sha256 mismatches
and URL concerns will be handled with priority since they affect all users
of the tap.
