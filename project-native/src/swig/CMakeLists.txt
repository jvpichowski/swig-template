cmake_minimum_required(VERSION 3.5)

project(project_binding_32 LANGUAGES CXX VERSION 1.0.0)
project(project_binding_64 LANGUAGES CXX VERSION 1.0.0)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
find_package(JNI REQUIRED)
include_directories(${JNI_INCLUDE_DIRS})
find_library(PROJECT_LIB_32 project_32)
find_library(PROJECT_LIB_64 project_64)

add_library(project_binding_32 SHARED
    project_wrap.cpp
)
add_library(project_binding_64 SHARED
    project_wrap.cpp
)
target_link_libraries(project_binding_64 "${PROJECT_LIB_64}")
target_link_libraries(project_binding_32 "${PROJECT_LIB_32}")
set_target_properties(project_binding_32 PROPERTIES COMPILE_FLAGS "-m32" LINK_FLAGS "-m32")
