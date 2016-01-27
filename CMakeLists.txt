 #    Copyright (c) 2010-2013, Delft University of Technology
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
 #      110820    S.M. Persson      File created.
 #      111025    K. Kumar          Adapted file to work with Revision 194.
 #      111027    K. Kumar          Updated to auto-search for Eigen3 and Boost; manual setting
 #                                  examples included as comments. Added suppression of warnings
 #                                  from Boost.
 #      111028    K. Kumar          Corrected Boost variables and changed build-type to Debug.
 #      111103    K. Kumar          Updated CMake directory name in module path.
 #      111117    K. Kumar          Added system and filesystem Boost components.
 #      120127    K. Kumar          Adapted for Tudat Core.
 #      120202    K. Kumar          Updated path to TudatCore; added MSVC static runtime fix for
 #                                  use of Boost libraries.
 #      120504    K. Kumar          Removed superfluous include sub-directory and macro.
 #      120913    K. Kumar          Added output message for build type and set default to
 #                                  "Release".
 #      151103    J. Geul           Remove tudatCore references for bundle.
 #
 #    References
 #
 #    Notes
 #

# Specify minimum CMake version required to compile Tudat.
cmake_minimum_required( VERSION 2.8.10 )

# Specific Tudat project name.
project( TudatBundle )

set(BoostComponents filesystem system thread regex date_time unit_test_framework)

# Set root-directory for code to current source directory.
set(PROJECTROOT "${CMAKE_CURRENT_SOURCE_DIR}/")

enable_testing( )

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/tudat/Tudat/External/CMake/")

message(STATUS ${CMAKE_MODULE_PATH})
message(STATUS ${PROJECT_SOURCE_DIR})

find_package(Boost 1.53 COMPONENTS ${BoostComponents})
if(Boost_FOUND)
  message(STATUS "Boost ${Boost_VERSION} found in ${Boost_INCLUDE_DIRS}")
else()
  include(add_boost)
endif()

set(TUDAT_BUILD_DIR "${PROJECTROOT}/tudat")

#
# SPICE
#
set(USE_CSPICE ON)
add_subdirectory( "${PROJECTROOT}/cspice/")

#
# JSONCPP
#
# Add the JSONCPP project and build
set(JSONCPP_WITH_TESTS OFF CACHE BOOL "Building of JSONCPP tests.")
set(JSONCPP_WITH_PKGCONFIG_SUPPORT OFF CACHE BOOL "Buliding of PKGCONFIG files.")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/jsoncpp/lib CACHE PATH "Path for building JSONCPP library in.")
add_subdirectory( "${PROJECTROOT}/jsoncpp/")
# Unset library output dir to prevent screwing with other packages
unset(CMAKE_ARCHIVE_OUTPUT_DIRECTORY CACHE)

#
# NRLMSISE
#
# Add the NRLMSISE project and build
set(NRLMSISE00_WITH_TESTS OFF CACHE BOOL "Building of NRLMSISE00 tests.")
add_subdirectory( "${PROJECTROOT}/nrlmsise-00/")

#
# Tudat and applications
#
add_subdirectory( "${PROJECTROOT}/tudat/Tudat/")
add_subdirectory( "${PROJECTROOT}/tudatExampleApplications/satellitePropagatorExamples/SatellitePropagatorExamples/")
#add_subdirectory( "${PROJECTROOT}/tudatExampleApplications/libraryExamples/SpiceAndJSON/")
#add_subdirectory( "${PROJECTROOT}/tudatExampleApplications/templateApplication/TemplateApplication")

