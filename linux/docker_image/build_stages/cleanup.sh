#!/bin/bash
set -e
source /pbba_build/shared/lib/library.sh

header "Cleaning up"
run yum clean -y all
run /usr/local/rvm/bin/rvm cleanup all
run rm -f /usr/local/rvm/gems/*/cache/*.gem
run rm -rf /pbba_build /tmp/*
run rm -rf /hbb/share/doc /hbb/share/man
