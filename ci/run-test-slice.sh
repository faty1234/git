#!/bin/sh
#
# Test Git in parallel
#

. ${0%/*}/lib.sh

make --quiet -C t T="$(cd t &&
	./helper/test-tool path-utils slice-tests "$1" "$2" t[0-9]*.sh |
	tr '\n' ' ')"

# Run the git subtree tests only if main tests succeeded
test 0 != "$1" || make -C contrib/subtree test

check_unignored_build_artifacts
