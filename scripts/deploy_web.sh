#!/usr/bin/env sh
# abort on errors
set -e

# install dependencies

flutter build web --web-renderer html --base-href='/crochet_counter/'

# create a fresh new git repo in the output directory

cd ./build/web
ls


git init
git add -A 
git commit -m 'deploy'

git push -f git@github.com:nelsonlpco/crochet_counter.git main:gh-pages  