#!/bin/bash
set -e
ROOTDIR=`dirname "$0"`
ROOTDIR=`cd "$ROOTDIR/../.." && pwd`
source "$ROOTDIR/shared/lib/library.sh"

CCACHE_VERSION=$(cat "$ROOTDIR/shared/definitions/ccache_version")

header "Installing ccache $CCACHE_VERSION"
download_and_extract ccache-$CCACHE_VERSION.tar.gz \
	ccache-$CCACHE_VERSION \
	https://github.com/ccache/ccache/releases/download/v${CCACHE_VERSION}/ccache-${CCACHE_VERSION}.tar.gz
run rm -f "$WORKDIR/ccache-$CCACHE_VERSION.tar.gz"
run ./configure --prefix="$OUTPUT_DIR"
run make -j$CONCURRENCY
run make install
run strip "$OUTPUT_DIR/bin/ccache"
