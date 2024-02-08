#!/bin/bash

# If any command errors, stop the script
set -e

# Store the real CWD
ME="$(readlink -f "$0")"
CODE_HOME="$(dirname "$ME")"

# Find the most reasonable candidate build file
SOURCE="$1"
if [ -z "$SOURCE" ]; then
    SOURCE="$(readlink -f "$CODE_HOME/4coder_default_bindings.cpp")"
fi
echo SOURCE = $SOURCE

opts="-Wno-write-strings -Wno-null-dereference -Wno-comment -Wno-switch -Wno-missing-declarations -Wno-logical-op-parentheses -g -DOS_LINUX=1 -DOS_WINDOWS=0 -DOS_MAC=0"
arch=-m64

DEBUG_MODE=-g
RELEASE_MODE="-g -O3"

BUILD_MODE="$DEBUG_MODE"
if [[ "$2" == "release" ]]; then
    BUILD_MODE="$RELEASE_MODE"
fi

echo BUILD_MODE: $BUILD_MODE
preproc_file=4coder_command_metadata.i
meta_macros="-DMETA_PASS"
g++ -I"$CODE_HOME" $meta_macros $arch $opts $BUILD_MODE -std=c++11 "$SOURCE" -E -o $preproc_file
g++ -I"$CODE_HOME" $opts $BULID_MODE -std=c++11 "$CODE_HOME/4coder_metadata_generator.cpp" -o "$CODE_HOME/metadata_generator"
"$CODE_HOME/metadata_generator" -R "$CODE_HOME" "$PWD/$preproc_file"

g++ -I"$CODE_HOME" $arch $opts $BUILD_MODE -std=gnu++0x "$SOURCE" -shared -o custom_4coder.so -fPIC

rm "$CODE_HOME/metadata_generator"
rm $preproc_file
