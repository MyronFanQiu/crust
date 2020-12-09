#!/usr/bin/env bash

set -e

echo "*** Initializing WASM build environment"

if [ -z $CI_PROJECT_NAME ] ; then
   rustup update nightly
   rustup update stable
fi

# do not need wasm for the alpha version
rustup toolchain install nightly-2020-10-06
rustup default nightly-2020-10-06
rustup target add wasm32-unknown-unknown

# install dependencies
sudo apt update && sudo apt install libssl-dev