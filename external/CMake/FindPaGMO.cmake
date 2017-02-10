 #    Copyright (c) 2010-2017, Delft University of Technology
 #    All rigths reserved
 #
 #    This file is part of the Tudat. Redistribution and use in source and
 #    binary forms, with or without modification, are permitted exclusively
 #    under the terms of the Modified BSD license. You should have received
 #    a copy of the license with this file. If not, please or visit:
 #    http://tudat.tudelft.nl/LICENSE.
 #
 #    References
 #      FindEigen3.cmake (2-clause BSD license)
 #
 #    Notes
 #	    Sets the following variables:
 #          PAGMO_INCLUDE_DIR    - Source directory to include
 #          PAGMO_LIBRARYDIR     - Path to build static library
 #          PAGMO_VERSION_OK     - True of PaGMO found.
 #	     
 #   	    PAGMO_VERSION        - PaGMO version found e.g. 1.1.5
 #   	    PAGMO_VERSION_MAJOR  - PaGMO major version found e.g. 1
 #   	    PAGMO_VERSION_MINOR  - PaGMO minor version found e.g. 1
 #   	    PAGMO_VERSION_PATCH  - PaGMO patch version found e.g. 5

macro(_pagmo_check_version)
  message(STATUS "Checking for PaGMO in: " ${PAGMO_BASE_PATH})      
  file(READ "${PAGMO_BASE_PATH}/main.cpp" _pagmo_header)
  STRING(REGEX REPLACE "^.*PaGMO ([0-9]+)\\.[0-9]+\\.[0-9]+.*" "\\1" PAGMO_VERSION_MAJOR "${_pagmo_header}")
  STRING(REGEX REPLACE "^.*PaGMO [0-9]+\\.([0-9]+)\\.[0-9]+.*" "\\1" PAGMO_VERSION_MINOR "${_pagmo_header}")
  STRING(REGEX REPLACE "^.*PaGMO [0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" PAGMO_VERSION_PATCH "${_pagmo_header}")

  set(PAGMO_VERSION ${PAGMO_VERSION_MAJOR}.${PAGMO_VERSION_MINOR}.${PAGMO_VERSION_PATCH})

  # Only check version if a required is set.
  if(PaGMO_FIND_VERSION)
    if(${PAGMO_VERSION} VERSION_LESS ${PaGMO_FIND_VERSION})
      set(PAGMO_VERSION_OK FALSE)
    else(${PAGMO_VERSION} VERSION_LESS ${PaGMO_FIND_VERSION})
      set(PAGMO_VERSION_OK TRUE)
    endif(${PAGMO_VERSION} VERSION_LESS ${PaGMO_FIND_VERSION})
  else(PaGMO_FIND_VERSION)
      set(PAGMO_VERSION_OK TRUE)
  endif(PaGMO_FIND_VERSION)

  if(NOT PAGMO_VERSION_OK)
    message(STATUS "PaGMO version ${PAGMO_VERSION} found in ${PAGMO_INCLUDE_DIR}, "
                   "but at least version ${PaGMO_FIND_VERSION} is required!")
  endif(NOT PAGMO_VERSION_OK)

  set(PAGMO_LIBRARY "pagmo")
  set(PAGMO_INCLUDE_DIR ${PAGMO_BASE_PATH}/../)
  set(PAGMO_LIBRARYDIR ${PAGMO_BASE_PATH}/build/src/)
  link_directories(${PAGMO_LIBRARYDIR})
endmacro(_pagmo_check_version)

if(PAGMO_BASE_PATH)

  _pagmo_check_version()
  set(PAGMO_FOUND ${PAGMO_VERSION_OK})

else (PAGMO_BASE_PATH)
  find_path(PAGMO_BASE_PATH NAMES main.cpp
      PATHS
      ${PROJECT_SOURCE_DIR}/../pagmo
      ${PROJECT_SOURCE_DIR}/../../pagmo
      ${PROJECT_SOURCE_DIR}/../../../pagmo
      ${PROJECT_SOURCE_DIR}/../../../../pagmo
      ${PROJECT_SOURCE_DIR}/../../../../../pagmo
    )

  if(PAGMO_BASE_PATH)
    _pagmo_check_version()
  endif(PAGMO_BASE_PATH)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(PaGMO DEFAULT_MSG PAGMO_BASE_PATH PAGMO_VERSION_OK)

  mark_as_advanced(PAGMO_BASE_PATH)

endif(PAGMO_BASE_PATH)
