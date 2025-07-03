#!/bin/bash

set -eu

echo "dag: true"
echo "steps:"

# A step for each dir in specs/

find specs/* -type d | while read -r D; do
  echo "  - command: \"$D/test.sh\""
  echo "    label: \"$(basename "$D")\""
done

# A deploy step only if it's the main branch

if [[ "$BUILDKITE_BRANCH" == "main" ]]; then
  echo "  - wait"
  echo "  - command: \"echo Deploy!\""
  echo "    label: \":rocket:\""
fi
