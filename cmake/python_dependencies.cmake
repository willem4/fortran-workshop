find_package(Python3 REQUIRED COMPONENTS Interpreter)
set(VENV_PATH "${CMAKE_SOURCE_DIR}/venv")
set(REQUIREMENTS_FILE "${CMAKE_SOURCE_DIR}/requirements.txt")
set(VENV_LIB_DIR "${VENV_PATH}/Lib")

# Function to get file or directory timestamp
function(get_file_timestamp file output)
    if(WIN32)
        execute_process(
            COMMAND powershell -Command "(Get-Item ${file}).LastWriteTime.ToFileTime()"
            OUTPUT_VARIABLE timestamp
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
    else()
        file(TIMESTAMP ${file} timestamp)
    endif()
    set(${output} ${timestamp} PARENT_SCOPE)
endfunction()

if(NOT EXISTS ${VENV_PATH})
    message(STATUS "Virtual environment not found. Creating virtual environment...")
    execute_process(
        COMMAND ${Python3_EXECUTABLE} -m venv ${VENV_PATH}
        RESULT_VARIABLE result
    )
    if(NOT result EQUAL "0")
        message(FATAL_ERROR "Failed to create virtual environment")
    endif()
endif()

if(WIN32)
    set(pip_executable "${VENV_PATH}/Scripts/pip")
else()
    set(pip_executable "${VENV_PATH}/bin/pip")
endif()

execute_process(
    COMMAND ${pip_executable} install -r ${REQUIREMENTS_FILE}
    RESULT_VARIABLE result
    OUTPUT_VARIABLE COMMAND_OUTPUT
    ERROR_VARIABLE COMMAND_ERROR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(NOT result EQUAL "0")
    message(FATAL_ERROR "Failed to install Python dependencies: ${COMMAND_OUTPUT} ${COMMAND_ERROR}")
endif()
