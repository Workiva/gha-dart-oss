#!/bin/bash

PACKAGE_NAME=$(yq '.name' pubspec.yaml)

results=$(find ./lib/src -name "*.dart" -exec grep -l "^import ['\"]package:$PACKAGE_NAME/[^/]*.dart" {} +)

if [[ "$results" != "" ]]; then
    echo
    echo "::error::Entrypoint imports found in the following files:"
    echo "$results"
    echo
    echo "::error::Relying on specific files is always preferred over importing the package's entrypoint file"
    echo "::error::Please update these to reference specific files in $PACKAGE_NAME, instead of the entrypoint."
    exit 1
fi
