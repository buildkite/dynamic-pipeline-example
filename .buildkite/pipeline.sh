#!/bin/bash

set -eu

echo "steps:"

# Wait for the pipeline to be full generated before running subsequent steps
# Can be omitted to run as uploaded!
echo "  - wait"

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
