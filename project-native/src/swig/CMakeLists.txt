cmake_minimum_required(VERSION 3.5)

project(project_binding LANGUAGES CXX VERSION 1.0.0)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
find_library(PROJECT_LIB project)
add_library(project_binding SHARED
    project_wrap.cpp
)
target_link_libraries(project_binding "${PROJECT_LIB}")
