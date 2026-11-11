#!/usr/bin/env bash
# Print the next release version from a pull request title and the latest version tag.
#
#   .github/scripts/next-version.sh "<pull request title>" "<latest tag, or empty>"
#
# A title starting with [MAJOR], [MINOR] or [PATCH] releases a version (semantic versioning: lower
# parts reset to 0):
#   [MAJOR] 1.4.2 -> 2.0.0    [MINOR] 1.4.2 -> 1.5.0    [PATCH] 1.4.2 -> 1.4.3
# Without a latest tag the first version is 1.0.0.
# A title without any [...] prefix releases nothing: prints nothing and exits 0 (changes that are
# not worth a release, e.g. README or workflows). Any other [...] prefix, e.g. [minor] or [WIP],
# exits 1, so that a typo does not silently skip a release.
set -euo pipefail

title="${1:-}"
latest="${2:-}"

if [[ "$title" =~ ^\[(MAJOR|MINOR|PATCH)\] ]]; then
  bump="${BASH_REMATCH[1]}"
elif [[ "$title" =~ ^\[[^]]*\] ]]; then
  echo "The pull request title prefix must be [MAJOR], [MINOR] or [PATCH], or none at all: '$title'" >&2
  exit 1
else
  exit 0  # no release
fi

if [[ -z "$latest" ]]; then
  echo "1.0.0"
  exit 0
fi
if [[ ! "$latest" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  echo "The latest tag is not major.minor.patch: '$latest'" >&2
  exit 1
fi
major="${BASH_REMATCH[1]}"
minor="${BASH_REMATCH[2]}"
patch="${BASH_REMATCH[3]}"

case "$bump" in
  MAJOR) echo "$((major + 1)).0.0" ;;
  MINOR) echo "$major.$((minor + 1)).0" ;;
  PATCH) echo "$major.$minor.$((patch + 1))" ;;
esac
