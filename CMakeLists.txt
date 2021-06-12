cmake_minimum_required(VERSION 3.17)
project(vmv)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Append the CMake module search path so we can use our own modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/CMake)

# Require c++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# LLVM wrapper
include(LLVM)

# Remill wrapper
include(REMILL)

add_executable(${PROJECT_NAME} src/main.cpp src/semantics.h)

target_link_libraries(${PROJECT_NAME} PRIVATE LLVM)
target_link_libraries(${PROJECT_NAME} PRIVATE REMILL)
