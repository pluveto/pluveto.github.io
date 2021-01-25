#!/bin/sh
echo "Removing existing files"
rm -rf ./public/*

echo "Generating site"

hugo

echo "Updating gh-pages branch"

git add ./public && git commit -m "Publishing to gh-pages"

git subtree push --prefix ./public origin gh-pages