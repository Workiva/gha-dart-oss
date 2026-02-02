[![Slack Channel](https://img.shields.io/badge/Support_Channel-Slack-purple)](https://slack.com/app_redirect?channel=support-frontend-dx)
[![Maintainer](https://img.shields.io/badge/maintainer-FEDX-silver)](https://wiki.atl.workiva.net/display/FEF/Frontend+Dev+Experience)
[![Documentation](https://img.shields.io/badge/Additional_Documentation-blue)](https://frontend.workiva.dev)

# gha-dart-oss

Reusable GitHub Actions workflows for [Workiva's](https://github.com/Workiva) open source Dart projects. These workflows provide standardized CI/CD pipelines including code analysis, testing, building, and publishing to pub.dev. Designed for teams maintaining Dart packages with support for [`dart_dev`](https://github.com/Workiva/dart_dev), [`build_runner`](https://pub.dev/packages/build_runner), and basic Dart configurations.

## Quick Start

### Prerequisites

- A Dart project hosted on GitHub
- GitHub Actions enabled on your repository

### Installation

Add the following workflow files to your repository's `.github/workflows/` directory:

**CI Workflow** (`.github/workflows/ci.yaml`):

```yaml
name: CI

on:
  pull_request:
  push:
    branches:
      - master
    tags:
      - '**'

jobs:
  # Runs analysis, formatting, and dependency validation against the dart source
  checks:
    uses: Workiva/gha-dart-oss/.github/workflows/checks.yaml@v0.1.14

  # Generates sbom and uploads it using anchore/sbom-action
  build:
    uses: Workiva/gha-dart-oss/.github/workflows/build.yaml@v0.1.14

  # Runs unit tests in dev mode (vm/ddc), and optionally `--release` if executing
  # against a webdev configured repo
  unit-tests:
    uses: Workiva/gha-dart-oss/.github/workflows/test-unit.yaml@v0.1.14
```

**Publish Workflow** (`.github/workflows/publish.yaml`):

```yaml
name: Publish

on:
  push:
    tags:
      - '[0-9]+.[0-9]+.[0-9]+'

permissions:
  contents: write
  id-token: write
  pull-requests: write

jobs:
  # Generates and uploads sbom, and publishes to pub.dev
  publish:
    uses: Workiva/gha-dart-oss/.github/workflows/publish.yaml@v0.1.14
```

### Usage

Once the workflows are added to your repository, they will automatically run on pull requests and pushes to the master branch. The publish workflow triggers when you push a semver tag (e.g., `1.0.0`).

## Documentation

- [GitHub Actions Reusable Workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
- [dart_dev Documentation](https://github.com/Workiva/dart_dev)

## Development

### Setup

Clone the repository and ensure you have the necessary tools installed:

```bash
git clone https://github.com/Workiva/gha-dart-oss.git
cd gha-dart-oss
```

### Testing

Tests are run via GitHub Actions workflows in the `__tests__/` directory. Each workflow validates the reusable workflows against fixture projects.

### Building

Use the Makefile to update versions across workflow files:

```bash
make rosie
```

## Support

- **Slack**: [#support-frontend-dx](https://slack.com/app_redirect?channel=support-frontend-dx)
- **Issues**: [GitHub Issues](https://github.com/Workiva/gha-dart-oss/issues)
- **Maintainer**: [Frontend Dev Experience Team](https://wiki.atl.workiva.net/display/FEF/Frontend+Dev+Experience)
