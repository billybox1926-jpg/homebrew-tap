# Formula Policy

This document defines when a command-line tool is allowed into this Homebrew tap and how platform support is described.

The goal is simple: every formula in this tap should be release-backed, checksum-verified, testable, and honest about where it is expected to work.

## Related docs

- [CONTRIBUTING.md](CONTRIBUTING.md) — proposing formulae, submitting bumps, and running tap checks
- [SECURITY.md](SECURITY.md) — reporting checksum, URL, and supply-chain concerns

## Formula states

### Candidate

A tool may be listed as a candidate when it is likely to belong in the tap but is not ready for a formula yet.

Candidate tools may be mentioned in the README, but they must not have placeholder formula files.

### Draft formula

A formula is draft-only when the formula file exists on a branch or pull request but has not yet passed validation.

Draft formulae should not be treated as stable install paths.

### Accepted formula

A formula may be committed to `main` when it meets the acceptance checklist below.

### Deprecated or removed formula

A formula may be deprecated or removed when the upstream project is archived, unsupported, unsafe to install, repeatedly fails validation, or drops the platform support required by this tap.

## Acceptance checklist

A new formula may be accepted only when all of the following are true:

- The upstream project has a tagged release.
- The release has a stable source archive or release artifact URL.
- The exact artifact used by Homebrew has a verified `sha256`.
- The formula has a clear `desc`, `homepage`, `url`, `sha256`, and `license`.
- Build dependencies are explicit and minimal.
- The install block uses the standard Homebrew path for the toolchain when possible.
- The test block runs a real command from the installed binary.
- The test does not require credentials, paid services, private repositories, or network-only behavior unless unavoidable and documented.
- The formula passes tap validation locally or in GitHub Actions.

No formula should be added with guessed release URLs, guessed checksums, unreleased metadata, or a test block that only checks that a file exists.

## Platform support policy

Homebrew formulae in this tap primarily target Homebrew-supported environments:

- macOS arm64
- macOS x86_64
- Linux x86_64

Linux arm64 is best-effort unless the upstream project and Homebrew environment clearly support it.

Windows is not a Homebrew target for this tap. If a Rust tool supports Windows through Cargo, document the Cargo install path separately, for example:

```powershell
cargo install <crate-name>
```

A tool does not need native Windows Homebrew support to be accepted into this tap, but the README must avoid implying that `brew` works in ordinary Windows PowerShell.

## Minimum platform coverage

For a formula to be accepted into `main`, it should meet this minimum:

- expected to build on macOS through Homebrew
- expected to build on Linux x86_64 through Homebrew, or clearly documented as macOS-only
- has a non-destructive test command such as `--help`, `--version`, or a small fixture-based command

For Rust CLI tools, Cargo-based Windows installation may be documented as a separate non-Homebrew path.

## If upstream drops a platform

If an upstream project drops support for a platform:

1. Stop claiming that platform in the README or formula notes.
2. Update the formula test if needed.
3. Document the change in the relevant issue or pull request.
4. If the formula no longer works on the minimum supported Homebrew targets, deprecate or remove it.

The tap should prefer honest narrow support over broad but untested claims.

## Bump and update policy

Formula updates are manual for now.

For each bump:

1. Confirm the new upstream tag.
2. Download the exact source archive or artifact used by the formula.
3. Calculate the new `sha256`.
4. Update `url`, `sha256`, and any version-sensitive tests.
5. Run local validation when possible.
6. Let Tap CI run on GitHub Actions.

Automation may be added later once the tap has enough formulae to justify it.

## Security and safety boundaries

Formulae must not require secrets, tokens, private services, or unsafe local permissions during install or test.

Formulae should not run destructive commands during tests. Test commands should be read-only, local, and predictable.
