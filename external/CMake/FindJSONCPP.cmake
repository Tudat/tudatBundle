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

# If the path has not been set previously or manually, try to autodetect the path
if(NOT JSONCPP_BASE_PATH)
    find_path(JSONCPP_BASE_PATH NAMES json.h
        PATHS
            ${PROJECT_SOURCE_DIR}/External
	    ${PROJECT_SOURCE_DIR}/..
	    ${PROJECT_SOURCE_DIR}/../..
	    ${PROJECT_SOURCE_DIR}/../../..
	    ${PROJECT_SOURCE_DIR}/../../../..
        PATH_SUFFIXES jsoncpp/include/json
)
endif(NOT JSONCPP_BASE_PATH)

# If the path is still not set, then autodetection went wrong
if(NOT JSONCPP_BASE_PATH)

  # Throw a warning and disable JSONCPP
  message(WARNING "WARNING: JSONCPP not found! USE_CJSONCPP flag has been disabled.")
  SET(USE_CJSONCPP false)

else(NOT JSONCPP_BASE_PATH)

  # Good, path has been set/found, now set important variables and find libraries.
  set(JSONCPP_BASE_PATH ${JSONCPP_BASE_PATH}/../..)
  set(JSONCPP_INCLUDE_DIR ${JSONCPP_BASE_PATH}/include)
  set(JSONCPP_LIBRARIES_DIR ${JSONCPP_BASE_PATH}/lib)

  find_library(JSONCPP_LIBRARIES
	NAMES libjsoncpp.a libjsoncpp.lib
	PATHS ${JSONCPP_LIBRARIES_DIR})

  # Force JSONCPP libraries, to be used when JSONCPP and other libraries are simultaneously compiled.
  if(NOT JSONCPP_LIBRARIES)
    set(JSONCPP_LIBRARIES "jsoncpp")
  endif( )

  # Let user know which JSONCPP library was found.
  message(STATUS "JSONCPP_LIBRARIES: ${JSONCPP_LIBRARIES}")

  link_directories(${JSONCPP_LIBRARIES_DIR})

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(JSONCPP DEFAULT_MSG JSONCPP_INCLUDE_DIR)

  mark_as_advanced(JSONCPP_INCLUDE_DIR)

endif(NOT JSONCPP_BASE_PATH)
