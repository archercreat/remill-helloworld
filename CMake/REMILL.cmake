
find_package(remill CONFIG REQUIRED HINTS "${remill_DIR}" NO_CMAKE_FIND_ROOT_PATH)

message(STATUS "Found remill ${REMILL_LLVM_VERSION}")

list(APPEND REMILL_LIBRARIES remill_settings remill)
get_target_property(REMILL_INCLUDE_LOCATION remill_settings INTERFACE_INCLUDE_DIRECTORIES)

message(STATUS "remill libraries: ${REMILL_LIBRARIES}")
message(STATUS "remill includes: ${REMILL_INCLUDE_LOCATION}")

add_library(REMILL INTERFACE)
target_include_directories(REMILL SYSTEM INTERFACE ${REMILL_INCLUDE_LOCATION})
target_link_libraries(REMILL INTERFACE ${REMILL_LIBRARIES})
