 #    Copyright (c) 2010-2015, Delft University of Technology
 #    All rights reserved.
 #
 #    Redistribution and use in source and binary forms, with or without modification, are
 #    permitted provided that the following conditions are met:
 #      - Redistributions of source code must retain the above copyright notice, this list of
 #        conditions and the following disclaimer.
 #      - Redistributions in binary form must reproduce the above copyright notice, this list of
 #        conditions and the following disclaimer in the documentation and/or other materials
 #        provided with the distribution.
 #      - Neither the name of the Delft University of Technology nor the names of its contributors
 #        may be used to endorse or promote products derived from this software without specific
 #        prior written permission.
 #
 #    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS
 #    OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 #    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 #    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 #    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 #    GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 #    AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 #    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 #    OF THE POSSIBILITY OF SUCH DAMAGE.
 #
 #    Changelog
 #      YYMMDD    Author            Comment
 #      151120    J. Geul           File created based on FindSpice.cmake (originally FindEigen3.cmake)
 #
 #
 #    References
 #      FindEigen3.cmake.
 #
 #    Notes
 #      This script tries to find JSONCPP library.
 #

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
