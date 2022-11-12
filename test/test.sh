#!/bin/bash

#set -ex

cd "$(dirname "$0")"

DIFF=${DIFF:-diff}
TMP=${TMPDIR:-/tmp}

test_path="$TMP"/khs_zigtest
syntax_path="$test_path"/org.kde.syntax-highlighting/syntax

if [[ ! -d "$syntax_path" ]]; then
  mkdir -p "$syntax_path"
  ln -s "$PWD"/../zig.xml "$syntax_path"
  # when compiled with -DQRC_SYNTAX=OFF
  ln -s /usr/share/org.kde.syntax-highlighting/syntax/{doxygen,alert,comments,modelines,spdx-comments}.xml "$syntax_path" ||:
fi

set -e -o pipefail
XDG_DATA_DIRS="$test_path" kate-syntax-highlighter --output-format=ansi256colors --syntax-trace=format input.zig | sed 's/\x1b\[[^m]*m//g;s/\x1b\[K//g' > "$test_path"/output

set -x
$DIFF output.ref "$test_path"/output
