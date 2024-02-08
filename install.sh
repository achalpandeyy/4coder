#!/bin/bash

set -e

INSTALL_LOCATION=~/achal/tools/4coder

mkdir -p $INSTALL_LOCATION

#
# NOTE(achal): Copy over the main 4coder files
#
cp build/4ed $INSTALL_LOCATION/4ed > /dev/null
cp build/4ed_app.so $INSTALL_LOCATION/4ed_app.so > /dev/null
cp build/custom_4coder.so $INSTALL_LOCATION/custom_4coder.so > /dev/null

if [ ! -e "$INSTALL_LOCATION/bindings.4coder" ]; then
	echo Overwriting bindings.4coder..
	cp build/bindings.4coder $INSTALL_LOCATION/bindings.4coder
fi

if [ ! -e "$INSTALL_LOCATION/config.4coder" ]; then
	echo Overwriting config.4coder..
	cp build/config.4coder $INSTALL_LOCATION/config.4coder
fi

#
# NOTE(achal): Copy over fonts and themes
#

if [ ! -e "$INSTALL_LOCATION/fonts" ]; then
	echo Overwriting fonts..
	cp -r build/fonts $INSTALL_LOCATION/fonts > /dev/null
fi

if [ ! -e "$INSTALL_LOCATION/themes" ]; then
	echo Overwriting themes..
	cp -r build/themes $INSTALL_LOCATION/themes > /dev/null
fi

#
# NOTE(achal): Copy over Ryan's layer
#

mkdir -p $INSTALL_LOCATION/4coder_fleury

cp build/4coder_fleury/custom_4coder.so $INSTALL_LOCATION/4coder_fleury/custom_4coder.so > /dev/null

if [ ! -e "$INSTALL_LOCATION/4coder_fleury/bindings.4coder" ]; then
	echo Overwriting 4coder_fleury/bindings.4coder..
	cp build/4coder_fleury/bindings.4coder $INSTALL_LOCATION/4coder_fleury/bindings.4coder
fi

if [ ! -e "$INSTALL_LOCATION/4coder_fleury/config.4coder" ]; then
	echo Overwriting 4coder_fleury/config.4coder..
	cp build/4coder_fleury/config.4coder $INSTALL_LOCATION/4coder_fleury/config.4coder
fi

echo Successfully installed at $INSTALL_LOCATION