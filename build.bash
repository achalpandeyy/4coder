#!/bin/bash

set -e

# build 4coder
echo "Building 4coder.."
cmd.exe /c "build.bat"

# build 4coder_fleury
pushd "src/custom/4coder_fleury"
echo "Building 4coder_fleury.."
cmd.exe /c "build.bat"
popd