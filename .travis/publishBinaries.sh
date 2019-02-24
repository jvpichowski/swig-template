#!/bin/bash

#
# script for continous integration system to push back libraries
#

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  #git add project-native/src/binding/*
  #git add project-native/src/swig/*
  git status
  #git commit --message "[skip ci] Updating native binaries from latest travis build: $TRAVIS_JOB_NUMBER"
}

upload_files() {
  #git remote add origin-pushback https://${GH_TOKEN}@github.com/jvpichowski/swig-template.git > /dev/null 2>&1
  #git branch travis-binary-deployment 
  #git checkout ${TRAVIS_BRANCH}
  #git merge travis-binary-deployment
  #git pull --no-edit
  #git commit --amend -m "[skip ci] Updating native binaries from latest travis build: $TRAVIS_JOB_NUMBER"
  #git push
  #git push --set-upstream origin-pushback ${TRAVIS_BRANCH}

  echo " - Pushing natives onto branch $TRAVIS_BRANCH"
  git checkout "$TRAVIS_BRANCH"
  git add -v project-native/src/binding/*
  git add -v project-native/src/swig/*
  git commit -v -m "[ci skip] project: update $TRAVIS_OS_NAME natives"
  git pull -q --rebase
  git push https://${GH_TOKEN}@github.com/jvpichowski/swig-template.git
}

if [ "${TRAVIS_PULL_REQUEST}" == "false" ] && [ "${TRAVIS_TAG}" == "" ]; then
  echo "Pushing binaries"
  setup_git
  commit_website_files
  upload_files
else
  echo "Skipping push"
fi
