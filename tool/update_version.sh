#!/bin/bash

# only install replace if it is not currently installed
if [[ ! $(command -v "replace") ]]; then
    dart pub global activate replace
fi

if [[ "$1" == "--to-branch" ]]; then
    version=$(git rev-parse --abbrev-ref HEAD)
else
    # the directory for the current script (update_version.sh)
    SCRIPT_DIR=$(dirname "$0")

    version=$(cat "$SCRIPT_DIR"/../version.txt)
    version="${version%"${version##*[![:space:]]}"}" # trim leading whitespace
    version="${version#"${version%%[![:space:]]*}"}" # trim trailing whitespace
fi

# Update all `Workiva/gha-dart-oss/*@vx.x.x` references in yaml and markdown files
dart pub global run replace "Workiva/gha-dart-oss/(.*)@.*" "Workiva/gha-dart-oss/\1@$version" "./**.yaml" "./**.yml" "./**.md"