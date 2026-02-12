#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"

if [[ -f tools/enverb.sty ]]; then
  cp tools/enverb.sty doc/
fi

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
	echo "Will skip deploy; just do a compile check."
        make test-compile
	exit 0
fi
#
# if we arrive here, go on with full build
#
echo "Pushing to master, doing a full build"
make manual-git
exit 0


