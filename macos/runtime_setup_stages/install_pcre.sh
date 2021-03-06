#!/bin/bash
set -e
ROOTDIR=`dirname "$0"`
ROOTDIR=`cd "$ROOTDIR/../.." && pwd`
source "$ROOTDIR/shared/lib/library.sh"

PCRE_VERSION=$(cat "$ROOTDIR/shared/definitions/pcre_version")

header "Installing PCRE $PCRE_VERSION"
download_and_extract pcre-$PCRE_VERSION.tar.gz \
	pcre-$PCRE_VERSION \
	https://ftp.pcre.org/pub/pcre/pcre-${PCRE_VERSION}.tar.gz
run rm -f "$WORKDIR/pcre-$PCRE_VERSION.tar.gz"
run ./configure --prefix="$OUTPUT_DIR" --enable-static --disable-shared \
	CFLAGS='-O2 -fvisibility=hidden'
run make -j$CONCURRENCY
run make install-strip
