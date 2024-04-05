# gha-dart-oss

Workflows for use with Dart projects.

The majority of workflows assume [dart_dev](https://github.com/Workiva/dart_dev) is installed and being used within the repo


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

  # Runs unit tests in both d2js and ddc
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