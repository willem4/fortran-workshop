add_subdirectory(hello_world)

add_executable(hello_world main.f90)
target_link_libraries(hello_world PRIVATE
    hello_world-lib
    common-lib
    all_compiler_warnings
    compiler_warnings_as_errors
)
