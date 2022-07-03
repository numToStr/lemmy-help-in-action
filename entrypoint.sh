#!/bin/sh -l

wget -qO- https://github.com/numToStr/lemmy-help/releases/latest/download/lemmy-help-x86_64-unknown-linux-gnu.tar.gz | tar x -vz

doc=$(./lemmy-help "$1" "$2")

echo "::set-output name=doc::$doc"
