cmake_minimum_required(VERSION 3.5)
project(project LANGUAGES CXX VERSION 1.0.0)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
add_library(project SHARED
    project.cpp
)
