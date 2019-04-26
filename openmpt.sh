#!/usr/bin/env bash
set -e

export TERM=dumb

export WINEARCH="win64"
export WINEPREFIX="$HOME/.OpenMPT-x64"
export WINEDLLOVERRIDES="winemenubuilder.exe,mscoree,mshtml="

bindir=`dirname "$0"`
rootdir="$bindir"/../..
sharedir="$bindir"/../share
wine="$bindir"/wine64

echo "bindir=$bindir" 1>&2
echo "rootdir=$rootdir" 1>&2
echo "sharedir=$sharedir" 1>&2
echo "wine=$wine" 1>&2

exec "$wine" "$sharedir"/OpenMPT/mptrack.exe "$@"
