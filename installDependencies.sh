#!/bin/bash

#
# Installs all dependencies for building linux and windows libraries on linux
#

sudo apt-get update
sudo apt-get install -y swig cmake build-essential g++-multilib mingw-w64
