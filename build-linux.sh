#!/bin/bash

# If any command errors, stop the script
set -e

# Set up directories

ME="$(readlink -f "$0")" # path to this script
LOCATION="$(dirname "$ME")" # project root
SRC_ROOT="$LOCATION/src"

# TODO(achal): You can most likely do this in one line with something like: mkdir -p build
if [ ! -d "$LOCATION/build" ]; then
    mkdir "$LOCATION/build"
fi
BUILD_ROOT="$LOCATION/build"
CUSTOM_ROOT="$SRC_ROOT/custom"
CUSTOM_BIN="$CUSTOM_ROOT/bin"

# Get the build mode
BUILD_MODE="$1"
if [ -z "$BUILD_MODE" ]; then
    BUILD_MODE="-DDEV_BUILD"
fi

WARNINGS="-Wno-write-strings -Wno-comment"

FLAGS="-D_GNU_SOURCE -fPIC -fpermissive $BUILD_MODE"
INCLUDES="-I$SRC_ROOT -I$CUSTOM_ROOT"

# Execute
g++ $WARNINGS $FLAGS $INCLUDES "4ed_build.cpp" -g -o "$BUILD_ROOT/4ed_build"

"$BUILD_ROOT/4ed_build"
