#!/usr/bin/env bash
git submodule init
git submodule update
hugo
git checkout master
cp -R public/* .
git add .
git commit -m "deploy"
git push --force origin master
git checkout develop
rm -rf public
