#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

kpsewhich enverb.sty > /dev/null && exit 0

echo "enverb.sty not found, installing it."

ENVERB_URL="https://mirrors.ctan.org/macros/latex/contrib/enverb/enverb.dtx"

cd doc
curl -L $ENVERB_URL -o enverb.dtx
pdftex enverb.dtx
exit 0
