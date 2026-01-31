[![Slack Channel](https://img.shields.io/badge/Support_Channel-Slack-purple)](https://slack.com/app_redirect?channel=support-frontend-dx)
[![Maintainer](https://img.shields.io/badge/maintainer-FEDX-silver)](https://wiki.atl.workiva.net/display/FEF/Frontend+Dev+Experience)
[![CI](https://github.com/Workiva/gha-dart-oss/actions/workflows/build.yaml/badge.svg?branch=master)](https://github.com/Workiva/gha-dart-oss/actions/workflows/build.yaml)

# gha-dart-oss

Reusable GitHub Actions workflows for Workiva's open-source Dart projects.

## Overview

This repository provides a collection of reusable GitHub Actions workflows designed for [Workiva's](https://github.com/Workiva) open-source Dart projects. It supports configuration with [`dart_dev`](https://github.com/Workiva/dart_dev), [`build_runner`](https://pub.dev/packages/build_runner), and basic Dart packages, enabling standardized CI/CD pipelines across Dart repositories.

## Quick Start

### Prerequisites

- A Dart project hosted on GitHub
- GitHub Actions enabled for your repository

### Installation

Reference the workflows in your repository's `.github/workflows/` directory:

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
  checks:
    uses: Workiva/gha-dart-oss/.github/workflows/checks.yaml@v0.1.14

  build:
    uses: Workiva/gha-dart-oss/.github/workflows/build.yaml@v0.1.14

  unit-tests:
    uses: Workiva/gha-dart-oss/.github/workflows/test-unit.yaml@v0.1.14
```

### Usage

#### Available Workflows

| Workflow | Description |
|----------|-------------|
| `checks.yaml` | Runs analysis, formatting, and dependency validation against Dart source |
| `build.yaml` | Generates SBOM and uploads it using anchore/sbom-action |
| `test-unit.yaml` | Runs unit tests in dev mode (vm/ddc), and optionally `--release` for webdev configured repos |
| `publish.yaml` | Generates and uploads SBOM, and publishes to pub.dev |

#### Publishing to pub.dev

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
  publish:
    uses: Workiva/gha-dart-oss/.github/workflows/publish.yaml@v0.1.14
```

## Documentation

- [dart_dev](https://github.com/Workiva/dart_dev) - Dart development tooling
- [build_runner](https://pub.dev/packages/build_runner) - Dart build system

## Development

### Setup

Clone the repository:

```bash
git clone https://github.com/Workiva/gha-dart-oss.git
cd gha-dart-oss
```

### Testing

Tests are run via GitHub Actions workflows in the `.github/workflows/` directory. Test fixtures are located in the `__tests__/fixtures/` directory.

### Building

This repository contains GitHub Actions workflows and does not require a build step.

## Contributing

Contributions are welcome. Please open an issue or pull request on [GitHub](https://github.com/Workiva/gha-dart-oss).

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Support

- **Slack**: [#support-frontend-dx](https://slack.com/app_redirect?channel=support-frontend-dx)
- **Issues**: [GitHub Issues](https://github.com/Workiva/gha-dart-oss/issues)
- **Maintainer**: [Frontend Dev Experience](https://wiki.atl.workiva.net/display/FEF/Frontend+Dev+Experience)
