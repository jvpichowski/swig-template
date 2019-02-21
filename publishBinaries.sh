#!/bin/bash

#
# script for continous integration system to push back libraries
#

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git add project-native/src/binding/resources/native/*
  git commit --message "[skip ci] Updating native binaries for latest build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pushback https://${GH_TOKEN}@github.com/jvpichowski/swig-template.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pushback ${TRAVIS_BRANCH}
}

if ${TRAVIS_PULL_REQUEST} = 'false'; then
  setup_git
  commit_website_files
  upload_files
fi
