set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_CXX_FLAGS "-m32" CACHE STRING "" FORCE)
set(CMAKE_SKIP_RPATH True)

include_directories(include;include/darwin;)