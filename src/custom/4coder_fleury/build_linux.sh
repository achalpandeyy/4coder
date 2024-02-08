#!/bin/bash

set -e

../buildsuper_x64-linux.sh ./4coder_fleury.cpp release

pushd ../../../build > /dev/null

mkdir -p 4coder_fleury

cp ../src/custom/4coder_fleury/custom_4coder.so 4coder_fleury/custom_4coder.so
cp ../src/custom/4coder_fleury/bindings.4coder 4coder_fleury/bindings.4coder
cp ../src/custom/4coder_fleury/config.4coder 4coder_fleury/config.4coder

popd > /dev/null
