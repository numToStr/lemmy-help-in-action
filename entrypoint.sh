#!/bin/sh -l

file=lemmy-help-x86_64-unknown-linux-gnu.tar.gz
# version=${3:-latest}

wget -q --show-progress https://github.com/numToStr/lemmy-help/releases/latest/download/${file}

tar xvz --strip 1 $file

doc=$(./lemmy-help "$1" "$2")

echo "::set-output name=doc::$doc"
