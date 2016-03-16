#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir "$1"

cp $DIR/templates/build.sh.template $1/build.sh
cp $DIR/templates/index.html.template $1/index.html
cp $DIR/templates/test.ml.template $1/test.ml
