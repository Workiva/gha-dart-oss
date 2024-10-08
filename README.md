# gha-dart-oss

Workflows for use with [Workiva's](https://github.com/Workiva) OpenSource Dart projects.

Workflows support configuration with [`dart_dev`](https://github.com/Workiva/dart_dev), [`build_runner`](https://pub.dev/packages/build_runner), and basic dart packages.


## Basic Dart CI Setup
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
  # Runs analysis, formatting, and dependency validation, against the dart source
  checks:
    uses: Workiva/gha-dart-oss/.github/workflows/checks.yaml@v1.0.0

  # Generates sbom and uploads it using anchore/sbom-action
  build:
    uses: Workiva/gha-dart-oss/.github/workflows/build.yaml@v1.0.0

  # Runs unit tests in dev mode (vm/ddc), and optionally `--release` if executing
  # against a webdev configured repo
  unit-tests:
    uses: Workiva/gha-dart-oss/.github/workflows/test-unit.yaml@v1.0.0
```

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
    uses: Workiva/gha-dart-oss/.github/workflows/publish@v1.0.0
```