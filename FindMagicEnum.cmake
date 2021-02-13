
#rules for finding magic_enum
find_path(MAGIC_ENUM_INCLUDE_DIR magic_enum.hpp)

set(MAGIC_ENUM_INCLUDE_DIRS ${MAGIC_ENUM_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MagicEnum DEFAULT_MSG MAGIC_ENUM_INCLUDE_DIR)

mark_as_advanced(MAGIC_ENUM_INCLUDE_DIR)
