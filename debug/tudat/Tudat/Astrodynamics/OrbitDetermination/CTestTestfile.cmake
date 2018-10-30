# CMake generated Testfile for 
# Source directory: D:/S/tudat/Tudat/Astrodynamics/OrbitDetermination
# Build directory: D:/S/debug/tudat/Tudat/Astrodynamics/OrbitDetermination
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_EstimationFromPositionDoubleDouble "D:/S/tudat/Tudat/../bin/unit_tests/test_EstimationFromPositionDoubleDouble")
add_test(test_EstimationInput "D:/S/tudat/Tudat/../bin/unit_tests/test_EstimationInput")
add_test(test_TidalPropertyEstimation "D:/S/tudat/Tudat/../bin/unit_tests/test_TidalPropertyEstimation")
add_test(test_MultiArcStateEstimation "D:/S/tudat/Tudat/../bin/unit_tests/test_MultiArcStateEstimation")
add_test(test_HybridArcStateEstimation "D:/S/tudat/Tudat/../bin/unit_tests/test_HybridArcStateEstimation")
add_test(test_ParameterInfluenceDetermination "D:/S/tudat/Tudat/../bin/unit_tests/test_ParameterInfluenceDetermination")
add_test(test_BiasEstimation "D:/S/tudat/Tudat/../bin/unit_tests/test_BiasEstimation")
add_test(test_RotationalStateEstimation "D:/S/tudat/Tudat/../bin/unit_tests/test_RotationalStateEstimation")
subdirs("AccelerationPartials")
subdirs("RotationalDynamicsPartials")
subdirs("EstimatableParameters")
subdirs("ObservationPartials")
