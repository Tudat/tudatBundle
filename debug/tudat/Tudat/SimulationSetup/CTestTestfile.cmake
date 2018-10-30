# CMake generated Testfile for 
# Source directory: D:/S/tudat/Tudat/SimulationSetup
# Build directory: D:/S/debug/tudat/Tudat/SimulationSetup
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_EnvironmentCreation "D:/S/tudat/Tudat/../bin/unit_tests/test_EnvironmentCreation")
add_test(test_AccelerationModelCreation "D:/S/tudat/Tudat/../bin/unit_tests/test_AccelerationModelCreation")
subdirs("EstimationSetup")
subdirs("EnvironmentSetup")
subdirs("PropagationSetup")
