
#rules for finding Botan

find_package(PkgConfig)
pkg_check_modules(PC_BOTAN QUIET botan-2)

find_path(BOTAN_INCLUDE_DIR botan/botan.h
          HINTS ${PC_BOTAN_INCLUDEDIR} ${PC_BOTAN_INCLUDE_DIRS}
)

find_library(BOTAN_LIBRARY
                NAMES botan-2
                HINTS ${PC_BOTAN_LIBDIR} ${PC_BOTAN_LIBRARY_DIRS}
)

set(BOTAN_LIBRARIES ${BOTAN_LIBRARY})
set(BOTAN_INCLUDE_DIRS ${BOTAN_INCLUDE_DIR})
set(BOTAN_VERSION ${PC_BOTAN_VERSION})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Botan
                                    REQUIRED_VARS BOTAN_LIBRARY BOTAN_INCLUDE_DIR
                                    VERSION_VAR BOTAN_VERSION
)

mark_as_advanced(BOTAN_INCLUDE_DIR BOTAN_LIBRARY BOTAN_VERSION)
