
option(DEVELOPER_BUILD "Enable developer build. Changes behavior of some components. Useful for developers")
add_feature_info("Enable developer build" DEVELOPER_BUILD "Enable it to change behavior of some components. Useful for developers")

# extra targets for gcc and clang
if(DEVELOPER_BUILD)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GNU")

        set(CMAKE_CXX_FLAGS_INSTRUMENT "-g -Og" CACHE STRING "Flags used by the CXX compiler during INSTRUMENT builds.")
        set(CMAKE_C_FLAGS_INSTRUMENT "-g -Og" CACHE STRING "Flags used by the C compiler during INSTRUMENT builds.")

        set(CMAKE_CXX_FLAGS_PROFILING "-g -Og -pg" CACHE STRING "Flags used by the CXX compiler during PROFILING builds.")
        set(CMAKE_C_FLAGS_PROFILING "-g -Og -pg" CACHE STRING "Flags used by the C compiler during PROFILING builds.")
        set(CMAKE_EXE_LINKER_FLAGS_PROFILING "-pg" CACHE STRING "Flags used by the linker during PROFILING builds.")
        set(CMAKE_MODULE_LINKER_FLAGS_PROFILING "-pg" CACHE STRING "Flags used by the linker during PROFILING builds.")
        set(CMAKE_SHARED_LINKER_FLAGS_PROFILING "-pg" CACHE STRING "Flags used by the linker during PROFILING builds.")

    endif()
endif()

# PRINT TARGET PROPERTIES. Taken from: https://stackoverflow.com/questions/32183975/how-to-print-all-the-properties-of-a-target-in-cmake

# Get all propreties that cmake supports
if(NOT CMAKE_PROPERTY_LIST)
    execute_process(COMMAND cmake --help-property-list OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)
    
    # Convert command output into a CMake list
    string(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
    string(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
endif()
    
function(print_properties)
    message("CMAKE_PROPERTY_LIST = ${CMAKE_PROPERTY_LIST}")
endfunction()
    
function(print_target_properties target)
    if(NOT TARGET ${target})
      message(STATUS "There is no target named '${target}'")
      return()
    endif()

    foreach(property ${CMAKE_PROPERTY_LIST})
        string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" property ${property})

        # Fix https://stackoverflow.com/questions/32197663/how-can-i-remove-the-the-location-property-may-not-be-read-from-target-error-i
        if(property STREQUAL "LOCATION" OR property MATCHES "^LOCATION_" OR property MATCHES "_LOCATION$")
            continue()
        endif()

        get_property(was_set TARGET ${target} PROPERTY ${property} SET)
        if(was_set)
            get_target_property(value ${target} ${property})
            message("${target} ${property} = ${value}")
        endif()
    endforeach()
endfunction()
