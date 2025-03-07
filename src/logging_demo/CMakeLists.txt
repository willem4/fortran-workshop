add_subdirectory(logging)

set(program_name logging_demo)
add_executable(${program_name} main.f90)
target_link_libraries(${program_name} PRIVATE
    logging-lib
    all_compiler_warnings
    compiler_warnings_as_errors
)
