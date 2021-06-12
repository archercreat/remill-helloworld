

include(FindPkgConfig)

pkg_check_modules(UNICORN REQUIRED unicorn)

message(STATUS "Unicorn libraries: ${UNICORN_LIBRARIES}")
message(STATUS "Unicorn includes: ${UNICORN_INCLUDE_DIRS}")

add_library(UNICORN INTERFACE)
target_include_directories(UNICORN SYSTEM INTERFACE ${UNICORN_INCLUDE_DIRS})
target_link_libraries(UNICORN INTERFACE ${UNICORN_LIBRARIES})