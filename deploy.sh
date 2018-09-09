#!/usr/bin/env bash

hugo
git checkout master
cp -R public .
git add .
git commit -m "deploy"
git push origin master
git checkout develop
rm -rf public
