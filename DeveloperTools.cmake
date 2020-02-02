
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
