#!/usr/bin/env bash
git submodule init
git submodule update
git add .
git commit -m "update develop"
hugo
git checkout master
cp -R public/* .
git add .
git commit -m "deploy"
git push --force origin master
git checkout develop
git reset --hard head
rm -rf public
