#!/bin/bash
set -eux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  platform="linux64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  platform="osx64"
else
  echo "Unknown OS"
  exit 1
fi
cd "$(dirname "$0")/.."

(cd extractor && cargo build --release)

# we are in a cargo workspace rooted at the git checkout
BIN_DIR=extractor/target/release
"$BIN_DIR/codeql-extractor-clarity" generate --dbscheme ql/lib/clarity.dbscheme --library ql/lib/codeql/clarity/ast/internal/TreeSitter.qll

codeql query format -i ql/lib/codeql/clarity/ast/internal/TreeSitter.qll

rm -rf extractor-pack
mkdir -p extractor-pack
# cp -r codeql-extractor.yml downgrades tools ql/lib/clarity.dbscheme ql/lib/clarity.dbscheme.stats extractor-pack/
cp -r codeql-extractor.yml tools ql/lib/clarity.dbscheme ql/lib/clarity.dbscheme.stats extractor-pack/
mkdir -p extractor-pack/tools/${platform}
cp "$BIN_DIR/codeql-extractor-clarity" extractor-pack/tools/${platform}/extractor
