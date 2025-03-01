add_library(all_compiler_warnings INTERFACE)
set(intel_fortran_windows_all_warning_flags /fpp /stand:f18 "SHELL:/warn:all$<COMMA>errors$<COMMA>stderrors" /check:all)
set(intel_fortran_linux_all_warning_flags -fpp -stand f18 -check all "SHELL:-warn all$<COMMA>errors$<COMMA>stderrors")
set(gcc_all_warning_flags -Wall -pedantic)
target_compile_options(all_compiler_warnings INTERFACE
    "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<Fortran_COMPILER_ID:Intel,IntelLLVM>>:$<IF:$<BOOL:${WIN32}>,${intel_fortran_windows_all_warning_flags},${intel_fortran_linux_all_warning_flags}>>"
    "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<Fortran_COMPILER_ID:GNU>>:${gcc_all_warning_flags}>"
)

add_library(compiler_warnings_as_errors INTERFACE)
set(intel_windows_warning_error_flag /warn:errors)
set(intel_linux_warning_error_flag "SHELL:-warn errors")
set(gcc_warning_error_flag -Werror)
target_compile_options(compiler_warnings_as_errors INTERFACE
    "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<Fortran_COMPILER_ID:GNU>>:${gcc_warning_error_flag}>"
)
