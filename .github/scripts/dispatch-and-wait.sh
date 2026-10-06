#!/usr/bin/env bash
# Triggers a workflow in gendercomics/website and waits for it to finish,
# so this run only turns green once the site is actually deployed.
# Usage: dispatch-and-wait.sh <workflow file> <website ref> <content sha>
set -euo pipefail

workflow=$1
ref=$2
content_ref=$3
repo=gendercomics/website

since=$(date -u +%Y-%m-%dT%H:%M:%SZ)
gh workflow run "$workflow" --repo "$repo" --ref "$ref" -f content_ref="$content_ref"

run_id=''
for _ in $(seq 30); do
  sleep 5
  run_id=$(gh run list --repo "$repo" --workflow "$workflow" --event workflow_dispatch --limit 5 \
    --json databaseId,createdAt -q "[.[] | select(.createdAt >= \"$since\")] | last | .databaseId // empty")
  [ -n "$run_id" ] && break
done
[ -n "$run_id" ] || { echo "::error::could not find the dispatched $workflow run"; exit 1; }

echo "following https://github.com/$repo/actions/runs/$run_id"
gh run watch "$run_id" --repo "$repo" --exit-status --interval 30
