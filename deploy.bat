@echo off

echo "Removing existing files"
del /q .\public\*

echo "Generating site"

hugo

if not exist ./public/index.html (
    echo "Error!"
    pause >nul
    exit
)

echo "Updating gh-pages branch"

git add ./public && git commit -m "Publishing to gh-pages"

git subtree push --prefix ./public origin gh-pages