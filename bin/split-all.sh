#!/usr/bin/env zsh

# Get directory of the other scripts
BIN_DIR=$(dirname "$0")

$BIN_DIR/split.sh git@github.com:factorit-ddd/products.git apps/products
$BIN_DIR/split.sh git@github.com:factorit-ddd/products-core.git packages/products/core
$BIN_DIR/split.sh git@github.com:factorit-ddd/products-core-bundle.git packages/products/core-bundle

