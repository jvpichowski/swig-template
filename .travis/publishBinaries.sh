#!/bin/bash

#
# script for continous integration system to push back libraries
#

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git add project-native/src/binding/*
  git add project-native/src/swig/*
  git status
  git commit --message "[skip ci] Updating native binaries from latest travis build: $TRAVIS_JOB_NUMBER"
}

upload_files() {
  git remote add origin-pushback https://${GH_TOKEN}@github.com/jvpichowski/swig-template.git > /dev/null 2>&1
  git branch traivs-binary-deployment 
  git checkout ${TRAVIS_BRANCH}
  git merge traivs-binary-deployment
  git commit --amend -m "[skip ci] Merge branch 'travis-binary-deployment'"
  git push --set-upstream origin-pushback ${TRAVIS_BRANCH}
}

if [ "${TRAVIS_TAG}" != "" ]; then
  echo "Pushing binaries"
  setup_git
  commit_website_files
  upload_files
else
  echo "Skipping push"
fi
