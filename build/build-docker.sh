#!/usr/bin/env bash

git clone https://github.com/fhimpg/archive.git archive
chmod go=u-w build/archive.conf
docker build --rm=true --tag={yourname}/fhimpg-archive archive