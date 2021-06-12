

include(FindPkgConfig)

pkg_check_modules(CAPSTONE REQUIRED capstone)

message(STATUS "Capstone libraries: ${CAPSTONE_LIBRARIES}")
message(STATUS "Capstone includes: ${CAPSTONE_INCLUDE_DIRS}")

add_library(CAPSTONE INTERFACE)
target_include_directories(CAPSTONE SYSTEM INTERFACE ${CAPSTONE_INCLUDE_DIRS})
target_link_libraries(CAPSTONE INTERFACE ${CAPSTONE_LIBRARIES})