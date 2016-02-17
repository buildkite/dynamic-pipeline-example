#!/bin/bash

set -eu

echo "steps:"

# A step for each dir in specs/

find specs/* -type d | while read -r D; do
  echo "  - command: \"$D/test.sh\""
  echo "    label: \"$(basename "$D")\""
done

# A deploy step only if it's the master branch

if [[ "$BUILDKITE_BRANCH" == "master" ]]; then
  echo "  - wait"
  echo "  - command: \"echo Deploy!\""
  echo "    label: \":rocket:\""
fi
