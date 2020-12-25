
# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
FindExiv2
-------

Finds the Exiv2 library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``exiv2lib``
  The Foo library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``EXIV2_FOUND``
  True if the system has the Exiv2 library.
``EXIV2_INCLUDE_DIRS``
  Include directories needed to use Foo.
``EXIV2_LIBRARIES``
  Libraries needed to link to Foo.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``EXIV2_INCLUDE_DIR``
  The directory containing ``foo.h``.
``EXIV2_LIBRARY_RELEASE``
  The path to the Exiv2 library.
``EXIV2_LIBRARY_DEBUG``
  The path to the Exiv2 library.


based on:
http://www.vtk.org/Wiki/CMake:How_To_Find_Libraries
https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html

#]=======================================================================]


find_path(EXIV2_INCLUDE_DIR exiv2/exiv2.hpp)

find_library(EXIV2_LIBRARY_RELEASE NAMES exiv2)
find_library(EXIV2_LIBRARY_DEBUG NAMES exiv2d)

set(EXIV2_LIBRARIES optimized "${EXIV2_LIBRARY_RELEASE}" debug "${EXIV2_LIBRARY_DEBUG}")
set(EXIV2_INCLUDE_DIRS ${EXIV2_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Exiv2 
	DEFAULT_MSG 
	EXIV2_LIBRARY_RELEASE 
	EXIV2_INCLUDE_DIR
)

mark_as_advanced(EXIV2_INCLUDE_DIR EXIV2_LIBRARY_RELEASE EXIV2_LIBRARY_DEBUG)

if(EXIV2_FOUND)
  if (NOT TARGET exiv2lib)
    add_library(exiv2lib UNKNOWN IMPORTED)
  endif()
  if (EXIV2_LIBRARY_RELEASE)
    set_property(TARGET exiv2lib APPEND PROPERTY
      IMPORTED_CONFIGURATIONS RELEASE
    )
    set_target_properties(exiv2lib PROPERTIES
      IMPORTED_LOCATION_RELEASE "${EXIV2_LIBRARY_RELEASE}"
    )
  endif()
  if (EXIV2_LIBRARY_DEBUG)
    set_property(TARGET exiv2lib APPEND PROPERTY
      IMPORTED_CONFIGURATIONS DEBUG
    )
    set_target_properties(exiv2lib PROPERTIES
      IMPORTED_LOCATION_DEBUG "${EXIV2_LIBRARY_DEBUG}"
    )
  endif()
  set_target_properties(exiv2lib PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${EXIV2_INCLUDE_DIR}"
  )
endif()
