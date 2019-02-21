cmake_minimum_required(VERSION 3.5)
project(project_64 LANGUAGES CXX VERSION 1.0.0)
project(project_32 LANGUAGES CXX VERSION 1.0.0)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
add_library(project_64 SHARED
    project.cpp
)
add_library(project_32 SHARED
    project.cpp
)
set_target_properties(project_32 PROPERTIES COMPILE_FLAGS "-m32" LINK_FLAGS "-m32")
