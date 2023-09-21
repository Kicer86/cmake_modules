
#rules for finding clang
find_path(CLANG_INCLUDE_DIR clang-c/Index.h)
find_library(CLANG_LIBRARY NAMES libclang)

set(CLANG_INCLUDE_DIRS ${CLANG_INCLUDE_DIR})
set(CLANG_LIBRARIES ${CLANG_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Clang DEFAULT_MSG CLANG_INCLUDE_DIR CLANG_LIBRARY)

mark_as_advanced(CLANG_INCLUDE_DIR CLANG_LIBRARY)
