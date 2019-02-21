#!/bin/bash

#
# Installs all dependencies for building linux and windows libraries on linux
#

if [ "${TRAVIS_OS_NAME}" == "linux" ]; then
    echo "installing dependencies for linux build"
    sudo apt-get update
    sudo apt-get install -y swig cmake build-essential g++-multilib mingw-w64
elif [ "${TRAVIS_OS_NAME}" == "osx" ]; then
    echo "installing dependencies for mac build"
    brew install cmake
else 
    echo "target system is not supported: ${TRAVIS_OS_NAME}"
fi