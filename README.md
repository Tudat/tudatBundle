# Tudat Bundle
The Tudat bundle contains Tudat and a number of external libraries in a modular fashion. The TU Delft Astrodynamics Toolbox (Tudat) is a set of C++ software libraries for simulating various astrodynamics applications, for more info see [the Tudat website](http://tudat.tudelft.nl).

## Instructions
This document contains minimal information on how to build the Tudat bundle. For more information see documentation below.

### Building the project

1. Clone the repository on your computer (or fork and then clone)

        git clone https://github.com/magnific0/tudatBundle.git

2. Enter the new directory

        cd tudatBundle

3. Checkout all the submodules (optionally you can clone only the necessary submodules)

        git submodule update --init --recursive

4. Make a new build directory and enter

        mkdir build && cd build

5. Initiate CMake for the project

        cmake ../

6. Build the project

        make

Note: it can happen that due to dependencies between the submodules the ```make``` process quits with an error (after building SPICE or JSONCPP, for instance). In this case, please repeat steps 5 and 6 once or twice.

### Switching on/off libraries and applications

1. Edit ```CMakeLists.txt```

2. Comment out or add new ```add_subdirectory``` lines. The argument of ```add_subdirectory``` should be the path containing the library's or application's CMakeLists.txt.

## Documentation

* [Tudat wiki](http://tudat.tudelft.nl/projcets/tudat/wiki)

* [Doxygen](http://tudat.tudelft.nl/Doxygen/Tudat/docs/index.html)
