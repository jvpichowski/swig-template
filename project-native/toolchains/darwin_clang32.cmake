set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_CXX_FLAGS "-m32" CACHE STRING "" FORCE "-Wl,-rpath,.")

include_directories(include;include/darwin;)