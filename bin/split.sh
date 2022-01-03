#!/usr/bin/env zsh

# Check provided arguments
if [ "$#" -lt "2" ]; then
    echo 'Please provide a remote and local for splitting'
    echo 'Usage: split.sh <remote> <local>'
    echo 'Example: split.sh git@github.com:factorit-ddd/products.git apps/products'
    exit
fi
# Get directory of the other scripts
BIN_DIR=$(dirname "$0")
cd "$BIN_DIR/../"
COMMIT_SH=$(git rev-parse HEAD)
COMMIT_MSG=$(git log -1 --pretty=%B)
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

REMOTE="$1"
LOCAL="$2"
CLONE_DIR=$(mktemp -d)

git clone -- "$REMOTE" "$CLONE_DIR"

BUILD_DIR=$(mktemp -d)
mkdir "$BUILD_DIR/.git"
cp -r "$CLONE_DIR/.git" "$BUILD_DIR"
rm -rf "$CLONE_DIR"

cp -ra "$LOCAL/." "$BUILD_DIR"

cd $BUILD_DIR
git add .
git commit --message "$COMMIT_MSG"
git push --quiet origin main

git tag "$LATEST_TAG" -m "Publishing $LATEST_TAG"
git push --quiet origin "$LATEST_TAG"

rm -rf "$BUILD_DIR"
