add_subdirectory(performance)

set(application_name performance_demo)

add_executable(${application_name} main.f90)
target_link_libraries(${application_name} PRIVATE
    performance-lib
    common-lib
    all_compiler_warnings
    compiler_warnings_as_errors
)
